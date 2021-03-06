class Icm::GroupAssignment < ActiveRecord::Base
  set_table_name :icm_group_assignments

  scope :with_company, lambda {
    select("ct.name company_name").
        joins("LEFT OUTER JOIN #{Irm::Company.table_name} c ON c.id = #{table_name}.customer_company_id").
        joins("LEFT OUTER JOIN #{Irm::CompaniesTl.table_name} ct ON ct.language = '#{I18n.locale}' AND c.id = ct.company_id")
  }
  scope :with_department, lambda {
    select("dt.name department_name").
        joins("LEFT OUTER JOIN #{Irm::Department.table_name} d ON d.id = #{table_name}.customer_department_id").
        joins("LEFT OUTER JOIN #{Irm::DepartmentsTl.table_name} dt ON dt.language = '#{I18n.locale}' AND d.id = dt.department_id")
  }
  scope :with_site, lambda {
    select("st.name site_name").
        joins("LEFT OUTER JOIN #{Irm::Site.table_name} s ON s.site_code = #{table_name}.customer_site_code").
        joins("LEFT OUTER JOIN #{Irm::SitesTl.table_name} st ON st.language = '#{I18n.locale}' AND s.id = st.site_id")
  }
  scope :with_site_group, lambda {
    select("sgt.name site_group_name").
        joins("LEFT OUTER JOIN #{Irm::SiteGroup.table_name} sg ON sg.group_code = #{table_name}.customer_site_group_code").
        joins("LEFT OUTER JOIN #{Irm::SiteGroupsTl.table_name} sgt ON sgt.language = '#{I18n.locale}' AND sg.id = sgt.site_group_id")
  }
  scope :with_person, lambda {
    select("concat(ps.last_name, ps.first_name) person_name").
        joins("LEFT OUTER JOIN #{Irm::Person.table_name} ps ON ps.id = #{table_name}.customer_person_id")
  }
  scope :with_support_group, lambda {
    select("sut.name support_group_name").
        joins("LEFT OUTER JOIN #{Irm::SupportGroup.table_name} su ON su.group_code = #{table_name}.support_group_code").
        joins("LEFT OUTER JOIN #{Irm::SupportGroupsTl.table_name} sut ON sut.language = '#{I18n.locale}' AND su.id = sut.support_group_id")
  }
  scope :with_organizations, lambda {
    select("ot.name organization_name").
        joins("LEFT OUTER JOIN #{Irm::Organization.table_name} o ON o.id = #{table_name}.customer_organization_id").
        joins("LEFT OUTER JOIN #{Irm::OrganizationsTl.table_name} ot ON ot.language = '#{I18n.locale}' AND o.id = ot.organization_id")
  }

  scope :assignable,lambda{
    joins("JOIN #{Irm::SupportGroup.table_name}  ON #{Irm::SupportGroup.table_name}.group_code = #{table_name}.support_group_code AND #{Irm::SupportGroup.table_name}.oncall_group_flag = 'Y' AND #{Irm::SupportGroup.table_name}.status_code = 'ENABLED'")
  }

  scope :query_by_company, lambda{|company_id|
    where("#{table_name}.customer_company_id = ?", company_id)
  }

  scope :query_by_department, lambda{|department_id|
    where("#{table_name}.customer_department_id = ?", department_id)
  }

  scope :query_by_sites, lambda{|sites|
    where("#{table_name}.customer_site_code IN (?)", sites.collect(&:site_code) + [''])
  }

  scope :query_by_site_groups, lambda{|site_groups|
    where("#{table_name}.customer_site_group_code IN (?)", site_groups.collect(&:group_code) + [''])
  }

  scope :query_by_person, lambda {|person_id|
    where("#{table_name}.customer_person_id = ?", person_id)
  }

  scope :query_by_support_groups, lambda{|support_group_id|
    where("#{table_name}.support_group_code = ?", support_group_id)
  }

  scope :query_by_organization, lambda{|organization_id|
    where("#{table_name}.customer_organization_id = ?", organization_id)
  }

  
  scope :list_all, lambda {
    select("#{table_name}.*").
        with_person.
        with_department.
        with_organizations.
        with_company.
        with_support_group
  }
end