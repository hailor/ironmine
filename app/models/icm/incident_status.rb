class Icm::IncidentStatus < ActiveRecord::Base
  set_table_name :icm_incident_statuses

  #多语言关系
  attr_accessor :name,:description
  has_many :incident_statuses_tls,:dependent => :destroy
  acts_as_multilingual

  validates_presence_of :incident_status_code,:phase_code
  validates_uniqueness_of :incident_status_code, :if => Proc.new { |i| !i.incident_status_code.blank? }
  validates_format_of :incident_status_code, :with => /^[A-Z0-9_]*$/ ,:if=>Proc.new{|i| !i.incident_status_code.blank?}

  #加入activerecord的通用方法和scope
  query_extend

  scope :with_phase,lambda{
    joins("JOIN #{Icm::IncidentPhase.view_name} ON #{Icm::IncidentPhase.view_name}.phase_code = #{table_name}.phase_code AND #{Icm::IncidentPhase.view_name}.language = #{Icm::IncidentStatusesTl.table_name}.language").
    select("#{Icm::IncidentPhase.view_name}.name phase_name")

  }

  scope :query_by_close_flag,lambda{|flag|
    where("#{table_name}.close_flag = ?" ,flag)
  }

  scope :query_by_default_flag,lambda{|flag|
    where("#{table_name}.default_flag = ?" ,flag)
  }

end
