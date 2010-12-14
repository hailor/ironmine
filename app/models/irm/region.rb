class Irm::Region < ActiveRecord::Base
  set_table_name :irm_regions
  
  #多语言关系
  attr_accessor :name,:description
  has_many :regions_tls,:dependent => :destroy
  acts_as_multilingual
  
  validates_presence_of :region_code
  validates_uniqueness_of :region_code, :if => Proc.new { |i| !i.region_code.blank? }
  validates_format_of :region_code, :with => /^[A-Z0-9_]*$/ ,:if=>Proc.new{|i| !i.region_code.blank?}

  #加入activerecord的通用方法和scope
  query_extend

  scope :query_by_region_code,lambda{|region_code|
    where(:region_code=>region_code)
  }

  scope :query_wrap_info,lambda{|language| select("#{table_name}.*,#{Irm::RegionsTl.table_name}.name,#{Irm::RegionsTl.table_name}.description,"+
                                                          "v1.meaning status_meaning").
                                                   joins(",irm_lookup_values_vl v1").
                                                   where("v1.lookup_type='SYSTEM_STATUS_CODE' AND v1.lookup_code = #{table_name}.status_code AND "+
                                                         "v1.language=?",language)}
end
