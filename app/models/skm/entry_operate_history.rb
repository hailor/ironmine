class Skm::EntryOperateHistory < ActiveRecord::Base
  set_table_name :skm_entry_operate_histories
  query_extend

  scope :query_history_by_date, select("#{table_name}.search_key,IFNULL(#{table_name}.result_count,0) result_count,
                                       if(#{table_name}.operate_code='ICM_SEARCH',CONCAT('INCIDENT:',inc.title),'ENTRY') source ,concat(peo.last_name,peo.first_name) full_name,DATE_FORMAT(#{table_name}.created_at,'%Y-%m-%d') created_day").
                                joins(",icm_incident_requests inc").
                                joins(",irm_people peo").
                                where("#{table_name}.operate_code in ('ICM_SEARCH','SKM_SEARCH') and inc.id = #{table_name}.incident_id and peo.id = #{table_name}.created_by and #{table_name}.search_key is not null").
                                order("#{table_name}.created_at desc")


end

