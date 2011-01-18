class Skm::EntryStatus < ActiveRecord::Base
  set_table_name :skm_entry_statuses

  #多语言关系
  attr_accessor :name,:description
  has_many :entry_statuses_tls, :dependent => :destroy
  acts_as_multilingual

  validates_presence_of :entry_status_code
  validates_uniqueness_of :entry_status_code

  query_extend
end