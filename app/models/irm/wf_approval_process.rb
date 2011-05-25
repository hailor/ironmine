class Irm::WfApprovalProcess < ActiveRecord::Base
  set_table_name :irm_wf_approval_processes

  attr_accessor :step ,:submitter_value_str

  query_extend

  has_many :wf_approval_submitters,:foreign_key => :process_id

  scope :with_mail_template,lambda{|language|
    joins("LEFT OUTER JOIN #{Irm::MailTemplate.view_name} mt ON mt.id = #{table_name}.mail_template_id and mt.language='#{language}'").
    select("mt.name mail_template_name")
  }

  scope :with_record_editability,lambda{|language|
    joins("LEFT OUTER JOIN #{Irm::LookupValue.view_name} editabitity ON editabitity.lookup_type='WF_PROCESS_RECORD_EDITABILITY' AND editabitity.lookup_code = #{table_name}.record_editability AND editabitity.language= '#{language}'").
    select(" editabitity.meaning record_editability_name")
  }

  validates_presence_of :bo_code,:name,:process_code,:mail_template_id,:if=>Proc.new{|i| i.check_step(1)}
  validates_format_of :process_code, :with => /^[A-Z0-9_]*$/ ,:if=>Proc.new{|i| i.process_code.present?}


  def self.list_all
    select("#{table_name}.*").with_mail_template(I18n.locale).with_record_editability(I18n.locale)
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

end
