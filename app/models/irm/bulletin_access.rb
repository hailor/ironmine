class Irm::BulletinAccess < ActiveRecord::Base
  set_table_name :irm_bulletin_accesses

  belongs_to :irm_bulletins

  scope :query_accessible_with_companies, lambda{
    select("ct.name name, 'COMPANY' type").
      joins(",#{Irm::CompaniesTl.table_name} ct").
      where("ct.company_id = #{table_name}.access_id AND #{table_name}.access_type = 'COMPANY' AND ct.language = ?", I18n.locale)
  }

  scope :query_accessible_with_departments, lambda{
    select("dt.name name, 'DEPARTMENT' type").
      joins(",#{Irm::DepartmentsTl.table_name} dt").
      where("dt.department_id = #{table_name}.access_id AND #{table_name}.access_type = 'DEPARTMENT' AND dt.language = ?", I18n.locale)
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
    d = select_all.with_bulletin(bulletin_id).query_accessible_with_departments
    r = select_all.with_bulletin(bulletin_id).query_accessible_with_roles

    c + d + r
  end
end