class Uid::ExternalSystem < ActiveRecord::Base
  set_table_name :uid_external_systems

  has_many :external_systems_tls,:class_name =>"Uid::ExternalSystemsTl",:foreign_key=>"external_system_id"
  attr_accessor :system_name, :system_description
  acts_as_multilingual({:columns =>[:system_name,:system_description],:required=>[:system_name]})  

  query_extend

  validates_uniqueness_of :external_system_code
  validates_presence_of :external_system_code

  scope :with_person, lambda{|person_id|
    joins(",#{Uid::LoginMapping.table_name} lm").
    where("lm.person_id = ?", person_id).
    where("lm.external_system_code = #{table_name}.external_system_code").
    where("lm.company_id = ?", Irm::Company.current.id)
  }

  def wrap_system_name
    self[:system_name]
  end
end
