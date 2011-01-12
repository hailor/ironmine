class Irm::ViewColumnsTl < ActiveRecord::Base
  set_table_name :irm_view_columns_tl

  belongs_to :view_column

  validates_presence_of :name

end
