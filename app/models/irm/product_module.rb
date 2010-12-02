class Irm::ProductModule < ActiveRecord::Base
  set_table_name :irm_product_modules
  has_many :product_modules_tls,:foreign_key=>"product_id"
  attr_accessor :name, :description
  #如果语言表里面字段不是name和description的话，需要特别指出
  acts_as_multilingual
  query_extend
end
