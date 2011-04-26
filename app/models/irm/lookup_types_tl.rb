class Irm::LookupTypesTl < ActiveRecord::Base
  set_table_name :irm_lookup_types_tl

  belongs_to :irm_lookup_types,:class_name=>"Irm::LookupType"


  query_extend
end