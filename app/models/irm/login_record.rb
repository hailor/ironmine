class Irm::LoginRecord < ActiveRecord::Base
  set_table_name :irm_login_records
  #加入activerecord的通用方法和scope
  query_extend

  before_create :setup_os_browser


  scope :query_by_day,select("DATE_FORMAT(#{table_name}.created_at,'%Y-%m-%d') created_day,sum(1) login_count").
                            group("DATE_FORMAT(#{table_name}.created_at,'%Y-%m-%d')").
                            order("DATE_FORMAT(#{table_name}.created_at,'%Y-%m-%d') asc")


  scope :with_person,lambda{
    joins("JOIN #{Irm::Person.table_name} ON #{table_name}.identity_id = #{Irm::Person.table_name}.id").
    select("#{Irm::Person.table_name}.login_name,#{Irm::Person.name_to_sql(nil,Irm::Person.table_name,'full_name')}")
  }

  scope :query_by_person,lambda{|person_id|
    where(:identity_id => person_id)
  }


  def self.list_all
    select("#{table_name}.*").with_person.order("#{table_name}.created_at desc")
  end

  def setup_os_browser
    parser = Irm::UserAgentParser.new(self.user_agent)
    self.operate_system = parser.os
    self.browser = parser.browser
  end
end
