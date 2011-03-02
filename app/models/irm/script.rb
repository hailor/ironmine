class Irm::Script < ActiveRecord::Base
  set_table_name :irm_scripts

  belongs_to :condition,:foreign_key=>:condition_code,:primary_key=>:condition_code
  belongs_to :action,:foreign_key=>:action_code,:primary_key=>:action_code

  #多语言关系
  attr_accessor :description
  has_many :scripts_tls,:dependent => :destroy
  acts_as_multilingual({:columns=>[:description],:required=>[]})

  validates_presence_of :action_code,:condition_code
  validates_uniqueness_of :action_code,:scope=>[:condition_code,:template_code],:if => Proc.new { |i| !i.action_code.blank? }

  #加入activerecord的通用方法和scope
  query_extend

  scope :with_condition,lambda{|language|
    joins("LEFT OUTER JOIN #{Irm::Condition.view_name}  ON  #{Irm::Condition.view_name}.condition_code = #{table_name}.condition_code AND  #{Irm::Condition.view_name}.language = '#{language}'").    
    joins("LEFT OUTER JOIN #{Irm::ScriptContext.view_name}  ON  #{Irm::ScriptContext.view_name}.context_code = #{Irm::Condition.view_name}.context_code AND  #{Irm::ScriptContext.view_name}.language = '#{language}'").
    select("#{Irm::ScriptContext.view_name}.id context_id,#{Irm::ScriptContext.view_name}.name context_name,#{Irm::ScriptContext.view_name}.description context_description").
    select("#{Irm::Condition.view_name}.id condition_id,#{Irm::Condition.view_name}.name condition_name,#{Irm::Condition.view_name}.description condition_description")        
  }
  scope :with_action,lambda{|language|
    joins("LEFT OUTER JOIN #{Irm::Action.view_name}  ON  #{Irm::Action.view_name}.action_code = #{table_name}.action_code AND  #{Irm::Action.view_name}.language = '#{language}'").
    select("#{Irm::Action.view_name}.id action_id,#{Irm::Action.view_name}.name action_name,#{Irm::Action.view_name}.description action_description")
  }

  scope :with_template,lambda{|language|
    joins("LEFT OUTER JOIN #{Irm::MailTemplate.view_name}  ON  #{Irm::MailTemplate.view_name}.template_code = #{table_name}.template_code AND  #{Irm::MailTemplate.view_name}.language = '#{language}'").
    select("#{Irm::MailTemplate.view_name}.id template_id,#{Irm::MailTemplate.view_name}.name template_name,#{Irm::MailTemplate.view_name}.description template_description")
  }

  scope :query_by_condition_code,lambda{|condition_code|
    where(:condition_code=>condition_code)
  }

  scope :select_all,lambda{select("#{table_name}.*")}

  def self.list_all
    select_all.multilingual.with_condition(I18n.locale).with_action(I18n.locale).with_template(I18n.locale).status_meaning
  end
  
end
