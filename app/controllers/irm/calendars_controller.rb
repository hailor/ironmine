class Irm::CalendarsController < ApplicationController
  def get_full_calendar
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i

    @shown_month = Date.civil(@year, @month)
    @event_strips = Irm::WfTask.event_strips_for_month(@shown_month, Irm::Calendar.current)
    respond_to do |format|
      format.js {
        render "irm/calendars/full_calendar"
      }
    end
  end
end