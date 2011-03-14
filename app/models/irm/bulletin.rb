class Irm::Bulletin < ActiveRecord::Base
  set_table_name :irm_bulletins

  scope :with_author, lambda{
    select("concat(pr.last_name, pr.first_name) author")
    joins(",#{Irm::Person.table_name} pr").
        where("pr.id = #{table_name}.author_id")
  }
  scope :select_all, lambda{
    select("#{table_name}.id id, #{table_name}.title bulletin_title, #{table_name}.content, DATE_FORMAT(#{table_name}.created_at, '%Y/%c/%e %H:%I:%S') published_date").
        select("#{table_name}.page_views page_views")
  }

  def self.list_all
    select_all.with_author
  end
end