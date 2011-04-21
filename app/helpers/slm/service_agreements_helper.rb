module Slm::ServiceAgreementsHelper
  #得到天数
  def get_day_count(time)
     time%86400
  end

  #得到月份
  def get_hour_count(time)
    (time-((get_day_count(time))*86400)) % 60
  end

  #得到分钟
  def get_minute_count
    time- get_hour_count(time) * 60
  end
  
end
