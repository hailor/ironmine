class Icm::CloseReason < ActiveRecord::Base
  set_table_name :icm_close_reasons

  #多语言关系
  attr_accessor :name,:description
  has_many :close_reasons_tls,:dependent => :destroy
  acts_as_multilingual

  validates_presence_of :close_code,:company_id,:category_id
  validates_uniqueness_of :close_code, :if => Proc.new { |i| !i.close_code.blank? }
  validates_format_of :close_code, :with => /^[A-Z0-9_]*$/ ,:if=>Proc.new{|i| !i.close_code.blank?}

  #加入activerecord的通用方法和scope
  query_extend


  scope :list_all,lambda{
    joins("LEFT OUTER JOIN #{Irm::LookupValue.view_name} ON  #{Irm::LookupValue.view_name}.lookup_type = 'ICM_CLOSE_REASON_TYPE' AND #{Irm::LookupValue.view_name}.id = #{table_name}.category_id AND #{Icm::CloseReasonsTl.table_name}.language = #{Irm::LookupValue.view_name}.language").
    joins("LEFT OUTER JOIN #{Irm::Company.view_name} ON #{Irm::Company.view_name}.id = #{table_name}.company_id").
    select("#{table_name}.*,#{Irm::LookupValue.view_name}.meaning category_name,#{Icm::CloseReasonsTl.table_name}.name,#{Irm::Company.view_name}.name company_name")
  }
end
