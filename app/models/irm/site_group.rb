class Irm::SiteGroup < ActiveRecord::Base
  set_table_name :irm_site_groups
  
  #多语言关系
  attr_accessor :name,:description
  has_many :site_groups_tls,:dependent => :destroy
  acts_as_multilingual
  
  validates_presence_of :group_code,:region_code
  validates_uniqueness_of :group_code, :if => Proc.new { |i| !i.group_code.blank? }
  validates_format_of :group_code, :with => /^[A-Z0-9_]*$/ ,:if=>Proc.new{|i| !i.group_code.blank?}

  #加入activerecord的通用方法和scope
  query_extend

  scope :query_by_group_code,lambda{|group_code|
    where(:group_code=>group_code)
  }

  scope :query_by_region_code,lambda{|region_code|
    where(:region_code=>region_code)
  }

  scope :query_wrap_info,lambda{|language| select("#{table_name}.*,#{Irm::SiteGroupsTl.table_name}.name,#{Irm::SiteGroupsTl.table_name}.description,"+
                                                          "v1.meaning status_meaning,v2.name region_name").
                                                   joins(",irm_lookup_values_vl v1").
                                                   joins(",irm_regions_vl v2").
                                                   where("v1.lookup_type='SYSTEM_STATUS_CODE' AND v1.lookup_code = #{table_name}.status_code AND "+
                                                         "v2.region_code=#{table_name}.region_code AND v2.language = ? AND "+
                                                         "v1.language=?",language,language)}
end
