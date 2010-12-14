class Irm::Currency < ActiveRecord::Base
  set_table_name :irm_currencies
  
  #多语言关系
  attr_accessor :name,:description
  has_many :currencies_tls,:dependent => :destroy
  acts_as_multilingual
  
  validates_presence_of :currency_code
  validates_uniqueness_of :currency_code, :if => Proc.new { |i| !i.currency_code.blank? }
  validates_format_of :currency_code, :with => /^[A-Z0-9_]*$/ ,:if=>Proc.new{|i| !i.currency_code.blank?}

  #加入activerecord的通用方法和scope
  query_extend

  scope :query_by_currency_code,lambda{|currency_code|
    where(:currency_code=>currency_code)
  }

  scope :query_wrap_info,lambda{|language| select("#{table_name}.*,#{Irm::CurrenciesTl.table_name}.name,#{Irm::CurrenciesTl.table_name}.description,"+
                                                          "v1.meaning status_meaning").
                                                   joins(",irm_lookup_values_vl v1").
                                                   where("v1.lookup_type='SYSTEM_STATUS_CODE' AND v1.lookup_code = #{table_name}.status_code AND "+
                                                         "v1.language=?",language)}
end
