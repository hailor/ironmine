module Slm::ServiceAgreementsHelper
  #得到天数
  def get_day_count(time)
     if time.present?
       (time/86400).to_i
     end
  end

  #得到月份
  def get_hour_count(time)
    if time.present?
        ((time-((get_day_count(time))*86400)) / 60) .to_i
    end
  end

  #得到分钟
  def get_minute_count(time)
    if time.present?
       time - get_hour_count(time) * 60 - get_day_count(time)* 86400
    end
  end


  def available_service_agreement
    Slm::ServiceAgreement.multilingual.collect{|m| [m[:name], m.agreement_code]}
  end

  def checkbox_show_flag(flag)
    puts '1111111'+flag.to_s
     if(flag.present? && flag.to_i == 1)
       true
     else
       false
     end
  end

  def div_show_flag(flag)
     if(flag.present? && flag.to_i == 1)
       "display:block;"
     else
       "display:none;"
     end
  end
  
end
