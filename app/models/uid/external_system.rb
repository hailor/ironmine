class Uid::ExternalSystem < ActiveRecord::Base
  set_table_name :uid_external_systems

  has_many :external_systems_tls,:class_name =>"Uid::ExternalSystemsTl",:foreign_key=>"external_system_id"
  attr_accessor :system_name,:system_description
  acts_as_multilingual({:columns =>[:system_name,:system_description],:required=>[:system_name]})  

  query_extend

  validates_uniqueness_of :external_system_code
  validates_presence_of :external_system_code


  def wrap_system_name
    self[:system_name]
  end
end
