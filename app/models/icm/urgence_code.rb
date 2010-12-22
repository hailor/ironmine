class Icm::UrgenceCode < ActiveRecord::Base
  set_table_name :icm_urgence_codes

  #多语言关系
  attr_accessor :name,:description
  has_many :urgence_codes_tls,:dependent => :destroy
  acts_as_multilingual

  validates_presence_of :urgency_code,:company_id,:weight_values
  validates_uniqueness_of :urgency_code, :if => Proc.new { |i| !i.urgency_code.blank? }
  validates_format_of :urgency_code, :with => /^[A-Z0-9_]*$/ ,:if=>Proc.new{|i| !i.urgency_code.blank?}

  #加入activerecord的通用方法和scope
  query_extend


  scope :list_all,lambda{
    joins("LEFT OUTER JOIN #{Irm::Company.view_name} ON #{Irm::Company.view_name}.id = #{table_name}.company_id").
    select("#{table_name}.*,#{Icm::UrgenceCodesTl.table_name}.name,#{Icm::UrgenceCodesTl.table_name}.description,#{Irm::Company.view_name}.name company_name")
  }
end
