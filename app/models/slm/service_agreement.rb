class Slm::ServiceAgreement < ActiveRecord::Base
  set_table_name :slm_service_agreements

  #多语言关系
  attr_accessor :response_day,:response_hour,:response_minute
  attr_accessor :solve_day,:solve_hour,:solve_minute
  attr_accessor :name,:description
  has_many :service_agreements_tls,:dependent => :destroy,:foreign_key=>"service_agreement_id"
  acts_as_multilingual

  before_save :transform_time
  query_extend

  #根据天，小时还有秒来区分
  def transform_time
    self.response_time = self.response_day.to_i * 86400  + self.response_hour.to_i * 60 + self.response_minute.to_i
    self.resolve_time = self.solve_day.to_i * 86400 + self.solve_hour.to_i * 60 + self.solve_minute.to_i
  end

end
