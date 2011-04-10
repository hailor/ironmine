module Irm::CalendarTasksHelper
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
      html = link_to(event.name,
                     {:controller => "irm/calendar_tasks", :action => "show", :id => event.id},
                     :title => event.name, :class => "calendar-event-preview", :id => "quick_show_" + event.id.to_s,
                     :quick_show => url_for(:controller => "irm/calendar_tasks", :action => "quick_show", :id => event.id))
#      else
#        html = url_for(event.url)
#      end
      html << display_event_time(event, day)
      html << %(#{h(event.name)}</a>)
      html
    end
  end
end
