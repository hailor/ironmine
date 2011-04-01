class Uid::LoginMapping < ActiveRecord::Base
  set_table_name :uid_user_login_mappings



  query_extend



  scope :with_external_system,lambda{|language|
    joins("JOIN #{Uid::ExternalSystem.view_name} ON #{Uid::ExternalSystem.view_name}.external_system_code = #{table_name}.external_system_code AND #{Uid::ExternalSystem.view_name}.language = '#{language}'").
    select("#{Uid::ExternalSystem.view_name}.system_name,#{Uid::ExternalSystem.view_name}.id system_id")
  }

  scope :with_person,lambda{
    joins("JOIN #{Irm::Person.table_name} ON #{table_name}.person_id = #{Irm::Person.table_name}.id").
    select("#{Irm::Person.table_name}.login_name,#{Irm::Person.name_to_sql(nil,Irm::Person.table_name,'person_name')}")
  }

  def self.list_all
    select("#{table_name}.*").with_external_system(I18n.locale).with_person
  end

end
