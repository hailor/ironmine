class Irm::LookupValue < ActiveRecord::Base
  set_table_name :irm_lookup_values

  has_many :lookup_values_tls,:class_name =>"Irm::LookupValuesTl",:foreign_key=>"lookup_value_id"

  attr_accessor :meaning,:description
  #如果语言表里面字段不是name和description的话，需要特别指出
  acts_as_multilingual({:columns =>[:meaning,:description],:required=>[:meaning]})

  query_extend

  #验证lookup_code在lookup_type下面的唯一性
  validates_uniqueness_of :lookup_code,:scope=>:lookup_type

  scope :query_by_lookup_type,lambda{|lookup_type|where(:lookup_type=>lookup_type)}
  scope :query_by_lookup_code,lambda{|lookup_code|where(:lookup_code=>lookup_code)}

  def self.check_lookup_code_exist(lookup_type,lookup_code)
      if Irm::LookupValue.query_by_lookup_code(lookup_code).
          query_by_lookup_type(lookup_type).size>0
         false
      else
         true
      end
  end

  def wrap_meaning
    self[:meaning]
  end
end
