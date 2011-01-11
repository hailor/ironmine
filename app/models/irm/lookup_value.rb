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

  scope :query_wrap_info,lambda{|language| select("#{table_name}.*,#{Irm::LookupValuesTl.table_name}.meaning,#{Irm::LookupValuesTl.table_name}.description,"+
                                                          "v1.meaning status_meaning").
                                                   joins(",irm_lookup_values_vl v1").
                                                   where("v1.lookup_type='SYSTEM_STATUS_CODE' AND v1.lookup_code = #{table_name}.status_code AND "+
                                                         "v1.language=?",language)}

  def self.check_lookup_code_exist(lookup_type,lookup_code)
     exist_lookup_code=Irm::LookupValue.query_by_lookup_code(lookup_code).
          query_by_lookup_type(lookup_type)
      if Irm::LookupValue.query_by_lookup_code(lookup_code).
          query_by_lookup_type(lookup_type).size>0
         return false,exist_lookup_code.id
      else
         return true,0
      end

  end

  def self.check_lookup_code(lookup_type,lookup_code)
      if Irm::LookupValue.query_by_lookup_code(lookup_code).
          query_by_lookup_type(lookup_type).size>0
         return false
      else
         return true
      end
  end

  def wrap_meaning
    self[:meaning]
  end
end
