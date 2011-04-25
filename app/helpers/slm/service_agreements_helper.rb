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

  def show_options(value_type,value)
    value_options = show_selected(value_type,value)
    if value_options.present?
      "<option value=\"#{value}\">#{value_options}</option>".html_safe
    else
      "<option value=\"\">#{t(:actionview_instancetag_blank_option)}</option>".html_safe
    end
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
