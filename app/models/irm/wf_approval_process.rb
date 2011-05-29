class Irm::WfApprovalProcess < ActiveRecord::Base
  set_table_name :irm_wf_approval_processes

  attr_accessor :step ,:submitter_value_str


  query_extend

  has_many :wf_approval_submitters,:foreign_key => :process_id

  scope :query_by_step,lambda{|step_id|
    joins("JOIN #{Irm::WfApprovalStep.table_name} ON #{Irm::WfApprovalStep.table_name}.process_id = #{table_name}.id").
    where("#{Irm::WfApprovalStep.table_name}.id = ?",step_id)
  }

  scope :with_mail_template,lambda{|language|
    joins("LEFT OUTER JOIN #{Irm::MailTemplate.view_name} mt ON mt.id = #{table_name}.mail_template_id and mt.language='#{language}'").
    select("mt.name mail_template_name")
  }

  scope :with_record_editability,lambda{|language|
    joins("LEFT OUTER JOIN #{Irm::LookupValue.view_name} editabitity ON editabitity.lookup_type='WF_PROCESS_RECORD_EDITABILITY' AND editabitity.lookup_code = #{table_name}.record_editability AND editabitity.language= '#{language}'").
    select(" editabitity.meaning record_editability_name")
  }

  scope :with_next_approver_mode,lambda{|language|
    joins("LEFT OUTER JOIN #{Irm::ObjectAttribute.view_name} next_approver_mode ON next_approver_mode.attribute_name = #{table_name}.next_approver_mode AND next_approver_mode.business_object_code = 'IRM_PEOPLE' AND next_approver_mode.language= '#{language}'").
    select(" next_approver_mode.name next_approver_mode_name")
  }

  validates_presence_of :bo_code,:name,:process_code,:mail_template_id,:if=>Proc.new{|i| i.check_step(1)}
  validates_format_of :process_code, :with => /^[A-Z0-9_]*$/ ,:if=>Proc.new{|i| i.process_code.present?}


  def self.list_all
    select("#{table_name}.*").with_mail_template(I18n.locale).with_record_editability(I18n.locale).with_next_approver_mode(I18n.locale)
  end

  def check_step(stp)
    self.step.nil?||self.step.to_i>=stp
  end

  # create submitter from str
  def create_submitter_from_str
    return unless self.submitter_value_str
    str_submitters = self.submitter_value_str.split(",").delete_if{|i| !i.present?}
    exists_submitters = Irm::WfApprovalSubmitter.where(:process_id=>self.id)
    exists_submitters.each do |submitter|
      if str_submitters.include?("#{submitter.submitter_type}##{submitter.submitter_id}")
        str_submitters.delete("#{submitter.submitter_type}##{submitter.submitter_id}")
      else
        submitter.destroy
      end

    end

    str_submitters.each do |submitter_str|
      next unless submitter_str.strip.present?
      submitter = submitter_str.strip.split("#")
      self.wf_approval_submitters.build(:submitter_type=>submitter[0],:submitter_id=>submitter[1])
    end if str_submitters.any?
  end

  def delete_self
    Irm::WfApprovalSubmitter.where(:process_id=>self.id).delete_all
    Irm::WfApprovalAction.where(:process_id=>self.id).delete_all
    rule_filter = Irm::RuleFilter.query_by_source(self.class.name,self.id).first
    rule_filter.destroy if rule_filter
    self.destroy
  end


  def change_active(active=true)
    if active
      self.status_code = "ENABLED"
      self.process_order = self.class.enabled.where(:bo_code=>self.bo_code).count+1
    else
      self.status_code = "OFFLINE"
      need_order_processes = self.class.enabled.where("bo_code=? AND id != ? AND process_order >= ?",self.bo_code,self.id,self.process_order).order("process_order")
      start_number = self.process_order
      need_order_processes.each do |process|
        process.update_attributes(:process_order=>start_number) unless start_number.eql?(process.process_order)
        start_number = start_number+1
      end
    end
    self.save

  end
end
