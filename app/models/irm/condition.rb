class Irm::Condition < ActiveRecord::Base
  set_table_name :irm_conditions

  has_many :scripts,:foreign_key=>:condition_code,:primary_key=>:condition_code


  table_name

  #多语言关系
  attr_accessor :name,:description
  has_many :conditions_tls,:dependent => :destroy
  acts_as_multilingual

  validates_presence_of :condition_code,:entity_code
  validates_uniqueness_of :condition_code, :if => Proc.new { |i| !i.condition_code.blank? }
  validates_format_of :condition_code, :with => /^[A-Z0-9_]*$/ ,:if=>Proc.new{|i| !i.condition_code.blank?}

  #加入activerecord的通用方法和scope
  query_extend

  scope :query_by_condition_code,lambda{|condition_code|
    where(:condition_code=>condition_code)
  }

  scope :query_wrap_info,lambda{|language| select("irm_conditions.*,irm_conditions_tl.name,irm_conditions_tl.description,"+
                                                          "v1.meaning entity_meaning,v2.meaning status_meaning").
                                                   joins(",irm_lookup_values_vl v1").
                                                   joins(",irm_lookup_values_vl v2").
                                                   where("v1.lookup_type='ENTITY_CODE' AND v1.lookup_code = irm_conditions.entity_code AND "+
                                                         "v2.lookup_type='SYSTEM_STATUS_CODE' AND v2.lookup_code = irm_conditions.status_code AND "+
                                                         "v1.language=? AND v2.language=?",language,language)}

  
end
