class Irm::SupportGroupsTl < ActiveRecord::Base
  set_table_name :irm_support_groups_tl

  belongs_to :support_group

  validates_presence_of :name
end