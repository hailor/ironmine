class Icm::RuleSetting < ActiveRecord::Base
  set_table_name :icm_rule_settings

  validates_presence_of :company_id ,:assignment_process_code
  validates_uniqueness_of :company_id

  #加入activerecord的通用方法和scope
  query_extend


  # 查询公司
  scope :with_company,lambda{|language|
    joins("LEFT OUTER JOIN #{Irm::Company.view_name} company ON  company.id = #{table_name}.company_id AND company.language= '#{language}'").
    select(" company.name company_name")
  }

  # 查询出Process type
  scope :with_process_type,lambda{|language|
    joins("LEFT OUTER JOIN #{Irm::LookupValue.view_name} process_type ON process_type.lookup_type='ICM_ASSIGN_PROCESS_TYPE' AND process_type.lookup_code = #{table_name}.assignment_process_code AND process_type.language= '#{language}'").
    select(" process_type.meaning process_name")
  }

  def self.list_all
    select("#{table_name}.*").with_company(I18n.locale).with_process_type(I18n.locale).status_meaning
  end

end
