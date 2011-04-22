class Slm::ServiceCategory < ActiveRecord::Base
  set_table_name :slm_service_categories

  #多语言关系
  attr_accessor :name,:description
  has_many :service_categories_tls,:dependent => :destroy,:foreign_key=>"service_category_id"
  acts_as_multilingual


  query_extend

  validates_presence_of :category_code
  validates_uniqueness_of :category_code, :if => Proc.new { |i| !i.category_code.blank? }

  

end
