class Irm::DevToolsController < ApplicationController
  def index

  end

  def show_permissions

  end

  def show_permissions_data
     all_routes = Rails.application.routes.routes
     routes = all_routes.collect do |route|
       key_method = Hash.method_defined?('key') ? 'key' : 'index'
       name = Rails.application.routes.named_routes.routes.send(key_method, route).to_s
       reqs = route.requirements.empty? ? "" : route.requirements.inspect
       {:name => name, :verb => route.verb.to_s, :path => route.path, :reqs => reqs}
     end
     routes.reject!{ |r| r[:path] == "/rails/info/properties" } # skip the route if it's internal info route
     permissions = []
     routes.each do |r|
       permissions<<eval(r[:reqs])
     end
     all_permissions = []
     permissions.each do |p|
       code= "#{p[:controller].gsub(/\//, "_")}_#{p[:action]}".upcase
       status_code = "ENABLED"
       if(p[:action].include?("create")||p[:action].include?("update"))
         status_code = "OFFLINE"
       end
       per = Irm::Permission.new(:permission_code=>code,
                                 :name=>p[:action],
                                 :page_controller=>p[:controller],
                                 :page_action=>p[:action],
                                 :status_code=>status_code
                                 )
       all_permissions << per
     end
     all_permissions.sort! {|x,y| x.permission_code <=> y.permission_code }
    respond_to do |format|
      format.json  {render :json => to_jsonp(all_permissions.to_grid_json([:permission_code,:name,:page_controller,:page_action,:status_code], all_permissions.size)) }
      format.xls   {send_data(all_permissions.to_xls(:only => [:permission_code,:name,:page_controller,:page_action,:status_code],
                                                    :headers=>["CODE","NAME","CONTROLLER","ACTION","STATUS_CODE"]
                                                   ))}
    end
  end
end
