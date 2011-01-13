class Irm::LookupType < ActiveRecord::Base
  set_table_name :irm_lookup_types

  has_many :lookup_types_tls,:class_name =>"Irm::LookupTypesTl",:foreign_key=>"lookup_type_id"

  attr_accessor :meaning,:description
  #如果语言表里面字段不是name和description的话，需要特别指出
  acts_as_multilingual({:columns =>[:meaning,:description],:required=>[:meaning]})

  query_extend

  validates_uniqueness_of :lookup_type
  validates :lookup_type,:presence => true

  scope :query_by_lookup_type,lambda{|lookup_type| where(:lookup_type=>lookup_type)}


  scope :query_wrap_info,lambda{|language| select("#{table_name}.*,#{Irm::LookupTypesTl.table_name}.meaning,#{Irm::LookupTypesTl.table_name}.description,"+
                                                          "v1.meaning status_meaning").
                                                   joins(",irm_lookup_values_vl v1").
                                                   where("v1.lookup_type='SYSTEM_STATUS_CODE' AND v1.lookup_code = #{table_name}.status_code AND "+
                                                         "v1.language=?",language)}

  def wrap_meaning
    self[:meaning]
  end
end
