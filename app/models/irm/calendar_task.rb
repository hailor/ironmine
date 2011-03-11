class Irm::CalendarTask < ActiveRecord::Base
  set_table_name :irm_calendar_tasks
  has_event_calendar
end
