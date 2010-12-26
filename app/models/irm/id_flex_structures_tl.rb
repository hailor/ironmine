class Irm::IdFlexStructuresTl < ActiveRecord::Base
  set_table_name :irm_id_flex_structures_tl
  belongs_to :id_flex_structure, :foreign_key => [:id_flex_code, :id_flex_num]
  validates_presence_of :id_flex_structure_name
end
