class Irm::ReportGroup < ActiveRecord::Base
  set_table_name :irm_report_groups

  has_many :report_group_members,:foreign_key=>:group_code,:primary_key=>:group_code

  #多语言关系
  attr_accessor :name,:description
  has_many :report_groups_tls,:dependent => :destroy
  acts_as_multilingual

  validates_presence_of :group_code
  validates_uniqueness_of :group_code, :if => Proc.new { |i| !i.group_code.blank? }
  validates_format_of :group_code, :with => /^[A-Z0-9_]*$/ ,:if=>Proc.new{|i| !i.group_code.blank?}

  #加入activerecord的通用方法和scope
  query_extend


  scope :query_by_url,lambda{|controller,action|
    joins("JOIN #{Irm::ReportGroupMember.table_name} ON #{Irm::ReportGroupMember.table_name}.group_code = #{table_name}.group_code").
    joins("JOIN #{Irm::Report.table_name} ON  #{Irm::ReportGroupMember.table_name}.report_code = #{Irm::Report.table_name}.report_code").
    where("#{Irm::Report.table_name}.page_controller = ? AND #{Irm::Report.table_name}.page_action = ?",controller,action)
  }
end
