class Irm::ScriptsTl < ActiveRecord::Base
  set_table_name :irm_scripts_tl

  belongs_to :script
end
