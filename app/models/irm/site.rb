class Irm::Site < ActiveRecord::Base
  set_table_name :irm_sites

  #多语言关系
  attr_accessor :name,:description
  has_many :sites_tls,:dependent => :destroy
  acts_as_multilingual

  validates_presence_of :site_code
  validates_uniqueness_of :site_code, :if => Proc.new { |i| !i.site_code.blank? }
  validates_format_of :site_code, :with => /^[A-Z0-9_]*$/ ,:if=>Proc.new{|i| !i.site_code.blank?}

  #加入activerecord的通用方法和scope
  query_extend

  scope :query_by_site_code,lambda{|site_code|
    where(:site_code=>site_code)
  }

  scope :query_by_site_group_code,lambda{|site_group_code|
    where(:site_group_code=>site_group_code)
  }

  scope :query_wrap_info,lambda{|language| select("#{table_name}.*,#{Irm::SitesTl.table_name}.name,#{Irm::SitesTl.table_name}.description,"+
                                                          "v1.meaning status_meaning").
                                                   joins(",irm_lookup_values_vl v1").
                                                   where("v1.lookup_type='SYSTEM_STATUS_CODE' AND v1.lookup_code = #{table_name}.status_code AND "+
                                                         "v1.language=?",language)}
end