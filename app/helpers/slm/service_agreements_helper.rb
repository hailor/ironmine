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

  def show_options(value_type,value)
    result =""
    if (value_type == 'USER')
      user_scope = Irm::Person.query_all_person
      user =  user_scope.collect{|i|[i[:person_name],i.id]}
      result =  user
    else
      role_scope = Irm::Role.multilingual.enabled
      role =  role_scope.collect{|i|[i[:name],i.id]}
      result = role
    end
    result
  end

  def show_selected(value_type,value)
    value_options = ""
    if value.present?
        if(value_type == 'USER')
          value_options = Irm::Person.query_all_person.find(value)[:person_name]
        else
          value_options = Irm::Role.multilingual.find(value)[:name]
        end
    else
      value_options=""
    end
    value_options
  end
  
end
