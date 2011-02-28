class Irm::ScriptContextFieldsTl < ActiveRecord::Base
  set_table_name :irm_script_context_fields_tl

  belongs_to :script_context_field

  validates_presence_of :name
end
