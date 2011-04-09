module EventCalendar
  module EventCalendarEx
    def self.included(base)
      base.class_eval do
        # For the given month, find the start and end dates
        # Find all the events within this range, and create event strips for them
        def event_strips_for_month(shown_date, calendar, first_day_of_week=0, find_options = {})
          if first_day_of_week.is_a?(Hash)
            find_options.merge!(first_day_of_week)
            first_day_of_week =  0
          end
          strip_start, strip_end = get_start_and_end_dates(shown_date, first_day_of_week)
          events = events_for_date_range(strip_start, strip_end, calendar, find_options)
          event_strips = create_event_strips(strip_start, strip_end, events)
          event_strips
        end

        # Expand start and end dates to show the previous month and next month's days,
        # that overlap with the shown months display
        def get_start_and_end_dates(shown_date, first_day_of_week=0)
          # start with the first day of the given month
          start_of_month = Date.civil(shown_date.year, shown_date.month, 1)
          # the end of last month
          strip_start = beginning_of_week(start_of_month, first_day_of_week)
          # the beginning of next month, unless this month ended evenly on the last day of the week
          if start_of_month.next_month == beginning_of_week(start_of_month.next_month, first_day_of_week)
            # last day of the month is also the last day of the week
            strip_end = start_of_month.next_month
          else
            # add the extra days from next month
            strip_end = beginning_of_week(start_of_month.next_month + 7, first_day_of_week)
          end
          [strip_start, strip_end]
        end

        # Get the events overlapping the given start and end dates
        def events_for_date_range(start_d, end_d, calendar, find_options = {})
          self.scoped(find_options).find(
            :all,
            :conditions => [ "(calendar_id = ?) AND (? <= #{self.quoted_table_name}.#{self.end_at_field}) AND (#{self.quoted_table_name}.#{self.start_at_field}< ?)", calendar.id, start_d.to_time.utc, end_d.to_time.utc ],
            :order => "#{self.quoted_table_name}.#{self.start_at_field} ASC"
          )
        end

        # Create the various strips that show events.
        def create_event_strips(strip_start, strip_end, events)
          # create an inital event strip, with a nil entry for every day of the displayed days
          event_strips = [[nil] * (strip_end - strip_start + 1)]

          events.each do |event|
            cur_date = event.start_at.to_date
            end_date = event.end_at.to_date
            cur_date, end_date = event.clip_range(strip_start, strip_end)
            start_range = (cur_date - strip_start).to_i
            end_range = (end_date - strip_start).to_i

            # make sure the event is within our viewing range
            if (start_range <= end_range) and (end_range >= 0)
              range = start_range..end_range

              open_strip = space_in_current_strips?(event_strips, range)

              if open_strip.nil?
                # no strips open, make a new one
                new_strip = [nil] * (strip_end - strip_start + 1)
                range.each {|r| new_strip[r] = event}
                event_strips << new_strip
              else
                # found an open strip, add this event to it
                range.each {|r| open_strip[r] = event}
              end
            end
          end
          event_strips
        end

        def space_in_current_strips?(event_strips, range)
          open_strip = nil
          for strip in event_strips
            strip_is_open = true
            range.each do |r|
              # overlapping events on this strip
              if !strip[r].nil?
                strip_is_open = false
                break
              end
            end

            if strip_is_open
              open_strip = strip
              break
            end
          end
          open_strip
        end
      end
    end

  end
end