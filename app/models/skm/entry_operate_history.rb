class Skm::EntryOperateHistory < ActiveRecord::Base
  set_table_name :skm_entry_operate_histories
  query_extend

  scope :query_history_by_date, select("#{table_name}.search_key,IFNULL(#{table_name}.result_count,0) result_count,
                                       if(#{table_name}.operate_code='ICM_SEARCH',CONCAT('INCIDENT:',inc.title),'ENTRY') source ,concat(peo.last_name,peo.first_name) full_name,DATE_FORMAT(#{table_name}.created_at,'%Y-%m-%d') created_day").
                                joins(",icm_incident_requests inc").
                                joins(",irm_people peo").
                                where("#{table_name}.operate_code in ('ICM_SEARCH','SKM_SEARCH') and inc.id = #{table_name}.incident_id and peo.id = #{table_name}.created_by and #{table_name}.search_key is not null").
                                order("#{table_name}.created_at desc")


  scope :get_entry_show_history,lambda{|language| select("enh.entry_title,#{table_name}.version_number,cop.name company_name,concat(peo.last_name,peo.first_name) full_name,
                                        DATE_FORMAT(enh.created_at,'%Y-%m-%d') created_day,count(*) result_count").
                                joins(",skm_entry_headers enh").
                                joins(",irm_companies_tl cop").
                                joins(",irm_people peo").
                                where("#{table_name}.operate_code in ('ICM_APPLY','SKM_SHOW') and #{table_name}.company_id = cop.company_id and #{table_name}.entry_id = enh.id and enh.created_by = peo.id
                                      and cop.language='#{language}'").
                                group("enh.entry_title,#{table_name}.version_number,cop.name,peo.last_name,peo.first_name,enh.created_at").
                                order("result_count desc")}

  scope :get_entry_apply_history,lambda{|language| select("enh.entry_title,#{table_name}.version_number,cop.name company_name,concat(peo.last_name,peo.first_name) full_name,
                                        DATE_FORMAT(enh.created_at,'%Y-%m-%d') created_day,count(*) result_count").
                                joins(",skm_entry_headers enh").
                                joins(",irm_companies_tl cop").
                                joins(",irm_people peo").
                                where("#{table_name}.operate_code = 'ICM_APPLY' and #{table_name}.company_id = cop.company_id and #{table_name}.entry_id = enh.id and enh.created_by = peo.id
                                      and cop.language='#{language}'").
                                group("enh.entry_title,#{table_name}.version_number,cop.name,peo.last_name,peo.first_name,enh.created_at").
                                order("result_count desc") }
end