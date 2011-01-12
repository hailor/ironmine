Ironmine::Application.routes.draw do
  scope :module => "irm" do
    root :to => "navigations#entrance"
    match 'login'=>'common#login',:as=>:login
    match 'combo'=>'navigations#combo'
    match 'logout'=>'common#logout',:as=>:logout
    match 'forgot_password' => "common#forgot_password"
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
    match '/lookup_types/:id'=>"lookup_types#update",:via=>:put
    match '/lookup_types/check_lookup_code'=>"lookup_types#check_lookup_code"
    match '/lookup_types/get_lookup_values'=>"lookup_types#get_lookup_values"
    match '/lookup_types/:id/add_code'=>"lookup_types#add_code"
    match '/lookup_types/:id(.:format)'=>"lookup_types#show"
    #product modules
    match '/product_modules(/index)(.:format)' => "product_modules#index", :via => :get
    match '/product_modules/:id/edit(.:format)' => "product_modules#edit", :via => :get
    match '/product_modules/:id(.:format)' => "product_modules#update", :via => :put
    match '/product_modules/new(.:format)' => "product_modules#new", :via => :get
    match '/product_modules/create(.:format)' => "product_modules#create", :via => :post
    match '/product_modules/get_data(.:format)' => "product_modules#get_data"
    match '/product_modules/data_grid(.:format)' => "product_modules#data_grid", :via => :get

    #languages
    match '/languages(/index)(.:format)' => "languages#index", :via => :get
    match '/languages/get_data(.:format)' => "languages#get_data"
    match '/languages/:id/edit(.:format)' => "languages#edit", :via => :get
    match '/languages/:id(.:format)' => "languages#update", :via => :put
    match '/languages/new(.:format)' => "languages#new", :via => :get
    match '/languages/:id(.:format)' => "languages#show", :via => :get
    match '/languages/create(.:format)' => "languages#create", :via => :post
    match '/languages/:id/multilingual_edit(.:format)' => "languages#multilingual_edit", :via => :get
    match '/languages/:id/multilingual_update(.:format)' => "languages#multilingual_update", :via => :put
    #menus
    match '/menus(/index)(.:format)' => "menus#index", :via => :get
    match '/menus/new(.:format)' => "menus#new", :via => :get
    match '/menus/create(.:format)' => "menus#create", :via => :post
    match '/menus/get_data(.:format)' => "menus#get_data"
    match '/menus/:id/edit(.:format)' => "menus#edit", :via => :get
    match '/menus/:id(.:format)' => "menus#update", :via => :put
    match '/menus/:id/show(.:format)' => "menus#show", :via => :get
    match '/menus/:entry_id/:id/remove_entry(.:format)' => "menus#remove_entry", :via => :get
    #menu_entries
    match '/menu_entries(/index)(.:format)' => "menu_entries#index", :via => :get
    match '/menu_entries/:menu_code/new(.:format)' => "menu_entries#new", :via => :get
    match '/menu_entries/create(.:format)' => "menu_entries#create", :via => :post
    match '/menu_entries/:menu_code/get_data(.:format)' => "menu_entries#get_data"
    match '/menu_entries/:id/edit(.:format)' => "menu_entries#edit", :via => :get
    match '/menu_entries/:id(.:format)' => "menu_entries#update", :via => :put
    match '/menu_entries/destroy(.:format)' => "menu_entries#destroy"
    match '/menu_entries/select_parent(.:format)' => "menu_entries#select_parent"
    match '/menu_entries/:id/show(.:format)' => "menu_entries#show", :via => :get
    #permissions
    match '/permissions(/index)(.:format)' => "permissions#index", :via => :get
    match '/permissions/:id/edit(.:format)' => "permissions#edit", :via => :get
    match '/permissions/:id(.:format)' => "permissions#update", :via => :put
    match '/permissions/new(.:format)' => "permissions#new", :via => :get
    match '/permissions/create(.:format)' => "permissions#create", :via => :post
    match '/permissions/:id/multilingual_edit(.:format)' => "permissions#multilingual_edit", :via => :get
    match '/permissions/:id/multilingual_update(.:format)' => "permissions#multilingual_update", :via => :put
    match '/permissions/:function_code/function_get_data(.:format)' => "permissions#function_get_data"
    match '/permissions/get_data(.:format)' => "permissions#get_data"
    match '/permissions/:id/show(.:format)' => "permissions#show", :via => :get
    match '/permissions/data_grid(.:format)' => "permissions#data_grid", :via => :get
    #conditions
    match '/conditions(/index)(.:format)' => "conditions#index", :via => :get
    match '/conditions/get_data(.:format)' => "conditions#get_data"
    match '/conditions/:id/edit(.:format)' => "conditions#edit", :via => :get
    match '/conditions/:id(.:format)' => "conditions#update", :via => :put
    match '/conditions/new(.:format)' => "conditions#new", :via => :get
    match '/conditions/:id(.:format)' => "conditions#show", :via => :get
    match '/conditions/create(.:format)' => "conditions#create", :via => :post
    match '/conditions/:id/multilingual_edit(.:format)' => "conditions#multilingual_edit", :via => :get
    match '/conditions/:id/multilingual_update(.:format)' => "conditions#multilingual_update", :via => :put
    #lookup_values
    match '/lookup_values(/index)(.:format)' => "lookup_values#index", :via => :get
    match '/lookup_values/get_data(.:format)' => "lookup_values#get_data"
    match '/lookup_values/:id/edit(.:format)' => "lookup_values#edit", :via => :get
    match '/lookup_values/:id(.:format)' => "lookup_values#update", :via => :put
    match '/lookup_values/new(.:format)' => "lookup_values#new", :via => :get    
    match '/lookup_values/create(.:format)' => "lookup_values#create", :via => :post
    match '/lookup_values/get_lookup_values(.:format)' => "lookup_values#get_lookup_values", :via => :get
    match '/lookup_values/:id/multilingual_edit(.:format)' => "lookup_values#multilingual_edit", :via => :get
    match '/lookup_values/:id/multilingual_update(.:format)' => "lookup_values#multilingual_update", :via => :put    
    match '/lookup_values/select_lookup_type(.:format)' => "lookup_values#select_lookup_type"
    match '/lookup_values/:id(.:format)' => "lookup_values#show", :via => :get

    #actions
    match '/actions(/index)(.:format)' => "actions#index", :via => :get
    match '/actions/get_data(.:format)' => "actions#get_data"
    match '/actions/:id/edit(.:format)' => "actions#edit", :via => :get
    match '/actions/:id(.:format)' => "actions#update", :via => :put
    match '/actions/new(.:format)' => "actions#new", :via => :get
    match '/actions/:id(.:format)' => "actions#show", :via => :get    
    match '/actions/create(.:format)' => "actions#create", :via => :post
    match '/actions/:id/multilingual_edit(.:format)' => "actions#multilingual_edit", :via => :get
    match '/actions/:id/multilingual_update(.:format)' => "actions#multilingual_update", :via => :put
    #identities
    match '/identities(/index)(.:format)' => "identities#index", :via => :get
    match '/identities/:id/edit(.:format)' => "identities#edit", :via => :get
    match '/identities/:id/update(.:format)' => "identities#update", :via => :put
    match '/identities/new(.:format)' => "identities#new", :via => :get
    match '/identities/create(.:format)' => "identities#create", :via => :post
    match '/identities/:id/multilingual_edit(.:format)' => "identities#multilingual_edit", :via => :get
    match '/identities/:id/multilingual_update(.:format)' => "identities#multilingual_update", :via => :put
    match '/identities/get_data(.:format)' => "identities#get_data"
    match '/identities/my_info(.:format)' => "identities#my_info", :via => :get
    match '/identities/edit_info(.:format)' => "identities#edit_info", :via => :get
    match '/identities/update_info(.:format)' => "identities#update_info", :via => :put
    match '/identities/edit_password(.:format)' => "identities#edit_password", :via => :get
    match '/identities/update_password(.:format)' => "identities#update_password", :via => :put
    match '/identities/:id/show(.:format)' => "identities#show"

    #global_settings
    match '/global_settings(/index)(.:format)' => "global_settings#index", :via => :get
    match '/global_settings/edit(.:format)' => "global_settings#edit", :via => :get
    match '/global_settings/:id/update(.:format)' => "global_settings#update"
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
    match '/auth_sources/:id/show(.:format)' => "auth_sources#show", :via => :get
    #scripts
    match '/scripts(/index)(.:format)' => "scripts#index", :via => :get
    match '/scripts/get_data(.:format)' => "scripts#get_data"
    match '/scripts/:id/edit(.:format)' => "scripts#edit", :via => :get
    match '/scripts/:id(.:format)' => "scripts#update", :via => :put
    match '/scripts/:id(.:format)' => "scripts#update", :via => :put
    match '/scripts/new(.:format)' => "scripts#new", :via => :get
    match '/scripts/:id(.:format)' => "scripts#show", :via => :get
    match '/scripts/create(.:format)' => "scripts#create", :via => :post
    match '/scripts/:id/multilingual_edit(.:format)' => "scripts#multilingual_edit", :via => :get
    match '/scripts/:id/multilingual_update(.:format)' => "scripts#multilingual_update", :via => :put

    #functions
    match '/functions(/index)(.:format)' => "functions#index", :via => :get
    match '/functions/:id/edit(.:format)' => "functions#edit", :via => :get
    match '/functions/:id(.:format)' => "functions#update", :via => :put
    match '/functions/new(.:format)' => "functions#new", :via => :get
    match '/functions/create(.:format)' => "functions#create", :via => :post
    match '/functions/:id/show(.:format)' => "functions#show", :via => :get
    match '/functions/get_data(.:format)' => "functions#get_data"
    match '/functions/:function_id/add_permissions(.:format)' => "functions#add_permissions", :via => :get
    match '/functions/:function_code/get_available_permissions(.:format)' => "functions#get_available_permissions", :via => :get
    match '/functions/:function_id/select_permissions(.:format)' => "functions#select_permissions"
    match '/functions/:function_id/add_permissions(.:format)' => "functions#add_permissions", :via => :post
    match '/functions/:function_id/:permission_id/remove_permission(.:format)' => "functions#remove_permission", :via => :get
    
    #function_groups
    match '/function_groups(/index)(.:format)' => "function_groups#index", :via => :get
    match '/function_groups/:id/edit(.:format)' => "function_groups#edit", :via => :get
    match '/function_groups/:id(.:format)' => "function_groups#update", :via => :put
    match '/function_groups/new(.:format)' => "function_groups#new", :via => :get
    match '/function_groups/create(.:format)' => "function_groups#create", :via => :post
    match '/function_groups/:id/show(.:format)' => "function_groups#show", :via => :get
    match '/function_groups/get_data(.:format)' => "function_groups#get_data"
    match '/function_groups/:group_id/add_functions(.:format)' => "function_groups#add_functions", :via => :get
    match '/function_groups/:group_code/get_available_functions(.:format)' => "function_groups#get_available_functions", :via => :get
    match '/function_groups/:group_id/select_functions(.:format)' => "function_groups#select_functions"
    match '/function_groups/:group_id/add_functions(.:format)' => "function_groups#add_functions", :via => :post
    match '/function_groups/:group_id/:function_id/remove_function(.:format)' => "function_groups#remove_function", :via => :get
    match '/function_groups/:group_code/get_own_functions(.:format)' => "function_groups#get_own_functions", :via => :get
    match '/function_groups/:group_id/:function_id/remove_function(.:format)' => "function_groups#remove_function", :via => :get
    # navigations
    match '/navigations/entrance(.:format)' =>'navigations#entrance'
    match '/navigations/workspace(.:format)' =>'navigations#workspace'
    match '/navigations/my_page(.:format)' =>'navigations#my_page'
    match '/navigations/my_setting(.:format)' =>'navigations#my_setting'
    match '/navigations/admin(.:format)' =>'navigations#admin'
    match '/navigations/advance_setting(.:format)' =>'navigations#advance_setting'
    match '/navigations/base_setting(.:format)' =>'navigations#base_setting'
    match '/navigations/icm_setting(.:format)' =>'navigations#icm_setting'
    match '/navigations/common(.:format)' =>'navigations#common'
    #mail_templates
    match '/mail_templates/new(.:format)'=>"mail_templates#new",:via=>:get
    match '/mail_templates/get_data(.:format)' => "mail_templates#get_data"
    match '/mail_templates(.:format)'=>"mail_templates#create",:via=>:post
    match '/mail_templates/copy(.:format)'=>"mail_templates#copy",:via=>:get
    match '/mail_templates/copy_template(.:format)'=>"mail_templates#copy_template",:via=>:post
    match '/mail_templates/test_mail_template'=>"mail_templates#test_mail_template"
    match '/mail_templates(/index)(.:format)'=>"mail_templates#index",:via=>:get
    match '/mail_templates/:id/show(.:format)'=>"mail_templates#show",:via=>:get
    match '/mail_templates/:id/edit(.:format)'=>"mail_templates#edit",:via=>:get
    match '/mail_templates/:id(.:format)'=>"mail_templates#update",:via=>:put
    match '/mail_templates/:id(.:format)'=>"mail_templates#destroy",:via=>:delete
    match '/mail_templates/:id/multilingual_edit(.:format)'=>"mail_templates#multilingual_edit",:via=>:get
    match '/mail_templates/:id/multilingual_update(.:format)'=>"mail_templates#multilingual_update",:via=>:put
    match '/mail_templates/get_current_language(.:format)'=>"mail_templates#get_current_language",:via=>:get
    match '/mail_templates/:id(.:format)'=>"mail_templates#show ",:via=>:get

    #currencies
    match '/currencies(/index)(.:format)' => "currencies#index", :via => :get
    match '/currencies/get_data(.:format)' => "currencies#get_data"
    match '/currencies/:id/edit(.:format)' => "currencies#edit", :via => :get
    match '/currencies/:id(.:format)' => "currencies#update", :via => :put
    match '/currencies/new(.:format)' => "currencies#new", :via => :get
    match '/currencies/:id(.:format)' => "currencies#show", :via => :get
    match '/currencies/create(.:format)' => "currencies#create", :via => :post
    match '/currencies/:id/multilingual_edit(.:format)' => "currencies#multilingual_edit", :via => :get
    match '/currencies/:id/multilingual_update(.:format)' => "currencies#multilingual_update", :via => :put

    #regions
    match '/regions(/index)(.:format)' => "regions#index", :via => :get
    match '/regions/get_data(.:format)' => "regions#get_data"
    match '/regions/:id/edit(.:format)' => "regions#edit", :via => :get
    match '/regions/:id(.:format)' => "regions#update", :via => :put
    match '/regions/new(.:format)' => "regions#new", :via => :get
    match '/regions/:id(.:format)' => "regions#show", :via => :get
    match '/regions/create(.:format)' => "regions#create", :via => :post
    match '/regions/:id/multilingual_edit(.:format)' => "regions#multilingual_edit", :via => :get
    match '/regions/:id/multilingual_update(.:format)' => "regions#multilingual_update", :via => :put    
    #companies
    match '/companies(/index)(.:format)' => "companies#index", :via => :get
    match '/companies/:id/edit(.:format)' => "companies#edit", :via => :get
    match '/companies/:id(.:format)' => "companies#update", :via => :put
    match '/companies/new(.:format)' => "companies#new", :via => :get
    match '/companies/create(.:format)' => "companies#create", :via => :post
    match '/companies/:id/multilingual_edit(.:format)' => "companies#multilingual_edit", :via => :get
    match '/companies/:id/multilingual_update(.:format)' => "companies#multilingual_update", :via => :put
    match '/companies/get_data(.:format)' => "companies#get_data"
    match '/companies/site_info(.:format)' => "companies#site_info"
    match '/companies/get_company_site(.:format)' => "companies#get_company_site"
    match '/companies/add_site_info(.:format)' => "companies#add_site_info"
    match '/companies/create_location(.:format)' => "companies#create_location"
    match '/companies/get_company_info(.:format)' => "companies#get_company_info"
    match '/companies/support_group(.:format)' => "companies#support_group"
    match '/companies/get_support_group(.:format)' => "companies#get_support_group"
    match '/companies/:id/edit_location(.:format)' => "companies#edit_location"
    match '/companies/:id/update_location(.:format)' => "companies#update_location"
    match '/companies/get_choose_company(.:format)' => "companies#get_choose_company"
    match '/companies/:id(.:format)' => "companies#show"
    #login_records
    match '/login_records(/index)(.:format)' => "login_records#index", :via => :get
    match '/login_records/get_data(.:format)' => "login_records#get_data"
    #organizations
    match '/organizations/get_data(.:format)' => "organizations#get_data"
    match '/organizations(/index)(.:format)' => "organizations#index", :via => :get
    match '/organizations/:id/edit(.:format)' => "organizations#edit", :via => :get
    match '/organizations/:id(.:format)' => "organizations#update", :via => :put
    match '/organizations/new(.:format)' => "organizations#new", :via => :get
    match '/organizations/:id(.:format)' => "organizations#show", :via => :get
    match '/organizations/create(.:format)' => "organizations#create", :via => :post
    match '/organizations/:id/multilingual_edit(.:format)' => "organizations#multilingual_edit", :via => :get
    match '/organizations/:id/multilingual_update(.:format)' => "organizations#multilingual_update", :via => :put
    match '/organizations/belongs_to(.:format)' => "organizations#belongs_to"
    #departments
    match '/departments/get_data(.:format)' => "departments#get_data"
    match '/departments(/index)(.:format)' => "departments#index", :via => :get
    match '/departments/:id/edit(.:format)' => "departments#edit", :via => :get
    match '/departments/:id(.:format)' => "departments#update", :via => :put
    match '/departments/new(.:format)' => "departments#new", :via => :get
    match '/departments/:id(.:format)' => "departments#show", :via => :get
    match '/departments/create(.:format)' => "departments#create", :via => :post
    match '/departments/:id/multilingual_edit(.:format)' => "departments#multilingual_edit", :via => :get
    match '/departments/:id/multilingual_update(.:format)' => "departments#multilingual_update", :via => :put
    match '/departments/belongs_to(.:format)' => "departments#belongs_to"
    #value_sets
    match '/value_sets(/index)(.:format)' => "value_sets#index", :via => :get
    match '/value_sets/new(.:format)' => "value_sets#new", :via => :get
    match '/value_sets/create(.:format)' => "value_sets#create", :via => :post
    match '/value_sets/get_data(.:format)' => "value_sets#get_data"
    match '/value_sets/:id/edit(.:format)' => "value_sets#edit", :via => :get
    match '/value_sets/:id(.:format)' => "value_sets#update", :via => :put
    match '/value_sets/:id/multilingual_edit(.:format)' => "value_sets#multilingual_edit", :via => :get
    match '/value_sets/:id/multilingual_update(.:format)' => "value_sets#multilingual_update", :via => :put
    #flex_value_sets
    match '/flex_value_sets(/index)(.:format)' => "flex_value_sets#index", :via => :get
    match '/flex_value_sets/new(.:format)' => "flex_value_sets#new", :via => :get
    match '/flex_value_sets/create(.:format)' => "flex_value_sets#create", :via => :post
    match '/flex_value_sets/get_data(.:format)' => "flex_value_sets#get_data"
    match '/flex_value_sets/:id/edit(.:format)' => "flex_value_sets#edit", :via => :get
    match '/flex_value_sets/:id(.:format)' => "flex_value_sets#update", :via => :put
    match '/flex_value_sets/:id/show(.:format)' => "flex_value_sets#show", :via => :get
    #flex_values
    match '/flex_values(/index)(.:format)' => "flex_values#index", :via => :get
    match '/flex_values/:value_set_id/new(.:format)' => "flex_values#new", :via => :get
    match '/flex_values/create(.:format)' => "flex_values#create", :via => :post
    match '/flex_values/destroy(.:format)' => "flex_values#destroy"
    match 'flex_values/:id/show(.:format)' => "flex_values#show", :via => :get
    match '/flex_values/:id/edit(.:format)' => "flex_values#edit", :via => :get
    match '/flex_values/:value_set_id/get_data(.:format)' => "flex_values#get_data"
    match '/flex_values/:id(.:format)' => "flex_values#update", :via => :put
    match '/flex_values/select_set(.:format)' => "flex_values#select_set", :via => :post
    #site_groups
    match '/site_groups(/index)(.:format)' => "site_groups#index", :via => :get
    match '/site_groups/:id/edit(.:format)' => "site_groups#edit", :via => :get
    match '/site_groups/:id(.:format)' => "site_groups#update", :via => :put
    match '/site_groups/new(.:format)' => "site_groups#new", :via => :get
    match '/site_groups/create(.:format)' => "site_groups#create", :via => :post
    match '/site_groups/:id/multilingual_edit(.:format)' => "site_groups#multilingual_edit", :via => :get
    match '/site_groups/:id/multilingual_update(.:format)' => "site_groups#multilingual_update", :via => :put
    match '/site_groups/get_data(.:format)' => "site_groups#get_data"
    match '/site_groups/get_current_group_site(.:format)' => "site_groups#get_current_group_site"
    match '/site_groups/create_site(.:format)' => "site_groups#create_site"
    match '/site_groups/belongs_to(.:format)' => "site_groups#belongs_to"
    match '/site_groups/:id(.:format)' => "site_groups#show"
    match '/site_groups/:id/add_site(.:format)' => "site_groups#add_site"
    match '/site_groups/:id/edit_site(.:format)' => "site_groups#edit_site"
    match '/site_groups/:id/update_site(.:format)' => "site_groups#update_site"
    match '/site_groups/:id/current_site_group(.:format)' => "site_groups#current_site_group"
    match '/site_groups/:id/multilingual_site_edit(.:format)' => "site_groups#multilingual_site_edit", :via => :get
    match '/site_groups/:id/multilingual_site_update(.:format)' => "site_groups#multilingual_site_update", :via => :put

    #operational_catalogs
    match '/operational_catalogs(/index)(.:format)' => "operational_catalogs#index", :via => :get
    match '/operational_catalogs/new(.:format)' => "operational_catalogs#new", :via => :get
    match '/operational_catalogs/create(.:format)' => "operational_catalogs#create", :via => :post
    match '/operational_catalogs/get_data(.:format)' => "operational_catalogs#get_data"
    match '/operational_catalogs/:id/edit(.:format)' => "operational_catalogs#edit", :via => :get
    match '/operational_catalogs/:id(.:format)' => "operational_catalogs#update", :via => :put
    match '/operational_catalogs/update_segment_options(.:format)' => "operational_catalogs#update_segment_options"
    match '/operational_catalogs/:id/show(.:format)' => "operational_catalogs#show", :via => :get
    #op_catalog_accesses
    match '/op_catalog_accesses/:operational_catalog_id(/index)(.:format)' => "op_catalog_accesses#index", :via => :get
    match '/op_catalog_accesses/:operational_catalog_id/get_data(.:format)' => "op_catalog_accesses#get_data"
    #support_groups
    match '/support_groups(/index)(.:format)' => "support_groups#index", :via => :get
    match '/support_groups/:id/edit(.:format)' => "support_groups#edit", :via => :get
    match '/support_groups/:id(.:format)' => "support_groups#update", :via => :put
    match '/support_groups/new(.:format)' => "support_groups#new", :via => :get
    match '/support_groups/create(.:format)' => "support_groups#create", :via => :post
    match '/support_groups/:id/multilingual_edit(.:format)' => "support_groups#multilingual_edit", :via => :get
    match '/support_groups/:id/multilingual_update(.:format)' => "support_groups#multilingual_update", :via => :put
    match '/support_groups/get_data(.:format)' => "support_groups#get_data"
    match '/support_groups/belongs_to(.:format)' => "support_groups#belongs_to"
    match '/support_groups/add_persons(.:format)' => "support_groups#add_persons"
    match '/support_groups/get_support_group_member(.:format)' => "support_groups#get_support_group_member"
    match '/support_groups/choose_person(.:format)' => "support_groups#choose_person"
    match '/support_groups/create_member(.:format)' => "support_groups#create_member"
    match '/support_groups/delete_member(.:format)' => "support_groups#delete_member"
    match '/support_groups/:id(.:format)' => "support_groups#show"
    #sites
    match '/sites(/index)(.:format)' => "sites#index", :via => :get
    match '/sites/get_data(.:format)' => "sites#get_data"
    match '/sites/:id/edit(.:format)' => "sites#edit", :via => :get
    match '/sites/:id(.:format)' => "sites#update", :via => :put
    match '/sites/new(.:format)' => "sites#new", :via => :get
    match '/sites/:id(.:format)' => "sites#show", :via => :get
    match '/sites/create(.:format)' => "sites#create", :via => :post
    match '/sites/select_site(.:format)' => "sites#select_site", :via => :post
    match '/sites/:id/multilingual_edit(.:format)' => "sites#multilingual_edit", :via => :get
    match '/sites/:id/multilingual_update(.:format)' => "sites#multilingual_update", :via => :put
    #people
    match '/people/get_choose_people(.:format)' => "people#get_choose_people"
    match '/people/get_support_group(.:format)' => "people#get_support_group"
    match '/people/get_data(.:format)' => "people#get_data"
    match '/people(/index)(.:format)' => "people#index", :via => :get
    match '/people/:id/edit(.:format)' => "people#edit", :via => :get
    match '/people/new(.:format)' => "people#new", :via => :get
    match '/people/:id'=>"people#show", :via => :get
    match '/people/:id(.:format)' => "people#update", :via => :put    
    match '/people/create(.:format)' => "people#create", :via => :post
    match '/people/:id/multilingual_edit(.:format)' => "people#multilingual_edit", :via => :get
    match '/people/:id/multilingual_update(.:format)' => "people#multilingual_update", :via => :put
    match '/people/choose_company(.:format)' => "people#choose_company"    
    #company_accesses
    match '/company_accesses(/index)(.:format)' => "company_accesses#index", :via => :get
    match '/company_accesses/:id/edit(.:format)' => "company_accesses#edit", :via => :get
    match '/company_accesses/:id(.:format)' => "company_accesses#update", :via => :put
    match '/company_accesses/new(.:format)' => "company_accesses#new", :via => :get
    match '/company_accesses/create(.:format)' => "company_accesses#create"
    match '/company_accesses/:id/multilingual_edit(.:format)' => "company_accesses#multilingual_edit", :via => :get
    match '/company_accesses/:id/multilingual_update(.:format)' => "company_accesses#multilingual_update", :via => :put
    match '/company_accesses/get_data(.:format)' => "company_accesses#get_data"
    match '/company_accesses/get_company(.:format)' => "company_accesses#get_company"
    #id_flexes
    match '/id_flexes(/index)(.:format)' => "id_flexes#index", :via => :get
    match '/id_flexes/:id/edit(.:format)' => "id_flexes#edit", :via => :get
    match '/id_flexes/:id(.:format)' => "id_flexes#update", :via => :put
    match '/id_flexes/new(.:format)' => "id_flexes#new", :via => :get
    match '/id_flexes/create(.:format)' => "id_flexes#create", :via => :post
    match '/id_flexes/get_data(.:format)' => "id_flexes#get_data"
    match '/id_flexes/:id/show(.:format)' => "id_flexes#show", :via => :get
    #id_flex_stuctures
    match '/id_flex_structures(/index)(.:format)' => "id_flex_structures#index", :via => :get
    match '/id_flex_structures/:id_flex_code/get_data(.:format)' => "id_flex_structures#get_data"
    match '/id_flex_structures/select_parent(.:format)' => 'id_flex_structures#select_parent'
    match '/id_flex_structures/:id/edit(.:format)' => "id_flex_structures#edit", :via => :get
    match '/id_flex_structures/:id(.:format)' => "id_flex_structures#update", :via => :put
    match '/id_flex_structures/:id_flex_code/new(.:format)' => "id_flex_structures#new", :via => :get
    match '/id_flex_structures/create(.:format)' => "id_flex_structures#create", :via => :post
    match '/id_flex_structures/:id/show(.:format)' => "id_flex_structures#show", :via => :get
    #id_flex_segments
    match '/id_flex_segments/:id_flex_structure_id(/index)(.:format)' => "id_flex_segments#index", :via => :get
    match '/id_flex_segments/:id_flex_structure_id/get_data(.:format)' => "id_flex_segments#get_data"
    match '/id_flex_segments/:id/edit(.:format)' => "id_flex_segments#edit", :via => :get
    match '/id_flex_segments/:id(.:format)' => "id_flex_segments#update", :via => :put
    match '/id_flex_segments/:id_flex_code/:id_flex_num/new(.:format)' => "id_flex_segments#new", :via => :get
    match '/id_flex_segments/create(.:format)' => "id_flex_segments#create", :via => :post
    match '/id_flex_segments/:id/show(.:format)' => "id_flex_segments#show", :via => :get
    #support_group_members
    match '/support_group_members(/index)(.:format)' => "support_group_members#index", :via => :get
    match '/support_group_members/:id/edit(.:format)' => "support_group_members#edit", :via => :get
    match '/support_group_members/:id(.:format)' => "support_group_members#update", :via => :put
    match '/support_group_members/:id(.:format)' => "support_group_members#delete", :via => :delete
    match '/support_group_members/new(.:format)' => "support_group_members#new", :via => :get    
    match '/support_group_members/create(.:format)' => "support_group_members#create"
    match '/support_group_members/get_data(.:format)' => "support_group_members#get_data"
    match '/support_group_members/select_person(.:format)' => "support_group_members#select_person"
    match '/support_group_members/get_person(.:format)' => "support_group_members#get_person"
    #locations
    match '/locations(/index)(.:format)' => "locations#index", :via => :get
    match '/locations/get_data(.:format)' => "locations#get_data"
    match '/locations/:id/edit(.:format)' => "locations#edit", :via => :get
    match '/locations/:id(.:format)' => "locations#update", :via => :put
    match '/locations/new(.:format)' => "locations#new", :via => :get
    match '/locations/:id(.:format)' => "locations#show", :via => :get
    match '/locations/create(.:format)' => "locations#create", :via => :post
    # setting
    match '/setting(/index)(.:format)' =>'setting#index'
    match '/setting/common(.:format)' =>'setting#common'
    #home
    match '/home(/index)(.:format)' => "home#index", :via => :get
  end

  scope :module => "icm" do
    match '/rule_settings(/index)(.:format)' => "rule_settings#index", :via => :get
    match '/rule_settings/:id/edit(.:format)' => "rule_settings#edit", :via => :get
    match '/rule_settings/:id(.:format)' => "rule_settings#update", :via => :put
    match '/rule_settings/new(.:format)' => "rule_settings#new", :via => :get
    match '/rule_settings/create(.:format)' => "rule_settings#create", :via => :post
    match '/rule_settings/get_data(.:format)' => "rule_settings#get_data"
    match '/rule_settings/:id(.:format)' => "rule_settings#show", :via => :get
    #impact_ranges
    match '/impact_ranges(/index)(.:format)' => "impact_ranges#index", :via => :get
    match '/impact_ranges/:id/edit(.:format)' => "impact_ranges#edit", :via => :get
    match '/impact_ranges/:id(.:format)' => "impact_ranges#update", :via => :put
    match '/impact_ranges/new(.:format)' => "impact_ranges#new", :via => :get
    match '/impact_ranges/create(.:format)' => "impact_ranges#create", :via => :post
    match '/impact_ranges/get_data(.:format)' => "impact_ranges#get_data"
    match '/impact_ranges/:id/show(.:format)' => "impact_ranges#show", :via => :get
    #urgence_codes
    match '/urgence_codes(/index)(.:format)' => "urgence_codes#index", :via => :get
    match '/urgence_codes/:id/edit(.:format)' => "urgence_codes#edit", :via => :get
    match '/urgence_codes/:id(.:format)' => "urgence_codes#update", :via => :put
    match '/urgence_codes/new(.:format)' => "urgence_codes#new", :via => :get
    match '/urgence_codes/create(.:format)' => "urgence_codes#create", :via => :post
    match '/urgence_codes/:id/multilingual_edit(.:format)' => "urgence_codes#multilingual_edit", :via => :get
    match '/urgence_codes/:id/multilingual_update(.:format)' => "urgence_codes#multilingual_update", :via => :put
    match '/urgence_codes/get_data(.:format)' => "urgence_codes#get_data"
    match '/urgence_codes/:id(.:format)' => "urgence_codes#show" ,:via=>:get
    #priority_codes
    match '/priority_codes(/index)(.:format)' => "priority_codes#index", :via => :get
    match '/priority_codes/:id/edit(.:format)' => "priority_codes#edit", :via => :get
    match '/priority_codes/:id(.:format)' => "priority_codes#update", :via => :put
    match '/priority_codes/new(.:format)' => "priority_codes#new", :via => :get
    match '/priority_codes/create(.:format)' => "priority_codes#create", :via => :post
    match '/priority_codes/:id/multilingual_edit(.:format)' => "priority_codes#multilingual_edit", :via => :get
    match '/priority_codes/:id/multilingual_update(.:format)' => "priority_codes#multilingual_update", :via => :put
    match '/priority_codes/get_data(.:format)' => "priority_codes#get_data"
    match '/priority_codes/:id(.:format)' => "priority_codes#show", :via => :get
    #close_reasons
    match '/close_reasons(/index)(.:format)' => "close_reasons#index", :via => :get
    match '/close_reasons/:id/edit(.:format)' => "close_reasons#edit", :via => :get
    match '/close_reasons/:id(.:format)' => "close_reasons#update", :via => :put
    match '/close_reasons/new(.:format)' => "close_reasons#new", :via => :get
    match '/close_reasons/create(.:format)' => "close_reasons#create", :via => :post
    match '/close_reasons/:id/show(.:format)' => "close_reasons#show", :via => :get
    match '/close_reasons/get_data(.:format)' => "close_reasons#get_data"
    #incident_phases
    match '/incident_phases(/index)(.:format)' => "incident_phases#index", :via => :get
    match '/incident_phases/:id/edit(.:format)' => "incident_phases#edit", :via => :get
    match '/incident_phases/:id(.:format)' => "incident_phases#update", :via => :put
    match '/incident_phases/new(.:format)' => "incident_phases#new", :via => :get
    match '/incident_phases/create(.:format)' => "incident_phases#create", :via => :post
    match '/incident_phases/get_data(.:format)' => "incident_phases#get_data"
    match '/incident_phases/:id/show(.:format)' => "incident_phases#show", :via => :get
    #incident_statuses
    match '/incident_statuses(/index)(.:format)' => "incident_statuses#index", :via => :get
    match '/incident_statuses/:id/edit(.:format)' => "incident_statuses#edit", :via => :get
    match '/incident_statuses/:id(.:format)' => "incident_statuses#update", :via => :put
    match '/incident_statuses/new(.:format)' => "incident_statuses#new", :via => :get
    match '/incident_statuses/create(.:format)' => "incident_statuses#create", :via => :post
    match '/incident_statuses/:id/multilingual_edit(.:format)' => "incident_statuses#multilingual_edit", :via => :get
    match '/incident_statuses/:id/multilingual_update(.:format)' => "incident_statuses#multilingual_update", :via => :put
    match '/incident_statuses/get_data(.:format)' => "incident_statuses#get_data"
    match '/incident_statuses/:id(.:format)' => "incident_statuses#show", :via => :get
  end

  scope :module => "cms" do
    match '/cmshome(/index)(.:format)' => "home#index", :via => :get
  end

  scope :module => "ebs" do
    match '/ebshome(/index)(.:format)' => "home#index", :via => :get
  end  

  match '/demo(/index)' => 'demo#index'
  themes_for_rails
end
