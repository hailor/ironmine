class Slm::ServiceAgreement < ActiveRecord::Base
  set_table_name :slm_service_agreements

  #多语言关系
  attr_accessor :response_day,:response_hour,:response_minute
  attr_accessor :solve_day,:solve_hour,:solve_minute
  attr_accessor :rs_first_day,:rs_first_hour,:rs_first_minute

  attr_accessor :update_time_flag


  attr_accessor :name,:description
  has_many :service_agreements_tls,:dependent => :destroy,:foreign_key=>"service_agreement_id"
  acts_as_multilingual

  before_save :transform_time
  query_extend

  #根据天，小时还有秒来区分
  def transform_time
    if !(self.update_time_flag == Irm::Constant::SYS_YES)
      self.response_time = self.response_day.to_i * 86400  + self.response_hour.to_i * 60 + self.response_minute.to_i
      self.resolve_time = self.solve_day.to_i * 86400 + self.solve_hour.to_i * 60 + self.solve_minute.to_i
    end
  end


  scope :query_by_company_id,lambda{|language| select("v2.name company_name,#{table_name}.*").
                                               joins("inner join irm_companies_vl v2").
                                               where("v2.id=#{table_name}.service_company_id AND "+
                                                     "v2.language=?",language)}


  def match_filter
    return @match_filter if @match_filter
    @match_filter = Irm::RuleFilter.query_by_source(self.class.name,self.id).first
    return @match_filter
  end

  def match_filter_meaning
    meaning = ""
    if self.match_filter
      meaning=  self.match_filter.meaning
    else
      meaning = I18n.t(:label_slm_service_agreement_match_filter_null)
    end
    meaning = I18n.t(:label_slm_service_agreement_match_filter_null) if meaning.blank?
    meaning
  end
end
