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


   begin
     all_routes = Rails.application.routes.routes
     routes = all_routes.collect do |route|
       key_method = Hash.method_defined?('key') ? 'key' : 'index'
       name = Rails.application.routes.named_routes.routes.send(key_method, route).to_s
       reqs = route.requirements.empty? ? "" : route.requirements.inspect
       {:name => name, :verb => route.verb.to_s, :path => route.path, :reqs => reqs}
     end
     routes.reject!{ |r| r[:path] == "/rails/info/properties" } # skip the route if it's internal info route
     @route_permissions = []
     routes.each do |r|
       @route_permissions<<eval(r[:reqs])
     end

     puts("+++++++++++++++++++++++++++++++++++++" + @route_permissions.to_json)
    end
  end
end