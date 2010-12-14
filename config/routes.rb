Ironmine::Application.routes.draw do
  scope :module => "irm" do
    root :to => "navigations#entrance"
    match 'login'=>'common#login',:as=>:login
    match 'logout'=>'common#logout',:as=>:logout
    #lookup_types
    match '/lookup_types/new(.:format)'=>"lookup_types#new",:via=>:get
    match '/lookup_types/create(.:format)'=>"lookup_types#create",:via=>:post
    match '/lookup_types/successful_info(.:format)'=>"lookup_types#successful_info",:via=>:get
    match '/lookup_types/create_value(.:format)'=>"lookup_types#create_value",:via=>:post
    match '/lookup_types/create_edit_value(.:format)'=>"lookup_types#create_edit_value",:via=>:post
    match '/lookup_types/get_lookup_types(.:format)'=>"lookup_types#get_lookup_types",:via=>:get
    match '/lookup_types/get_lookup_values(.:format)'=>"lookup_types#get_lookup_values",:via=>:get
    match '/lookup_types(/index)(.:format)'=>"lookup_types#index",:via=>:get
    match '/lookup_types/:id/edit(.:format)'=>"lookup_types#edit",:via=>:get
    match '/lookup_types/update'=>"lookup_types#update"
    match '/lookup_types/:id/add_code'=>"lookup_types#add_code"
    #product modules
    match '/product_modules(/index)(.:format)' => "product_modules#index", :via => :get
    match '/product_modules/:id/edit(.:format)' => "product_modules#edit", :via => :get
    match '/product_modules/:id(.:format)' => "product_modules#update", :via => :put
    match '/product_modules/new(.:format)' => "product_modules#new", :via => :get
    match '/product_modules/create(.:format)' => "product_modules#create", :via => :post
    match '/product_modules/:id/multilingual_edit(.:format)' => "product_modules#multilingual_edit", :via => :get
    match '/product_modules/:id/multilingual_update(.:format)' => "product_modules#multilingual_update", :via => :put
    match '/product_modules/get_data(.:format)' => "product_modules#get_data"
    match '/product_modules/enable(.:format)' => "product_modules#enable", :via => :post
    match '/product_modules/disable(.:format)' => "product_modules#disable", :via => :post
    #languages
    match '/languages(/index)(.:format)' => "languages#index", :via => :get
    match '/languages/:id/edit(.:format)' => "languages#edit", :via => :get
    match '/languages/:id(.:format)' => "languages#update", :via => :put
    match '/languages/new(.:format)' => "languages#new", :via => :get
    match '/languages/create(.:format)' => "languages#create", :via => :post
    match '/languages/get_data(.:format)' => "languages#get_data"
    match '/languages/:id/multilingual_edit(.:format)' => "languages#multilingual_edit", :via => :get
    match '/languages/:id/multilingual_update(.:format)' => "languages#multilingual_update", :via => :put
    #menus
    match '/menus(/index)(.:format)' => "menus#index", :via => :get
    match '/menus/new(.:format)' => "menus#new", :via => :get
    match '/menus/create(.:format)' => "menus#create", :via => :post
    match '/menus/get_data(.:format)' => "menus#get_data"
    match '/menus/:id/edit(.:format)' => "menus#edit", :via => :get
    match '/menus/:id(.:format)' => "menus#update", :via => :put
    match '/menus/:id/multilingual_edit(.:format)' => "menus#multilingual_edit", :via => :get
    match '/menus/:id/multilingual_update(.:format)' => "menus#multilingual_update", :via => :put
    #menu_entries
    match '/menu_entries/:menu_id/index(.:format)' => "menu_entries#index", :via => :get
    match '/menu_entries/:menu_id/new(.:format)' => "menu_entries#new", :via => :get
    match '/menu_entries/:menu_id/create(.:format)' => "menu_entries#create", :via => :post
    match '/menu_entries/:menu_id/get_data(.:format)' => "menu_entries#get_data"
    match '/menu_entries/:id/edit(.:format)' => "menu_entries#edit", :via => :get
    match '/menu_entries/link_edit(.:format)' => "menu_entries#link_edit", :via => :post
    match '/menu_entries/:id(.:format)' => "menu_entries#update", :via => :put
    match '/menu_entries/:id/multilingual_edit(.:format)' => "menu_entries#multilingual_edit", :via => :get
    match '/menu_entries/:id/multilingual_update(.:format)' => "menu_entries#multilingual_update", :via => :put
    match '/menu_entries/destroy(.:format)' => "menu_entries#destroy"
    match '/menu_entries/create_entry(.:format)' => "menu_entries#create_entry", :via => :post
    #permissions
    match '/permissions(/index)(.:format)' => "permissions#index", :via => :get
    match '/permissions/:id/edit(.:format)' => "permissions#edit", :via => :get
    match '/permissions/:id(.:format)' => "permissions#update", :via => :put
    match '/permissions/new(.:format)' => "permissions#new", :via => :get
    match '/permissions/create(.:format)' => "permissions#create", :via => :post
    match '/permissions/:id/multilingual_edit(.:format)' => "permissions#multilingual_edit", :via => :get
    match '/permissions/:id/multilingual_update(.:format)' => "permissions#multilingual_update", :via => :put
    match '/permissions/get_data(.:format)' => "permissions#get_data"
    #conditions
    match '/conditions(/index)(.:format)' => "conditions#index", :via => :get
    match '/conditions/:id/edit(.:format)' => "conditions#edit", :via => :get
    match '/conditions/:id(.:format)' => "conditions#update", :via => :put
    match '/conditions/:id(.:format)' => "conditions#update", :via => :put
    match '/conditions/new(.:format)' => "conditions#new", :via => :get
    match '/conditions/create(.:format)' => "conditions#create", :via => :post
    match '/conditions/:id/multilingual_edit(.:format)' => "conditions#multilingual_edit", :via => :get
    match '/conditions/:id/multilingual_update(.:format)' => "conditions#multilingual_update", :via => :put
    match '/conditions/get_data(.:format)' => "conditions#get_data"
    #actions
    match '/actions(/index)(.:format)' => "actions#index", :via => :get
    match '/actions/:id/edit(.:format)' => "actions#edit", :via => :get
    match '/actions/:id(.:format)' => "actions#update", :via => :put
    match '/actions/:id(.:format)' => "actions#update", :via => :put
    match '/actions/new(.:format)' => "actions#new", :via => :get
    match '/actions/create(.:format)' => "actions#create", :via => :post
    match '/actions/:id/multilingual_edit(.:format)' => "actions#multilingual_edit", :via => :get
    match '/actions/:id/multilingual_update(.:format)' => "actions#multilingual_update", :via => :put
    match '/actions/get_data(.:format)' => "actions#get_data"
    #identities
    match '/identities(/index)(.:format)' => "identities#index", :via => :get
    match '/identities/:id/edit(.:format)' => "identities#edit", :via => :get
    match '/identities/:id(.:format)' => "identities#update", :via => :put
    match '/identities/new(.:format)' => "identities#new", :via => :get
    match '/identities/create(.:format)' => "identities#create", :via => :post
    match '/identities/:id/multilingual_edit(.:format)' => "identities#multilingual_edit", :via => :get
    match '/identities/:id/multilingual_update(.:format)' => "identities#multilingual_update", :via => :put
    match '/identities/get_data(.:format)' => "identities#get_data"

    #global_settings
    match '/global_settings/edit(.:format)' => "global_settings#edit", :via => :get
    match '/global_settings/:id(.:format)' => "global_settings#update", :via => :put
    match '/global_settings(/index)(.:format)' => "global_settings#index", :via => :get
    match '/global_settings/crop(.:format)' => "global_settings#crop"
    #auth_sources
    match '/auth_sources(/index)(.:format)' => "auth_sources#index", :via => :get
    match '/auth_sources/:id/edit(.:format)' => "auth_sources#edit", :via => :get
    match '/auth_sources/:id(.:format)' => "auth_sources#update", :via => :put
    match '/auth_sources/new(.:format)' => "auth_sources#new", :via => :get
    match '/auth_sources/create(.:format)' => "auth_sources#create", :via => :post
    match '/auth_sources/:id/multilingual_edit(.:format)' => "auth_sources#multilingual_edit", :via => :get
    match '/auth_sources/:id/multilingual_update(.:format)' => "auth_sources#multilingual_update", :via => :put
    match '/auth_sources/get_data(.:format)' => "auth_sources#get_data"
    #scripts
    match '/scripts(/index)(.:format)' => "scripts#index", :via => :get
    match '/scripts/:id/edit(.:format)' => "scripts#edit", :via => :get
    match '/scripts/:id(.:format)' => "scripts#update", :via => :put
    match '/scripts/:id(.:format)' => "scripts#update", :via => :put
    match '/scripts/new(.:format)' => "scripts#new", :via => :get
    match '/scripts/create(.:format)' => "scripts#create", :via => :post
    match '/scripts/:id/multilingual_edit(.:format)' => "scripts#multilingual_edit", :via => :get
    match '/scripts/:id/multilingual_update(.:format)' => "scripts#multilingual_update", :via => :put
    match '/scripts/get_data(.:format)' => "scripts#get_data"
    #functions
    match '/functions(/index)(.:format)' => "functions#index", :via => :get
    match '/functions/:id/edit(.:format)' => "functions#edit", :via => :get
    match '/functions/:id(.:format)' => "functions#update", :via => :put
    match '/functions/new(.:format)' => "functions#new", :via => :get
    match '/functions/create(.:format)' => "functions#create", :via => :post
    match '/functions/:id/multilingual_edit(.:format)' => "functions#multilingual_edit", :via => :get
    match '/functions/:id/multilingual_update(.:format)' => "functions#multilingual_update", :via => :put
    match '/functions/get_data(.:format)' => "functions#get_data"
    match '/functions/:function_id/permission_index(.:format)' => "functions#permission_index", :via => :get
    match '/functions/:function_id/add_permission(.:format)' => "functions#add_permission", :via => :get
    match '/functions/:function_id/edit_own_permissions(.:format)' => "functions#edit_own_permissions", :via => :get
    match '/functions/:function_id/get_own_permissions(.:format)' => "functions#get_own_permissions", :via => :get
    match '/functions/:function_id/get_available_permissions(.:format)' => "functions#get_available_permissions", :via => :get
    match '/functions/:function_id/update_permissions(.:format)' => "functions#update_permissions", :via => :post
    #function_groups
    match '/function_groups(/index)(.:format)' => "function_groups#index", :via => :get
    match '/function_groups/:id/edit(.:format)' => "function_groups#edit", :via => :get
    match '/function_groups/:id(.:format)' => "function_groups#update", :via => :put
    match '/function_groups/new(.:format)' => "function_groups#new", :via => :get
    match '/function_groups/create(.:format)' => "function_groups#create", :via => :post
    match '/function_groups/:id/multilingual_edit(.:format)' => "function_groups#multilingual_edit", :via => :get
    match '/function_groups/:id/multilingual_update(.:format)' => "function_groups#multilingual_update", :via => :put
    match '/function_groups/get_data(.:format)' => "function_groups#get_data"
    match '/function_groups/:function_group_id/function_index(.:format)' => "function_groups#function_index", :via => :get
    match '/function_groups/:function_group_id/add_function(.:format)' => "function_groups#add_functions", :via => :get
    match '/function_groups/:function_group_id/edit_own_functions(.:format)' => "function_groups#edit_own_functions", :via => :get
    match '/function_groups/:function_group_id/get_own_functions(.:format)' => "function_groups#get_own_functions", :via => :get
    match '/function_groups/:function_group_id/get_available_functions(.:format)' => "function_groups#get_available_functions", :via => :get
    match '/function_groups/:function_group_id/update_functions(.:format)' => "function_groups#update_functions", :via => :post
    # navigations
    match '/navigations/entrance(.:format)' =>'navigations#entrance'
    match '/navigations/workspace(.:format)' =>'navigations#workspace'
    match '/navigations/my_page(.:format)' =>'navigations#my_page'
    match '/navigations/my_setting(.:format)' =>'navigations#my_setting'
  end

  match '/demo(/index)' => 'demo#index'
  themes_for_rails
end
