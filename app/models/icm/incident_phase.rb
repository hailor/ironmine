class Icm::IncidentPhase < ActiveRecord::Base
  set_table_name :icm_incident_phases

  #多语言关系
  attr_accessor :name,:description
  has_many :incident_phases_tls,:dependent => :destroy
  acts_as_multilingual

  validates_presence_of :phase_code,:display_sequence
  validates_uniqueness_of :phase_code, :if => Proc.new { |i| !i.phase_code.blank? }
  validates_format_of :phase_code, :with => /^[A-Z0-9_]*$/ ,:if=>Proc.new{|i| !i.phase_code.blank?}

  #加入activerecord的通用方法和scope
  query_extend

end
