namespace :irm do
  desc "(For Ironmine)Migrate the permission config."
  task :initpermission => :environment do
    CLEAR   = "\e[0m"
    BOLD    = "\e[1m"
    RED     = "\e[31m"
    begin
      # 初始化模块数据 ，初始化脚本位于lib/模块/init.rb脚本中
      Irm::ProductModule.enabled.each do |p|
        if File::exists?(File.join(Rails.root, "lib","#{p.product_short_name.downcase}","init_permission.rb"))
          require "#{p.product_short_name.downcase}/init_permission"
        end
      end
    rescue =>text
            puts("Init permission error :#{text}")

    end

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
    functions = Irm::AccessControl.functions
    function_codes = Irm::Function.all.collect{|f| f.function_code.downcase.to_sym}
    missing_function_codes = functions.keys.collect{|fc| fc if !function_codes.include?(fc)}.compact
    puts "#{BOLD}#{RED}Missing function codes:#{missing_function_codes.to_json}#{CLEAR}"
    Irm::Permission.update_all("status_code = 'UNKNOW'")
    functions.each do |function_code,function|
      permissions =  function[:permissions]
      permissions.each do |controller,actions|
        actions.each do |action|
          if !route_permissions.detect{|rp| rp[:controller].eql?(controller)&&rp[:action].eql?(action.to_s)}
            puts "#{BOLD}#{RED}No route match #{controller}/#{action.to_s}#{CLEAR}"
            next
          end
          permission = Irm::Permission.where(:function_code=>function_code.to_s.upcase,:page_controller=>controller,:page_action=>action.to_s).first
          if permission
            permission.update_attributes({:status_code=>"ENABLED"})
          else
            Irm::Permission.create(:permission_code=>Irm::Permission.url_key(controller,action).upcase[0..29],:function_code=>function_code.to_s.upcase,:page_controller=>controller,:page_action=>action.to_s)
            puts "Add [#{function_code}]#{Irm::Permission.url_key(controller,action)} to permissions"
          end
        end
      end

    end
    deleted_row = Irm::Permission.delete_all("status_code = 'UNKNOW'")
    puts "#{BOLD}#{RED}Delete #{deleted_row} row#{CLEAR}"

  end
end