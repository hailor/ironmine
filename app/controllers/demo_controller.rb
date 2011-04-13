class DemoController < ApplicationController
  def index
    test = Irm::WfTask.find(5)
#    rule = RiCal::PropertyValue::RecurrenceRule(:freq => "MONTHLY", :interval => 1, :until => "20110430T045959Z", :byday=>"MO,SU")
#    ical_event =   RiCal.Calendar do |cal|
#                    cal.event do |event|
#                      event.description = "MA-6 First US Manned Spaceflight"
#                      event.dtstart =  DateTime.parse("2011-04-01T14:47:39") #4712-01-01T00:00:00+00:00
#                      event.dtend = DateTime.parse("2011-04-15T14:47:39")
#                      event.location = "Cape Canaveral"
#                      event.rrule = test
#                    end
#                  end
    y = test.occurrences
  end
end