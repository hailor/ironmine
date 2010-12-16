class Irm::Organization < ActiveRecord::Base
  set_table_name :irm_organizations

  #多语言关系
  attr_accessor :name,:description
  has_many :organizations_tls,:dependent => :destroy
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
                                                          "v1.meaning status_meaning").
                                                   joins(",irm_lookup_values_vl v1").
                                                   where("v1.lookup_type='SYSTEM_STATUS_CODE' AND v1.lookup_code = #{table_name}.status_code AND "+
                                                         "v1.language=?",language)}
end
