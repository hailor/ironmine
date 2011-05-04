class Irm::LdapSynInterface < ActiveRecord::Base
  set_table_name :irm_ldap_syn_interface
  scope :find_distinct_companies,lambda{|prc_id|
    select("distinct #{table_name}.comp_short_name short_name,"+
           "#{table_name}.comp_company_type company_type,"+
           "#{table_name}.comp_time_zone time_zone,"+
           "#{table_name}.comp_currency_code currency_code,"+
           "#{table_name}.comp_cost_center_code cost_center_code,"+
           "#{table_name}.comp_budget_code budget_code,"+
           "#{table_name}.comp_hotline hotline,"+
           "#{table_name}.comp_home_page home_page,"+
           "#{table_name}.comp_support_manager support_manager,"+
           "#{table_name}.comp_type type,"+
           "#{table_name}.comp_name name,"+
           "#{table_name}.comp_description description,"+
           "#{table_name}.comp_status_code status_code,"+
           "#{table_name}.comp_dn ldap_dn").
    where("process_id=?",prc_id)
  }

  scope :find_distinct_organizations,lambda{|prc_id,company_dn|
    select("distinct #{table_name}.org_short_name short_name,"+
               "#{table_name}.org_name name,"+
               "#{table_name}.org_description description,"+
               "#{table_name}.org_status_code status_code,"+
               "#{table_name}.org_dn ldap_dn").
    where("#{table_name}.process_id=? and #{table_name}.comp_dn=?",prc_id,company_dn)
  }

  scope :find_distinct_departments,lambda{|prc_id,company_dn,organization_dn|
    select("distinct #{table_name}.dept_short_name short_name,"+
               "#{table_name}.dept_name name,"+
               "#{table_name}.dept_description description,"+
               "#{table_name}.dept_status_code status_code,"+
               "#{table_name}.dept_dn ldap_dn").
    where("#{table_name}.process_id=? and #{table_name}.comp_dn=? and #{table_name}.org_dn=?",prc_id,company_dn,organization_dn)
  }
end
