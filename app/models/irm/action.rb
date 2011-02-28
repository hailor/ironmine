class Irm::Action < ActiveRecord::Base
  set_table_name :irm_actions

  has_many :scripts,:foreign_key=>:action_code,:primary_key=>:action_code

  #多语言关系
  attr_accessor :name,:description
  has_many :actions_tls,:dependent => :destroy
  acts_as_multilingual

  validates_presence_of :action_code,:handler
  validates_uniqueness_of :action_code, :if => Proc.new { |i| !i.action_code.blank? }
  validates_format_of :action_code, :with => /^[A-Z0-9_]*$/ ,:if=>Proc.new{|i| !i.action_code.blank?}

  #加入activerecord的通用方法和scope
  query_extend

  scope :query_by_action_code,lambda{|action_code|
    where(:action_code=>action_code)
  }
  scope :select_all,lambda{select("#{table_name}.*")}
  
  def self.list_all
    select_all.multilingual.status_meaning
  end


end