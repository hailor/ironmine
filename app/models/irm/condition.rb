class Irm::Condition < ActiveRecord::Base
  set_table_name :irm_conditions

  has_many :scripts,:foreign_key=>:condition_code,:primary_key=>:condition_code

  #多语言关系
  attr_accessor :name,:description
  has_many :conditions_tls,:dependent => :destroy
  acts_as_multilingual

  validates_presence_of :condition_code,:context_code
  validates_uniqueness_of :condition_code, :if => Proc.new { |i| !i.condition_code.blank? }
  validates_format_of :condition_code, :with => /^[A-Z0-9_]*$/ ,:if=>Proc.new{|i| !i.condition_code.blank?}

  #加入activerecord的通用方法和scope
  query_extend

  scope :query_by_condition_code,lambda{|condition_code|
    where(:condition_code=>condition_code)
  }

  scope :with_context,lambda{|language|
    joins("LEFT OUTER JOIN #{Irm::ScriptContext.view_name}  ON  #{Irm::ScriptContext.view_name}.context_code = #{table_name}.context_code AND  #{Irm::ScriptContext.view_name}.language = '#{language}'").
    select("#{Irm::ScriptContext.view_name}.id context_id,#{Irm::ScriptContext.view_name}.name context_name,#{Irm::ScriptContext.view_name}.description context_description")
  }

  scope :select_all,lambda{select("#{table_name}.*")}

  def self.list_all
    multilingual.select_all.with_context(I18n.locale).status_meaning
  end
end
