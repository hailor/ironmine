class Irm::Action < ActiveRecord::Base
  set_table_name :irm_actions

  has_many :scripts,:foreign_key=>:action_code,:primary_key=>:action_code

  #多语言关系
  attr_accessor :name,:description
  has_many :actions_tls,:dependent => :destroy
  acts_as_multilingual

  validates_presence_of :action_code,:handler,:entity_code
  validates_uniqueness_of :action_code, :if => Proc.new { |i| !i.action_code.blank? }
  validates_format_of :action_code, :with => /^[A-Z0-9_]*$/ ,:if=>Proc.new{|i| !i.action_code.blank?}

  #加入activerecord的通用方法和scope
  query_extend

  scope :query_by_action_code,lambda{|action_code|
    where(:action_code=>action_code)
  }
  
  
  scope :query_wrap_info,lambda{|language| select("irm_actions.*,irm_actions_tl.name,irm_actions_tl.description,"+
                                                          "v1.meaning entity_meaning,v2.meaning status_meaning").
                                                   joins(",irm_lookup_values_vl v1").
                                                   joins(",irm_lookup_values_vl v2").
                                                   where("v1.lookup_type='ENTITY_CODE' AND v1.lookup_code = irm_actions.entity_code AND "+
                                                         "v2.lookup_type='SYSTEM_STATUS_CODE' AND v2.lookup_code = irm_actions.status_code AND "+
                                                         "v1.language=? AND v2.language=?",language,language)}


end