class Irm::BulletinAccess < ActiveRecord::Base
  set_table_name :irm_bulletin_accesses

  belongs_to :irm_bulletins

  scope :query_accessible_with_companies, lambda{
    select("ct.name name, 'COMPANY' type").
      joins(",#{Irm::CompaniesTl.table_name} ct").
      where("ct.company_id = #{table_name}.access_id AND #{table_name}.access_type = 'COMPANY' AND ct.language = ?", I18n.locale)
  }

  scope :query_accessible_with_departments, lambda{
    select("CONCAT(dct.name, ' ', ot.name, ' ' , dt.name) name, 'DEPARTMENT' type").
      joins(",#{Irm::DepartmentsTl.table_name} dt").
      joins(",#{Irm::Department.table_name} dep").
      joins(",#{Irm::OrganizationsTl.table_name} ot").
      joins(",#{Irm::Organization.table_name} org").
      joins(",#{Irm::CompaniesTl.table_name} dct").
      where("dep.id = #{table_name}.access_id").
      where("dt.department_id = #{table_name}.access_id AND #{table_name}.access_type = 'DEPARTMENT' AND dt.language = ?", I18n.locale).
      where("dct.id = dep.company_id").
      where("dct.language = ?", I18n.locale).
      where("ot.organization_id = org.id").
      where("dep.organization_id = org.id").
#      where("org.company_id = dct.company_id").
      where("ot.language = ?", I18n.locale)
  }

  scope :query_accessible_with_organizations, lambda{
    select("CONCAT(dct.name, ' ', ot.name) name, 'ORGANIZATION' type").
      joins(",#{Irm::OrganizationsTl.table_name} ot").
      joins(",#{Irm::Organization.table_name} org").
      joins(",#{Irm::CompaniesTl.table_name} dct").
      where("org.id = #{table_name}.access_id").
      where("ot.organization_id = #{table_name}.access_id AND #{table_name}.access_type = 'ORGANIZATION' AND ot.language = ?", I18n.locale).
      where("org.company_id = dct.company_id").
      where("ot.language = ?", I18n.locale)
  }

  scope :query_accessible_with_roles, lambda{
    select("rt.name name, 'ROLE' type").
      joins(",#{Irm::RolesTl.table_name} rt").
      where("rt.role_id = #{table_name}.access_id AND #{table_name}.access_type = 'ROLE' AND rt.language = ?", I18n.locale)
  }

  scope :with_bulletin, lambda{|bulletin_id|
    where("#{table_name}.bulletin_id = ?", bulletin_id)
  }

  scope :select_all, lambda{
    select("#{table_name}.* ")
  }
  def self.list_all(bulletin_id)
    c = select_all.with_bulletin(bulletin_id).query_accessible_with_companies
    o = select_all.with_bulletin(bulletin_id).query_accessible_with_organizations
    d = select_all.with_bulletin(bulletin_id).query_accessible_with_departments
    r = select_all.with_bulletin(bulletin_id).query_accessible_with_roles

    (c + o + d + r).uniq
  end
end