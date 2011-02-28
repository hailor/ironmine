class Irm::ScriptContextsTl < ActiveRecord::Base
  set_table_name :irm_script_contexts_tl

  belongs_to :script_context

  validates_presence_of :name
end
