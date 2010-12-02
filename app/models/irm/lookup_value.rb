class Irm::LookupValue < ActiveRecord::Base
  set_table_name :irm_lookup_values

  has_many :lookup_values_tls,:class_name =>"Irm::LookupValuesTl",:foreign_key=>"lookup_value_id"

  attr_accessor :meaning,:description
  #如果语言表里面字段不是name和description的话，需要特别指出
  acts_as_multilingual({:columns =>[:meaning,:description],:required=>[:meaning]})

  query_extend
end
