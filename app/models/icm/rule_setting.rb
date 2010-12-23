class Icm::RuleSetting < ActiveRecord::Base
  set_table_name :icm_rule_settings

  validates_presence_of :assignment_process_code,:company_id

  #加入activerecord的通用方法和scope
  query_extend


  scope :list_all,lambda{
    joins("LEFT OUTER JOIN #{Irm::Company.view_name} ON #{Irm::Company.view_name}.id = #{table_name}.company_id").
    joins("LEFT OUTER JOIN #{Irm::LookupValue.view_name} ON  #{Irm::LookupValue.view_name}.lookup_type = 'ICM_PROCESS_TYPE' AND #{Irm::LookupValue.view_name}.lookup_code = #{table_name}.assignment_process_code AND #{Irm::LookupValue.view_name}.language = #{Irm::Company.view_name}.language").    
    where("#{Irm::Company.view_name}.language = ?",I18n.locale).
    select("#{table_name}.*,#{Irm::Company.view_name}.name company_name,#{Irm::LookupValue.view_name}.meaning process_name")
  }

end
