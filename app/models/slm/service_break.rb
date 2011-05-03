class Slm::ServiceBreak < ActiveRecord::Base
  set_table_name :slm_service_breaks
  query_extend

  attr_accessor :start_second,:start_hour,:start_minute
  attr_accessor :end_second,:end_hour,:end_minute

  scope :query_by_service_catalog_id,lambda{|service_catalog_id|where(:service_catalog_id => service_catalog_id)}

  scope :query_by_status_meaning,lambda{|language|
                                    joins("JOIN irm_lookup_values_vl v1").
                                    where("v1.lookup_type='SYSTEM_STATUS_CODE' AND v1.lookup_code = #{table_name}.status_code AND v1.language = ?",language).
                                    select("v1.meaning,#{table_name}.* ")
                                  }

  before_save  :transform_time

  def transform_time
        self.start_time=self.start_hour.rjust(2,"0") + ':' + self.start_minute.rjust(2,"0") +':'+self.start_second.rjust(2,"0")
        self.end_time=self.end_hour.rjust(2,"0") + ':' + self.end_minute.rjust(2,"0") +':'+self.end_second.rjust(2,"0")
  end

  def self.get_max_seq_num(service_catalog_id)
     next_seq_num = self.query_by_service_catalog_id(service_catalog_id).maximum("seq_number")
     if next_seq_num.blank?
       next_seq_num = 10
     else
       next_seq_num = (next_seq_num/10.round + 1)*10
     end
     next_seq_num
  end
end