class Irm::Report < ActiveRecord::Base
  set_table_name :irm_reports

  has_many :report_group_members,:foreign_key=>:report_code,:primary_key=>:report_code

  #多语言关系
  attr_accessor :name,:description
  has_many :reports_tls,:dependent => :destroy
  acts_as_multilingual

  validates_presence_of :report_code,:permission_code,:category_code
  validates_uniqueness_of :report_code, :if => Proc.new { |i| !i.report_code.blank? }
  validates_format_of :report_code, :with => /^[A-Z0-9_]*$/ ,:if=>Proc.new{|i| !i.report_code.blank?}

  #加入activerecord的通用方法和scope
  query_extend


  scope :with_permission,lambda{|language|
    joins("LEFT OUTER JOIN #{Irm::Permission.view_name} permissions ON  permissions.permission_code = #{table_name}.permission_code AND  permissions.language = '#{language}'").
    select("permissions.page_controller permission_controller,permissions.page_action permission_action,permissions.name permission_name")
  }

  scope :with_category,lambda{|language|
    joins("LEFT OUTER JOIN #{Irm::LookupValue.view_name} category ON category.lookup_type='IRM_REPORT_CATEGORY' AND category.lookup_code = #{table_name}.category_code AND category.language= '#{language}'").
    select(" category.meaning category_name")
  }

  scope :query_by_group_id,lambda{|group_id|
    joins("JOIN #{Irm::ReportGroupMember.table_name}  ON  #{Irm::ReportGroupMember.table_name}.report_code = #{table_name}.report_code").
    joins("JOIN #{Irm::ReportGroup.table_name} ON  #{Irm::ReportGroup.table_name}.group_code = #{Irm::ReportGroupMember.table_name}.group_code").
    where("#{Irm::ReportGroup.table_name}.id = ?",group_id).
    select("#{Irm::ReportGroupMember.table_name}.id member_id")
  }

  scope :not_in_group,lambda{|group_id|
    where("NOT EXISTS (SELECT 1 FROM #{Irm::ReportGroupMember.table_name} rgm,#{Irm::ReportGroup.table_name} rg WHERE rgm.group_code = rg.group_code AND rgm.report_code = #{table_name}.report_code AND rg.id = ?)",group_id)
  }

  scope :query_by_report_code,lambda{|report_code| where(:report_code=>report_code)}

  scope :query_by_category_code,lambda{|category_code| where(:category_code => category_code)}

  scope :query_by_group_and_category,lambda{|report_group_code,report_purpose,category_code| select("#{table_name}.*").
                                                     joins(",#{Irm::ReportGroupMember.table_name}").
                                                     where("#{Irm::ReportGroupMember.table_name}.group_code = ? AND " +
                                                     "#{Irm::ReportGroupMember.table_name}.report_code = #{table_name}.report_code AND " +
                                                     "#{table_name}.category_code = ? AND #{table_name}.report_purpose = ?",report_group_code,category_code,report_purpose).
                                                     order("#{Irm::ReportGroupMember.table_name}.display_sequence asc")
  }

  def self.list_all
    multilingual.with_permission(I18n.locale).with_category(I18n.locale)
  end

  
end
