class Irm::Bulletin < ActiveRecord::Base
  set_table_name :irm_bulletins

  scope :with_author, lambda{
    select("concat(pr.last_name, pr.first_name) author")
    joins("#{Irm::Person.table_name} pr").
        where("pr.id = #{table_name}.author_id")
  }
  scope :select_all, lambda{
    select("*")
  }

  def list_all
    Irm::Bulletin.select_all.with_author
  end
end