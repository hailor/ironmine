class Irm::LookupValuesTl < ActiveRecord::Base
  set_table_name :irm_lookup_values_tl

  belongs_to :irm_lookup_values,:class_name=>"Irm::LookupValue"

  query_extend
end