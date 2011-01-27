class Irm::Company < ActiveRecord::Base
  set_table_name :irm_companies

  query_extend

  #多语言关系
  attr_accessor :name,:description
  has_many :companies_tls,:dependent => :destroy
  acts_as_multilingual

  validates_presence_of :short_name,:company_type
  validates_uniqueness_of :short_name,:if => Proc.new { |i| !i.short_name.blank? }
  validates_format_of :short_name, :with => /^[A-Z0-9_]*$/ ,:if=>Proc.new{|i| !i.short_name.blank?}

  scope :query_wrap_info,lambda{|language| select("#{table_name}.*,#{Irm::CompaniesTl.table_name}.name,#{Irm::CompaniesTl.table_name}.description,"+
                                                          "v1.meaning company_type_meaning,v2.meaning status_meaning").
                                                   joins(",irm_lookup_values_vl v1").
                                                   joins(",irm_lookup_values_vl v2").
                                                   where("v1.lookup_type='COMPANY_TYPE' AND v1.lookup_code = #{table_name}.company_type AND "+
                                                         "v2.lookup_type='SYSTEM_STATUS_CODE' AND v2.lookup_code = #{table_name}.status_code AND "+
                                                         "v1.language=? AND v2.language=?",language,language)}


  scope :query_show_wrap_info,lambda{|language| select("#{table_name}.*,#{Irm::CompaniesTl.table_name}.name,#{Irm::CompaniesTl.table_name}.description,"+
                                                          "v1.meaning company_type_meaning,v2.meaning status_meaning,v3.meaning timezone_meaning,v4.name currency_name").
                                                   joins("left outer join irm_lookup_values_vl v3 on v3.lookup_type='TIMEZONE' AND v3.lookup_code = #{table_name}.time_zone AND "+
                                                         "v3.language = #{Irm::CompaniesTl.table_name}.language").
                                                   joins("left outer join irm_currencies_vl v4 on v4.currency_code = #{table_name}.currency_code AND "+
                                                         "v4.language = #{Irm::CompaniesTl.table_name}.language").
                                                   joins(",irm_lookup_values_vl v1").
                                                   joins(",irm_lookup_values_vl v2").
                                                   where("v1.lookup_type='COMPANY_TYPE' AND v1.lookup_code = #{table_name}.company_type AND "+
                                                         "v2.lookup_type='SYSTEM_STATUS_CODE' AND v2.lookup_code = #{table_name}.status_code AND "+
                                                         "v1.language=? AND v2.language=? ",language,language)}




  #设定当前用户
  def self.current=(company)
    @current_company = company
  end

  #取得当前用户
  def self.current
    @current_company ||= Irm::Company.global
  end

  #返回匿名用户,一个数据库中只有一个匿名用户
  def self.global
    anonymous_identity = Irm::GlobalCompany.first
    if anonymous_identity.nil?
      anonymous_identity = Irm::GlobalCompany.create(:short_name => 'Global',:company_type=>"GLOBAL", :name => 'Global')
      raise 'Unable to create the anonymous identity.' if anonymous_identity.new_record?
    end
    anonymous_identity
  end

  def global?
    false
  end
end


class Irm::GlobalCompany < Irm::Company
  self.record_who = false
  def validate_on_create
    # There should be only one AnonymousUser in the database
    errors.add_to_base 'An global company already exists.' if Irm::GlobalCompany.first
  end

  # Overrides a few properties
  def global?; true end
end
