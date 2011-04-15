module Irm::WfTasksHelper
  include ActionView::Helpers::UrlHelper
  def month_link(month_date)
    link_to(I18n.localize(month_date, :format => "%B"),
            {:controller => "irm/calendars", :action => :get_full_calendar,
             :month => month_date.month, :year => month_date.year},
            :remote => true)
  end
  
  # custom options for this calendar
  def event_calendar_opts
    { 
      :year => @year,
      :month => @month,
      :event_strips => @event_strips,
      :month_name_text => I18n.localize(@shown_month, :format => "%B %Y"),
      :previous_month_text => "<< " + month_link(@shown_month.prev_month),
      :next_month_text => month_link(@shown_month.next_month) + " >>",
      :use_all_day => true
    }
  end

  def event_calendar
    # args is an argument hash containing :event, :day, and :options
    calendar event_calendar_opts do |args|
      event, day = args[:event], args[:day]
#      if event.url.blank?
#        html = %(<a href="/events/#{event.id}" title="#{h(event.name)}">)
      if event.rrule && event.rrule.size > 1
        html = link_to(content_tag(:img, "", :src => "/images/recurring_activity.gif") + event.name,
                       {:controller => "irm/wf_tasks", :action => "show", :id => event.id},
                       :title => event.name, :class => "calendar-event-preview", :id => "quick_show_" + event.id.to_s,
                       :quick_show => url_for(:controller => "irm/wf_tasks", :action => "quick_show", :id => event.id))
      else
        html = link_to(event.name,
                       {:controller => "irm/wf_tasks", :action => "show", :id => event.id},
                       :title => event.name, :class => "calendar-event-preview", :id => "quick_show_" + event.id.to_s,
                       :quick_show => url_for(:controller => "irm/wf_tasks", :action => "quick_show", :id => event.id))
      end

#      else
#        html = url_for(event.url)
#      end
      html << display_event_time(event, day)
      html << %(#{h(event.name)}</a>)
      html
    end
  end

  def available_month_days
    [[1,1],[2,2],[3,3],[4,4],[5,5],[6,6],[7,7],[8,8],[9,9],[10,10],[11,11],[12,12],[13,13],[14,14],[15,15],[16,16],
     [17,17],[18,18],[19,19],[20,20],[21,21],[22,22],[23,23],[24,24],[25,25],[26,26],[27,27],[28,28],[29,29],[30,30],[31,31]]
  end

  def available_hours
    [["00:00", "00:00"],["00:30", "00:30"],["01:00", "01:00"],["01:30", "01:30"],["02:00", "02:00"],["02:30", "02:30"],["03:00", "03:00"],["03:30", "03:30"],
    ["04:00", "04:00"],["04:30", "04:30"],["05:00", "05:00"],["05:30", "05:30"],["06:00", "06:00"],["06:30", "06:30"],["07:00", "07:00"],["07:30", "07:30"],
    ["08:00", "08:00"],["08:30", "08:30"],["09:00", "09:00"],["09:30", "09:30"],["10:00", "10:00"],["10:30", "10:30"],["11:00", "11:00"],["11:30", "11:30"],
    ["12:00", "12:00"],["12:30", "12:30"],["13:00", "13:00"],["13:30", "13:30"],["14:00", "14:00"],["14:30", "14:30"],["15:00", "15:00"],["15:30", "15:30"],
    ["16:00", "16:00"],["16:30", "16:30"],["17:00", "17:00"],["17:30", "17:30"],["18:00", "18:00"],["18:30", "18:30"],["19:00", "19:00"],["19:30", "19:30"],
    ["20:00", "20:00"],["20:30", "20:30"],["21:00", "21:00"],["21:30", "21:30"],["22:00", "22:00"],["22:30", "22:30"],["23:00", "23:00"],["23:30", "23:30"]]
  end

  def available_week_days
    [[I18n.t("date.day_names")[0], "SU"],[I18n.t("date.day_names")[1], "MO"],[I18n.t("date.day_names")[2], "TU"],
     [I18n.t("date.day_names")[3], "WE"],[I18n.t("date.day_names")[4], "TH"],[I18n.t("date.day_names")[5], "FR"],[I18n.t("date.day_names")[6], "SA"]]
  end

  def available_wf_tasks_ordinal
    [[I18n.t("ordinals")[0], "1"],
     [I18n.t("ordinals")[1], "2"],
     [I18n.t("ordinals")[2], "3"],
     [I18n.t("ordinals")[3], "4"],
     [I18n.t("ordinals")[5], "-1"]]
  end

  def my_tasks_list
    my_tasks = Irm::Calendar.current_calendar(Irm::Person.current.id).wf_tasks.enabled.order("start_at ASC")
    html = ""
    my_tasks.each do |t|
      if t.start_at.strftime("%F") == Time.now.strftime("%F")
        date_str = t(:today)
      elsif t.start_at.strftime("%F") == (Time.now + 1.day).strftime("%F")
        date_str = t(:tomorrow)
      else
        date_str = t.start_at.strftime("%F")
      end
      to_date_str = ""
      to_date_str = t.end_at.strftime("%F") + " " if !(t.start_at.strftime("%F") == t.end_at.strftime("%F"))
      html << content_tag(:li, raw(date_str) + " " + t.start_at.strftime("%T") + " - " + raw(to_date_str) + t.end_at.strftime("%T") +
              content_tag(:span, link_to(t.name,{:controller=>"irm/wf_tasks",:action=>"show",:id=>t.id}), :style => "float:right;"))
    end
    html
  end

  def get_rrule_translate(rrule)
    ret = ""
    ret << t(:recurrence_occurs) + " "
    if rrule[:freq]
      tin = ""
      if rrule[:interval]
        tin << rrule[:interval]
      else
        tin << "1"
      end
      ret << t(:recurrence_interval, :m => tin) + " "
      ret << t("recurrence_" + rrule[:freq].downcase)
    end

    if rrule[:byday]
      d1 = rrule[:byday]
      d2 = d1.slice(d1.size - 2, 2)
      if ["SU", "MO", "TU", "WE", "TH", "FR", "SA"].include?(d2)

      end
    end

    ret
  end

  def available_wf_task_statuses
    Irm::LookupValue.multilingual.query_by_lookup_type("IRM_WF_TASK_STATUS").order("id ASC").enabled.collect{|p| [p[:meaning], p.lookup_code]}
  end

  def available_wf_task_priorities
    Irm::LookupValue.multilingual.query_by_lookup_type("IRM_WF_TASK_PRIORITY").order("id ASC").enabled.collect{|p| [p[:meaning], p.lookup_code]}
  end
end
