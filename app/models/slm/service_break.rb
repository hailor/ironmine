class Slm::ServiceBreak < ActiveRecord::Base
  set_table_name :slm_service_breaks
  query_extend

  scope :query_by_status_meaning,lambda{|language|
                                    joins("JOIN irm_lookup_values_vl v1").
                                    where("v1.lookup_type='SYSTEM_STATUS_CODE' AND v1.lookup_code = #{table_name}.status_code AND v1.language = ?",language).
                                    select("v1.meaning,#{table_name}.* ")
                                  }
end