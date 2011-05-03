namespace :irm do
  desc "(For Ironmine)Show missing permission config."
  task :permission => :environment do
    CLEAR   = "\e[0m"
    BOLD    = "\e[1m"
    RED     = "\e[31m"

    begin
     all_routes = Rails.application.routes.routes
     routes = all_routes.collect do |route|
       key_method = Hash.method_defined?('key') ? 'key' : 'index'
       name = Rails.application.routes.named_routes.routes.send(key_method, route).to_s
       reqs = route.requirements.empty? ? "" : route.requirements.inspect
       {:name => name, :verb => route.verb.to_s, :path => route.path, :reqs => reqs}
     end
     routes.reject!{ |r| r[:path] == "/rails/info/properties" } # skip the route if it's internal info route
     route_permissions = []
     routes.each do |r|
       route_permissions<<eval(r[:reqs])
     end
    end
    controllers = Irm::Permission.all.collect{|p| p.page_controller}
    controllers.uniq!

    key = ENV["C"]

    grouped_routes = route_permissions.group_by{|rp| rp[:controller]}
    grouped_routes.delete_if{|k,value| controllers.include?(k)} unless key
    grouped_routes.each do |controller,permissions|
      next if !key.nil?&&!controller.include?(key)

      puts "#{BOLD}#{RED}#===================#{controller}============================#{CLEAR}"
      all_actions = permissions.collect{|p| p[:action]}
      puts "#{BOLD}#{RED}##{all_actions}#{CLEAR}"
      view_actions = permissions.collect{|p| p[:action] if ["index","show"].detect{|a| p[:action].include?(a)}}.compact!
      create_actions = permissions.collect{|p| p[:action] if ["create","new","add"].detect{|a| p[:action].include?(a)}}.compact!
      edit_actions = permissions.collect{|p| p[:action] if ["edit","update","change"].detect{|a| p[:action].include?(a)}}.compact!
      model = controller.gsub(/.*\//, "")
      puts "map.function :view_#{model},{\"#{controller}\"=>#{view_actions}}"  if view_actions&&view_actions.size>0
      puts "map.function :create_#{model},{\"#{controller}\"=>#{create_actions}}" if create_actions&&create_actions.size>0
      puts "map.function :edit_#{model},{\"#{controller}\"=>#{edit_actions}}" if edit_actions&&edit_actions.size>0
    end
  end
end