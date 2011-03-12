class Irm::LookupValuesTl < ActiveRecord::Base
  set_table_name :irm_lookup_values_tl
  belongs_to :irm_lookup_values,:class_name=>"Irm::LookupValue"

  scope :query_by_lookup_value_id,lambda{|lookup_value_id,language| 
     where("#{table_name}.lookup_value_id = ? and language = ?",lookup_value_id,language)}

  query_extend
end