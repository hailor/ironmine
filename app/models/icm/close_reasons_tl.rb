class Icm::CloseReasonsTl < ActiveRecord::Base
  set_table_name :icm_close_reasons_tl

  belongs_to :close_reason

  validates_presence_of :name
end
