class Icm::PriorityCode < ActiveRecord::Base
  set_table_name :icm_priority_codes

  #多语言关系
  attr_accessor :name,:description
  has_many :priority_codes_tls,:dependent => :destroy
  acts_as_multilingual

  validates_presence_of :priority_code,:company_id,:low_weight_value,:high_weight_value
  validates_uniqueness_of :priority_code, :if => Proc.new { |i| !i.priority_code.blank? }
  validates_format_of :priority_code, :with => /^[A-Z0-9_]*$/ ,:if=>Proc.new{|i| !i.priority_code.blank?}

  #加入activerecord的通用方法和scope
  query_extend


  scope :with_company,lambda{
    joins("LEFT OUTER JOIN #{Irm::Company.view_name} ON #{Irm::Company.view_name}.id = #{table_name}.company_id AND #{Icm::PriorityCodesTl.table_name}.language = #{Irm::Company.view_name}.language").
    select("#{Irm::Company.view_name}.name company_name")
  }
end
