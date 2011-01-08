class Irm::IdFlex < ActiveRecord::Base
  set_table_name :irm_id_flexes
  validates_presence_of :id_flex_name
  validates_presence_of :id_flex_code
  validates_uniqueness_of :id_flex_code
  query_extend
end
