class Irm::ScriptContextField < ActiveRecord::Base
  set_table_name :irm_script_context_fields
  
  #多语言关系
  attr_accessor :name,:description
  has_many :script_context_fields_tls,:dependent => :destroy
  acts_as_multilingual


  validates_presence_of :context_code
  validates_uniqueness_of :context_code, :if => Proc.new { |i| !i.context_code.blank? }
  validates_format_of :context_code, :with => /^[A-Z0-9_]*$/ ,:if=>Proc.new{|i| !i.context_code.blank?}

  #加入activerecord的通用方法和scope
  query_extend


  scope :query_by_context_code,lambda{|context_code| where(:context_code=>context_code)}
end
