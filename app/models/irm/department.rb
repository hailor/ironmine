class Irm::Department < ActiveRecord::Base
  set_table_name :irm_departments

  #多语言关系
  attr_accessor :name,:description
  has_many :departments_tls,:dependent => :destroy
  acts_as_multilingual

  validates_presence_of :short_name
  validates_uniqueness_of :short_name, :if => Proc.new { |i| !i.short_name.blank? }
  validates_format_of :short_name, :with => /^[A-Z0-9_]*$/ ,:if=>Proc.new{|i| !i.short_name.blank?}

  #加入activerecord的通用方法和scope
  query_extend

  scope :query_by_short_name,lambda{|short_name|
    where(:short_name=>short_name)
  }

  scope :query_wrap_info,lambda{|language| select("#{table_name}.*,#{Irm::OrganizationsTl.table_name}.name,#{Irm::OrganizationsTl.table_name}.description,"+
                                                          "v1.meaning status_meaning,v2.name company_name,v3.name organization_name").
                                                   joins(",irm_lookup_values_vl v1").
                                                   joins(",irm_companies_vl v2").
                                                   joins(",irm_organizations_vl v3").
                                                   where("v1.lookup_type='SYSTEM_STATUS_CODE' AND v1.lookup_code = #{table_name}.status_code AND "+
                                                         "#{table_name}.company_id = v2.id AND v2.language=? AND "+
                                                         "#{table_name}.organization_id = v3.id AND v3.language=? AND "+
                                                         "v1.language=?",language,language,language)}
end
