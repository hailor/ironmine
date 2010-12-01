class Irm::Company < ActiveRecord::Base
  set_table_name :irm_companies

  #多语言关系
  attr_accessor :name,:description
  has_many :companies_tls,:dependent => :destroy
  acts_as_multilingual

  validates_presence_of :short_name
  validates_uniqueness_of :short_name,:if => Proc.new { |i| !i.short_name.blank? }

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
