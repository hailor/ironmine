class Uid::ExternalLogin < ActiveRecord::Base
  set_table_name :uid_external_logins
  query_extend

  scope :query_by_system,lambda{|language| select("v1.system_name,#{table_name}.*").
                         joins(",uid_external_systems_vl v1").
                         where("v1.external_system_code = #{table_name}.external_system_code "+
                               "AND v1.language = ?",language)}

  scope :query_by_source_type,lambda{|language| select("v2.meaning source_type_name").
                         joins(",irm_lookup_values_vl v2").
                         where("v2.lookup_code = #{table_name}.source_type "+
                               "AND v2.language = ?",language)}
end
