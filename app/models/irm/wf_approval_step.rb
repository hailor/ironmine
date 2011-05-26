class Irm::WfApprovalStep < ActiveRecord::Base
  set_table_name :irm_wf_approval_steps
  attr_accessor :step ,:approver_value_str,:need_order_step_number


  has_many :wf_approval_step_approvers,:foreign_key => :step_id
  query_extend
  before_save :check_attribute
  after_save :setup_process_step_number,:check_attribute

  validates_presence_of :process_id,:name,:step_number,:step_code,:if=>Proc.new{|i| i.check_step(1)}
  validates_uniqueness_of :name,:scope=>[:process_id], :if => Proc.new { |i| i.name.present? }
  validates_uniqueness_of :step_code,:scope=>[:process_id], :if => Proc.new { |i| i.step_code.present? }

  validates_format_of :step_code, :with => /^[A-Z0-9_]*$/ ,:if=>Proc.new{|i| i.step_code.present?}
  validate :validate_step_number,:if=>Proc.new{|i| i.step_number.present?}




  scope :with_reject_behavior,lambda{|language|
    joins("LEFT OUTER JOIN #{Irm::LookupValue.view_name} reject_behavior ON reject_behavior.lookup_type='WF_STEP_REJECT_MODE' AND reject_behavior.lookup_code = #{table_name}.reject_behavior AND reject_behavior.language= '#{language}'").
    select(" reject_behavior.meaning reject_behavior_name")
  }

  scope :with_approver_mode,lambda{|language|
    joins("LEFT OUTER JOIN #{Irm::LookupValue.view_name} approver_mode ON approver_mode.lookup_type='WF_STEP_APPROVER_TYPE' AND approver_mode.lookup_code = #{table_name}.approver_mode AND approver_mode.language= '#{language}'").
    select(" approver_mode.meaning approver_mode_name")
  }

  scope :with_evaluate_result,lambda{|language|
    joins("LEFT OUTER JOIN #{Irm::LookupValue.view_name} evaluate_result ON evaluate_result.lookup_type='WF_STEP_EVALUATE_RESUTL' AND evaluate_result.lookup_code = #{table_name}.evaluate_result AND evaluate_result.language= '#{language}'").
    select(" evaluate_result.meaning evaluate_result_name")
  }



  scope :with_multiple_approver_mode,lambda{|language|
    joins("LEFT OUTER JOIN #{Irm::LookupValue.view_name} multiple_approver_mode ON multiple_approver_mode.lookup_type='WF_STEP_MULIT_APPROVER_MODE' AND multiple_approver_mode.lookup_code = #{table_name}.multiple_approver_mode AND multiple_approver_mode.language= '#{language}'").
    select(" multiple_approver_mode.meaning multiple_approver_mode_name")
  }


  def self.list_all
    select("#{table_name}.*").
        with_reject_behavior(I18n.locale).
        with_approver_mode(I18n.locale).
        with_multiple_approver_mode(I18n.locale).
        with_evaluate_result(I18n.locale)
  end

  def check_step(stp)
    self.step.nil?||self.step.to_i>=stp
  end

  def init_step_number
    return self.step_number if self.step_number
    self.step_number = self.class.where(:process_id=>self.process_id).count+1
    return self.step_number
  end

  # create approver from str
  def create_approver_from_str
    return unless self.approver_value_str
    str_approvers = self.approver_value_str.split(",").delete_if{|i| !i.present?}
    exists_approvers = Irm::WfApprovalStepApprover.where(:step_id=>self.id)
    exists_approvers.each do |approver|
      if str_approvers.include?("#{approver.approver_type}##{approver.approver_id}")
        str_approvers.delete("#{approver.approver_type}##{approver.approver_id}")
      else
        approver.destroy
      end

    end

    str_approvers.each do |approver_str|
      next unless approver_str.strip.present?
      approver = approver_str.strip.split("#")
      self.wf_approval_step_approvers.build(:approver_type=>approver[0],:approver_id=>approver[1])
    end if str_approvers.any?
  end

  def delete_self
    Irm::WfApprovalStepApprover.where(:step_id=>self.id).delete_all
    rule_filter = Irm::RuleFilter.query_by_source(self.class.name,self.id).first
    rule_filter.destroy if rule_filter
    # recalculate step number
    self.prepare_deleted_step_number
    self.destroy
  end


  def validate_step_number
    max_number = self.class.where(:process_id=>self.process_id).count+1
    if self.step_number.to_i<1||self.step_number.to_i>max_number
      self.errors.add(:step_number,I18n.t(:label_irm_wf_approval_step_validate_step_number,:min=>0,:max=>max_number))
      return false
    end
  end
  private  :validate_step_number

  def setup_process_step_number
    need_order_step_number ||=true
    return unless need_order_step_number
    same_number_step = self.class.where("id != ? AND step_number = ?",self.id,self.step_number).first
    return unless same_number_step
    need_order_steps = self.class.where("id != ? AND step_number >= ?",self.id,self.step_number).order("step_number")
    start_number = self.step_number+1
    need_order_steps.each do |step|
      step.update_attributes(:step_number=>start_number,:need_order_step_number=>false) unless start_number.eql?(step.step_number)
      start_number = start_number+1
    end
  end
  private  :setup_process_step_number

  def prepare_deleted_step_number
    need_order_steps = self.class.where("id != ? AND step_number >= ?",self.id,self.step_number).order("step_number")
    start_number = self.step_number
    need_order_steps.each do |step|
      step.update_attributes(:step_number=>start_number,:need_order_step_number=>false) unless start_number.eql?(step.step_number)
      start_number = start_number+1
    end
  end
  protected  :prepare_deleted_step_number

  def check_attribute
    if self.step_number.eql?(1)
      self.reject_behavior = "REJECT_PROCESS"
    end
  end
  private  :check_attribute

end
