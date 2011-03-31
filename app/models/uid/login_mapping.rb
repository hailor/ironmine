class Uid::LoginMapping < ActiveRecord::Base
  set_table_name :uid_user_login_mappings
  query_extend

  scope :query_by_system,lambda{|language| select("v1.system_name,#{table_name}.*").
                         joins(",uid_external_systems_vl v1").
                         where("v1.external_system_code = #{table_name}.external_system_code "+
                               "AND v1.language = ?",language)}

  scope :query_by_person,select("CONCAT(#{Irm::Person.table_name}.last_name,#{Irm::Person.table_name}.first_name) person_name").
                         joins(",#{Irm::Person.table_name}").
                         where("#{Irm::Person.table_name}.id = #{table_name}.person_id")


end
