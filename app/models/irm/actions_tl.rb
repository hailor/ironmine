class Irm::ActionsTl < ActiveRecord::Base
  set_table_name :irm_actions_tl

  belongs_to :action

  validates_presence_of :name

end