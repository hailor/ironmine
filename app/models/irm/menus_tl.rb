class Irm::MenusTl < ActiveRecord::Base
  set_table_name :irm_menus_tl
  belongs_to :menu

  validates_presence_of :name
end
