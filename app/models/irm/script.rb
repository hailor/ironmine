class Irm::Script < ActiveRecord::Base
  set_table_name :irm_scripts

  belongs_to :condition,:foreign_key=>:condition_code,:primary_key=>:condition_code
  belongs_to :action,:foreign_key=>:action_code,:primary_key=>:action_code

  #多语言关系
  attr_accessor :description
  has_many :scripts_tls,:dependent => :destroy
  acts_as_multilingual({:columns=>[:description],:required=>[]})

  validates_presence_of :entity_code,:action_code,:condition_code
  validates_uniqueness_of :action_code,:scope=>[:condition_code],:if => Proc.new { |i| !i.action_code.blank? }  

  #加入activerecord的通用方法和scope
  query_extend
  #查询出相关的action condition
  scope :query_meaning,lambda{
    joins(:condition,:action).
    joins("JOIN #{Irm::ConditionsTl.table_name} ON #{Irm::ConditionsTl.table_name}.condition_id = #{Irm::Condition.table_name}.id and #{Irm::ConditionsTl.table_name}.language = '#{I18n.locale}' ").        
    joins("JOIN #{Irm::ActionsTl.table_name} ON #{Irm::ActionsTl.table_name}.action_id = #{Irm::Action.table_name}.id and #{Irm::ActionsTl.table_name}.language = '#{I18n.locale}'").
    select("#{Irm::Script.table_name}.*,#{Irm::ScriptsTl.table_name}.description").
    select("#{Irm::ConditionsTl.table_name}.name condition_name,#{Irm::ActionsTl.table_name}.name action_name")
  }

  scope :query_by_condition_code,lambda{|condition_code|
    where(:condition_code=>condition_code)
  }

  scope :query_wrap_info,lambda{|language| select("#{Irm::ConditionsTl.table_name}.name condition_name,#{Irm::ActionsTl.table_name}.name action_name,"+
                                                  "#{Irm::Script.table_name}.*,#{Irm::ScriptsTl.table_name}.description,"+
                                                  "v1.meaning entity_meaning,v2.meaning status_meaning").
                                                   joins("JOIN #{Irm::ConditionsTl.table_name} ON #{Irm::ConditionsTl.table_name}.condition_id = #{Irm::Condition.table_name}.id and #{Irm::ConditionsTl.table_name}.language = '#{I18n.locale}' ").
                                                   joins("JOIN #{Irm::ActionsTl.table_name} ON #{Irm::ActionsTl.table_name}.action_id = #{Irm::Action.table_name}.id and #{Irm::ActionsTl.table_name}.language = '#{I18n.locale}'").
                                                   joins(:condition,:action).
                                                   joins(",irm_lookup_values_vl v1").
                                                   joins(",irm_lookup_values_vl v2").
                                                   where("v1.lookup_type='ENTITY_CODE' AND v1.lookup_code = #{table_name}.entity_code AND "+
                                                         "v2.lookup_type='SYSTEM_STATUS_CODE' AND v2.lookup_code = #{table_name}.status_code AND "+
                                                         "v1.language=? AND v2.language=?",language,language)}


end
