class Irm::Bulletin < ActiveRecord::Base
  set_table_name :irm_bulletins

  has_many :bulletin_accesses
  validates_presence_of :title

  scope :with_author, lambda{
    select("concat(pr.last_name, pr.first_name) author")
    joins(",#{Irm::Person.table_name} pr").
        where("pr.id = #{table_name}.author_id")
  }
  scope :select_all, lambda{
    select("#{table_name}.id id, #{table_name}.title bulletin_title, #{table_name}.content, DATE_FORMAT(#{table_name}.created_at, '%Y/%c/%e %H:%I:%S') published_date").
        select("#{table_name}.page_views page_views, #{table_name}.sticky_flag")
  }

  scope :select_all_top, lambda{
    select("#{table_name}.id id, CONCAT('[#{I18n.t(:label_irm_bulletin_sticky_flag)}] ', #{table_name}.title) bulletin_title, #{table_name}.content, DATE_FORMAT(#{table_name}.created_at, '%Y/%c/%e %H:%I:%S') published_date").
        select("#{table_name}.page_views page_views, #{table_name}.sticky_flag")
  }

  scope :query_accessible_with_companies, lambda{|companies|
    select("ct.name name, 'COMPANY' type").
    joins(",#{Irm::BulletinAccess.table_name} bac").
        joins(",#{Irm::CompaniesTl.table_name} ct").
        where("ct.language = ?", I18n.locale).
        where("ct.company_id = bac.access_id").
        where("bac.bulletin_id = #{table_name}.id").
        where("bac.access_type = ?", "COMPANY").
        where("bac.access_id IN (?)", companies.collect(&:id) + [''])
  }

  scope :query_accessible_with_department, lambda{|department_id|
    select("dt.name name, 'DEPARTMENT' type").
    joins(",#{Irm::BulletinAccess.table_name} bad").
        joins(",#{Irm::DepartmentsTl.table_name} dt").
        where("dt.language = ?", I18n.locale).
        where("dt.department_id = bad.access_id").
        where("bad.access_type = ?", "DEPARTMENT").
        where("bad.bulletin_id = #{table_name}.id").
        where("bad.access_id = ?", department_id)
#    joins("LEFT OUTER JOIN #{Irm::BulletinAccess} bad ON bad.bulletin_id = #{table_name}.id AND bad.access_type = 'DEPARTMENT'").
#        joins("LEFT OUTER JOIN #{Irm::DepartmentsTl} dp ON bad.access_id = dp.department_id AND dp.department_id = #{department_id} AND dp.language = '#{I18n.locale}'")
  }

  scope :query_accessible_with_roles, lambda{|roles|
    select("rt.name name, 'ROLE' type").
    joins(",#{Irm::BulletinAccess.table_name} bar").
        joins(",#{Irm::RolesTl.table_name} rt").
        where("rt.language = ?", I18n.locale).
        where("rt.role_id = bar.access_id").
        where("bar.bulletin_id = #{table_name}.id").
        where("bar.access_type = ?", "ROLE").
        where("bar.access_id IN (?)", roles.collect(&:id) + [''] )
  }

  scope :query_by_author, lambda{|author_id|
    where("#{table_name}.author_id=?", author_id)
  }

  scope :query_accessible_with_nothing, lambda{
    select("' ' name, ' ' type")
  }

  scope :without_access, lambda{
    where("NOT EXISTS (SELECT * FROM #{Irm::BulletinAccess.table_name} ba WHERE ba.bulletin_id = #{table_name}.id )")
  }

  scope :sticky, lambda{
    where("#{table_name}.sticky_flag='Y'")
  }

  scope :unsticky, lambda{
    where("#{table_name}.sticky_flag <> 'Y'")
  }
  def self.list_all
    select_all.with_author
  end

  def self.list_accessible(person_id)
    person = Irm::Person.find(person_id)
    accesses = Irm::CompanyAccess.query_by_person_id(person_id).collect{|c| c.accessable_company_id}
    accessable_companies = Irm::Company.multilingual.query_by_ids(accesses)
    rec = select_all.with_author.query_accessible_with_companies(accessable_companies).unsticky +
          select_all.with_author.query_accessible_with_roles(person.roles).unsticky +
          select_all.with_author.query_accessible_with_department(person.department_id).unsticky +
          #我创建的
          select_all.with_author.query_by_author(person_id).query_accessible_with_nothing.unsticky +
          #没有设置访问权限的
          select_all.with_author.without_access.query_accessible_with_nothing.unsticky

    rec_sticky =  select_all_top.with_author.query_accessible_with_companies(accessable_companies).sticky +
                  select_all_top.with_author.query_accessible_with_roles(person.roles).sticky +
                  select_all_top.with_author.query_accessible_with_department(person.department_id).sticky +
                  #我创建的
                  select_all_top.with_author.query_by_author(person_id).query_accessible_with_nothing.sticky +
                  #没有设置访问权限的
                  select_all_top.with_author.without_access.query_accessible_with_nothing.sticky

    rec_sticky.uniq.sort{|x, y| y[:published_date] <=> x[:published_date] } +
        rec.uniq.sort{|x, y| y[:published_date] <=> x[:published_date] }
  end
end