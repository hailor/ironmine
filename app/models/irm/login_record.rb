class Irm::LoginRecord < ActiveRecord::Base
  set_table_name :irm_login_records
  #加入activerecord的通用方法和scope
  query_extend

  before_create :setup_os_browser

  scope :query_with_info,lambda{
    joins(" LEFT OUTER JOIN #{Irm::Identity.table_name} ON #{Irm::Identity.table_name}.id = #{table_name}.identity_id").
    select("#{Irm::Identity.table_name}.full_name,#{Irm::Identity.table_name}.login_name").
    select("#{table_name}.user_ip,#{table_name}.operate_system,#{table_name}.browser,#{table_name}.login_at,#{table_name}.logout_at")
  }

  def setup_os_browser
    parser = Irm::UserAgentParser.new(self.user_agent)
    self.operate_system = parser.os
    self.browser = parser.browser
  end
end
