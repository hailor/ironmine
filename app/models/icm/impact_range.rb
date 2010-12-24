class Icm::ImpactRange < ActiveRecord::Base
  set_table_name :icm_impact_ranges

  #多语言关系
  attr_accessor :name,:description
  has_many :impact_ranges_tls,:dependent => :destroy
  acts_as_multilingual

  validates_presence_of :impact_code,:company_id,:weight_values
  validates_uniqueness_of :impact_code, :if => Proc.new { |i| !i.impact_code.blank? }
  validates_format_of :impact_code, :with => /^[A-Z0-9_]*$/ ,:if=>Proc.new{|i| !i.impact_code.blank?}

  #加入activerecord的通用方法和scope
  query_extend


  scope :list_all,lambda{
    joins("LEFT OUTER JOIN #{Irm::Company.view_name} ON #{Irm::Company.view_name}.id = #{table_name}.company_id AND #{Icm::ImpactRangesTl.table_name}.language = #{Irm::Company.view_name}.language").
    select("#{table_name}.*,#{Icm::ImpactRangesTl.table_name}.name,#{Icm::ImpactRangesTl.table_name}.description,#{Irm::Company.view_name}.name company_name")
  }
  
end
