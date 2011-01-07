class Icm::IncidentStatus < ActiveRecord::Base
  set_table_name :icm_incident_statuses

  #多语言关系
  attr_accessor :name,:description
  has_many :incident_statuses_tls,:dependent => :destroy
  acts_as_multilingual

  validates_presence_of :incident_status_code,:company_id
  validates_uniqueness_of :incident_status_code, :if => Proc.new { |i| !i.incident_status_code.blank? }
  validates_format_of :incident_status_code, :with => /^[A-Z0-9_]*$/ ,:if=>Proc.new{|i| !i.incident_status_code.blank?}

  #加入activerecord的通用方法和scope
  query_extend


  scope :list_all,lambda{|language|
    joins("LEFT OUTER JOIN #{Irm::Company.view_name} ON #{Irm::Company.view_name}.id = #{table_name}.company_id AND #{Icm::IncidentStatusesTl.table_name}.language = #{Irm::Company.view_name}.language").
    joins(",irm_lookup_values_vl v1").
    where("v1.lookup_type='SYSTEM_STATUS_CODE' AND v1.lookup_code = #{table_name}.status_code AND v1.language=?",language).
    select("#{table_name}.*,#{Icm::IncidentStatusesTl.table_name}.name,#{Irm::Company.view_name}.name company_name,v1.meaning status_meaning")
  }
end
