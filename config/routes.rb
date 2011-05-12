Ironmine::Application.routes.draw do
  scope :module => "irm" do
    root :to => "navigations#index"
    match 'login'=>'common#login',:as=>:login
    match 'combo'=>'navigations#combo'
    match 'access_deny' => 'navigations#access_deny'
    match 'logout'=>'common#logout',:as=>:logout
    match 'forgot_password' => "common#forgot_password"
    match 'common/search_options' => "common#search_options"
    match 'search(/index)(.:format)'=>"search#index",:via=>[:get,:post]
    #lookup_types
    match '/lookup_types/new(.:format)'=>"lookup_types#new",:via=>:get
    match '/lookup_types/create(.:format)'=>"lookup_types#create",:via=>:post
    match '/lookup_types/create_value(.:format)'=>"lookup_types#create_value",:via=>:post
    match '/lookup_types/create_edit_value(.:format)'=>"lookup_types#create_edit_value",:via=>:post
    match '/lookup_types/get_lookup_types(.:format)'=>"lookup_types#get_lookup_types",:via=>:get
    match '/lookup_types/get_lookup_values(.:format)'=>"lookup_types#get_lookup_values",:via=>:get
    match '/lookup_types(/index)(.:format)'=>"lookup_types#index",:via=>:get
    match '/lookup_types/:id/edit(.:format)'=>"lookup_types#edit",:via=>:get
    match '/lookup_types/:id/multilingual_edit(.:format)' => "lookup_types#multilingual_edit", :via => :get
    match '/lookup_types/:id/multilingual_update(.:format)' => "lookup_types#multilingual_update", :via => :put
    match '/lookup_types/:id'=>"lookup_types#update",:via=>:put
    match '/lookup_types/check_lookup_code'=>"lookup_types#check_lookup_code"
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
    match '/menus/:id/multilingual_edit(.:format)' => "menus#multilingual_edit", :via => :get
    match '/menus/:id/multilingual_update(.:format)' => "menus#multilingual_update", :via => :put

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
    match '/identities/get_data(.:format)' => "identities#get_data", :via => :get
    match '/identities/:id/show(.:format)' => "identities#show", :via => :get

    #my_info
    match '/my_info(/index)(.:format)' => "my_info#index", :via => :get
    match '/my_info/edit(.:format)' => "my_info#edit", :via => :get
    match '/my_info/update(.:format)' => "my_info#update", :via => :put
    match '/my_info/filter_company(.:format)' => "my_info#filter_company", :via => :post
    match '/my_info/update_company_access(.:format)' => "my_info#update_company_access", :via => :put

    #my_password
    match '/my_password(.:format)' => "my_password#index", :via => :get
    match '/my_password/edit_password(.:format)' => "my_password#edit_password", :via => :get
    match '/my_password/update_password(.:format)' => "my_password#update_password", :via => :put

    #my_avatar
    match '/my_avatar(/index)(.:format)' => "my_avatar#index", :via => :get
    match '/my_avatar/edit(.:format)' => "my_avatar#edit", :via => :get
    match '/my_avatar/update(.:format)' => "my_avatar#update", :via => :put
    match '/my_avatar/:id/avatar_crop(.:format)' => "my_avatar#avatar_crop", :via => :get

    #my_login_history
    match '/my_login_history(/index)(.:format)' => "my_login_history#index", :via => :get
    match '/my_login_history/get_login_data(.:format)' => "my_login_history#get_login_data", :via => :get

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

    #ldap_sources
    match '/ldap_sources(/index)(.:format)' => "ldap_sources#index", :via => :get
    match '/ldap_sources/:id/edit(.:format)' => "ldap_sources#edit", :via => :get
    match '/ldap_sources/:id/execute_test(.:format)' => "ldap_sources#execute_test", :via => :get
    match '/ldap_sources/:id/active(.:format)' => "ldap_sources#active", :via => :get
    match '/ldap_sources/:id(.:format)' => "ldap_sources#update", :via => :put
    match '/ldap_sources/new(.:format)' => "ldap_sources#new", :via => :get
    match '/ldap_sources/create(.:format)' => "ldap_sources#create", :via => :post
    match '/ldap_sources/get_data(.:format)' => "ldap_sources#get_data"
    match '/ldap_sources/:id/show(.:format)' => "ldap_sources#show", :via => :get

    #ldap_auth_headers
    match '/ldap_auth_headers(/index)(.:format)' => "ldap_auth_headers#index", :via => :get
    match '/ldap_auth_headers/:id/edit(.:format)' => "ldap_auth_headers#edit", :via => :get
    match '/ldap_auth_headers/:id(.:format)' => "ldap_auth_headers#update", :via => :put
    match '/ldap_auth_headers/new(.:format)' => "ldap_auth_headers#new", :via => :get
    match '/ldap_auth_headers/create(.:format)' => "ldap_auth_headers#create", :via => :post
    match '/ldap_auth_headers/get_data(.:format)' => "ldap_auth_headers#get_data"
    match '/ldap_auth_headers/:id/show(.:format)' => "ldap_auth_headers#show", :via => :get
    #ldap_auth_attributes
    match '/ldap_auth_attributes(/index)(.:format)' => "ldap_auth_attributes#index", :via => :get
    match '/ldap_auth_headers/:ah_id/ldap_auth_attributes/new(.:format)' => "ldap_auth_attributes#new", :via => [:get,:post,:put]
    match '/ldap_auth_headers/:ah_id/ldap_auth_attributes/create(.:format)' => "ldap_auth_attributes#create", :via => :post
    match '/ldap_auth_headers/:ah_id/ldap_auth_attributes/get_data(.:format)' => "ldap_auth_attributes#get_data"
    match '/ldap_auth_headers/:ah_id/ldap_auth_attributes/:id/edit(.:format)' => "ldap_auth_attributes#edit", :via => :get
    match '/ldap_auth_headers/:ah_id/ldap_auth_attributes/:id/update(.:format)' => "ldap_auth_attributes#update", :via => :put
    match '/ldap_auth_headers/:ah_id/ldap_auth_attributes/:id/show(.:format)' => "ldap_auth_attributes#show", :via => :get
    match '/ldap_auth_headers/:ah_id/ldap_auth_attributes/:id/delete(.:format)' => "ldap_auth_attributes#destroy", :via => :delete
    match '/ldap_auth_headers/get_by_ldap_source(.:format)' => "ldap_auth_headers#get_by_ldap_source", :via => :get

    #ldap_syn_header
    match '/ldap_syn_headers(/index)(.:format)' => "ldap_syn_headers#index", :via => :get
    match '/ldap_syn_headers/:id/edit(.:format)' => "ldap_syn_headers#edit", :via => :get
    match '/ldap_syn_headers/execute_test(.:format)' => "ldap_syn_headers#execute_test", :via => :get
    match '/ldap_syn_headers/:id/execute_test(.:format)' => "ldap_syn_headers#execute_test", :via => :get
    match '/ldap_syn_headers/:id(.:format)' => "ldap_syn_headers#update", :via => :put
    match '/ldap_syn_headers/new(.:format)' => "ldap_syn_headers#new", :via => :get
    match '/ldap_syn_headers/create(.:format)' => "ldap_syn_headers#create", :via => :post
    match '/ldap_syn_headers/:id/multilingual_edit(.:format)' => "ldap_syn_headers#multilingual_edit", :via => :get
    match '/ldap_syn_headers/:id/multilingual_update(.:format)' => "ldap_syn_headers#multilingual_update", :via => :put
    match '/ldap_syn_headers/get_data(.:format)' => "ldap_syn_headers#get_data"
    match '/ldap_syn_headers/:id/show(.:format)' => "ldap_syn_headers#show", :via => :get
    match '/ldap_syn_headers/:id/active(.:format)' => "ldap_syn_headers#active", :via => :get

    #ldap_syn_attributes
    match '/ldap_syn_attributes(/index)(.:format)' => "ldap_syn_attributes#index", :via => :get
    match '/ldap_syn_headers/:ah_id/:type/ldap_syn_attributes/new(.:format)' => "ldap_syn_attributes#new", :via => [:get,:post,:put]
    match '/ldap_syn_headers/:ah_id/:type/ldap_syn_attributes/create(.:format)' => "ldap_syn_attributes#create", :via => :post
    match '/ldap_syn_headers/:ah_id/:type/ldap_syn_attributes/get_data(.:format)' => "ldap_syn_attributes#get_data"
    match '/ldap_syn_headers/:ah_id/ldap_syn_attributes/:id/edit(.:format)' => "ldap_syn_attributes#edit", :via => :get
    match '/ldap_syn_headers/:ah_id/ldap_syn_attributes/:id/show(.:format)' => "ldap_syn_attributes#show", :via => :get
    match '/ldap_syn_headers/:ah_id/ldap_syn_attributes/:id(.:format)' => "ldap_syn_attributes#update", :via => :put
    match '/ldap_syn_headers/:ah_id/ldap_syn_attributes/:id/delete(.:format)' => "ldap_syn_attributes#destroy", :via => :delete

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
    # navigations
    match '/navigations/change_role(.:format)'=>"navigations#change_role",:via=>:get
    #mail_templates
    match '/mail_templates/new(.:format)'=>"mail_templates#new",:via=>:get
    match '/mail_templates/get_data(.:format)' => "mail_templates#get_data"
    match '/mail_templates(.:format)'=>"mail_templates#create",:via=>:post
    match '/mail_templates/copy(.:format)'=>"mail_templates#copy",:via=>:get
    match '/mail_templates/copy_template(.:format)'=>"mail_templates#copy_template",:via=>:post
    match '/mail_templates/test_mail_template'=>"mail_templates#test_mail_template"
    match '/mail_templates(/index)(.:format)'=>"mail_templates#index",:via=>:get
    match '/mail_templates/:id/edit(.:format)'=>"mail_templates#edit",:via=>:get
    match '/mail_templates/:id(.:format)'=>"mail_templates#update",:via=>:put
    match '/mail_templates/:id(.:format)'=>"mail_templates#destroy",:via=>:delete
    match '/mail_templates/:id/show(.:format)'=>"mail_templates#show",:via=>:get
    match '/mail_templates/get_script_context_fields(.:format)'=>"mail_templates#get_script_context_fields",:via=>:get
    match '/mail_templates/get_mail_templates(.:format)'=>"mail_templates#get_mail_templates",:via=>:get    

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
    match '/organizations/:id/show(.:format)' => "organizations#show", :via => :get
    match '/organizations/create(.:format)' => "organizations#create", :via => :post
    match '/organizations/:id/multilingual_edit(.:format)' => "organizations#multilingual_edit", :via => :get
    match '/organizations/:id/multilingual_update(.:format)' => "organizations#multilingual_update", :via => :put
    match '/organizations/belongs_to(.:format)' => "organizations#belongs_to"
    match '/organizations/get_by_company(.:format)' => "organizations#get_by_company", :via => :get
    #departments
    match '/departments/get_data(.:format)' => "departments#get_data"
    match '/departments(/index)(.:format)' => "departments#index", :via => :get
    match '/departments/:id/edit(.:format)' => "departments#edit", :via => :get
    match '/departments/:id(.:format)' => "departments#update", :via => :put
    match '/departments/new(.:format)' => "departments#new", :via => :get
    match '/departments/:id/show(.:format)' => "departments#show", :via => :get
    match '/departments/create(.:format)' => "departments#create", :via => :post
    match '/departments/:id/multilingual_edit(.:format)' => "departments#multilingual_edit", :via => :get
    match '/departments/:id/multilingual_update(.:format)' => "departments#multilingual_update", :via => :put
    match '/departments/belongs_to(.:format)' => "departments#belongs_to"
    match '/departments/get_by_organization(.:format)' => "departments#get_by_organization", :via => :get
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
    match '/site_groups/:id/update(.:format)' => "site_groups#update", :via => :put
    match '/site_groups/new(.:format)' => "site_groups#new", :via => :get
    match '/site_groups/create(.:format)' => "site_groups#create", :via => :post
    match '/site_groups/:id/multilingual_edit(.:format)' => "site_groups#multilingual_edit", :via => :get
    match '/site_groups/:id/multilingual_update(.:format)' => "site_groups#multilingual_update", :via => :put
    match '/site_groups/get_data(.:format)' => "site_groups#get_data"
    match '/site_groups/get_current_group_site(.:format)' => "site_groups#get_current_group_site"
    match '/site_groups/create_site(.:format)' => "site_groups#create_site"
    match '/site_groups/belongs_to(.:format)' => "site_groups#belongs_to"
    match '/site_groups/:id/show(.:format)' => "site_groups#show"
    match '/site_groups/:id/add_site(.:format)' => "site_groups#add_site"
    match '/site_groups/:id/edit_site(.:format)' => "site_groups#edit_site"
    match '/site_groups/:id/update_site(.:format)' => "site_groups#update_site"
    match '/site_groups/:id/current_site_group(.:format)' => "site_groups#current_site_group"
    match '/site_groups/:id/multilingual_site_edit(.:format)' => "site_groups#multilingual_site_edit", :via => :get
    match '/site_groups/:id/multilingual_site_update(.:format)' => "site_groups#multilingual_site_update", :via => :put
    match '/site_groups/get_by_region_code(.:format)' => "site_groups#get_by_region_code", :via => :get

    #general_categories
    match '/general_categories(/index)(.:format)' => "general_categories#index", :via => :get
    match '/general_categories/new(.:format)' => "general_categories#new"
    match '/general_categories/create(.:format)' => "general_categories#create", :via => :post
    match '/general_categories/get_data(.:format)' => "general_categories#get_data"
    match '/general_categories/:id/edit(.:format)' => "general_categories#edit", :via => :get
    match '/general_categories/:id(.:format)' => "general_categories#update", :via => :put
    match '/general_categories/update_segment_options(.:format)' => "general_categories#update_segment_options"
    match '/general_categories/:id/show(.:format)' => "general_categories#show", :via => :get
    
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
    match '/sites/:id/update(.:format)' => "sites#update", :via => :put
    match '/sites/new(.:format)' => "sites#new", :via => :get
    match '/sites/:id/show(.:format)' => "sites#show", :via => :get
    match '/sites/create(.:format)' => "sites#create", :via => :post
    match '/sites/select_site(.:format)' => "sites#select_site", :via => :post
    match '/sites/:id/multilingual_edit(.:format)' => "sites#multilingual_edit", :via => :get
    match '/sites/:id/multilingual_update(.:format)' => "sites#multilingual_update", :via => :put
    match '/sites/get_by_site_group_code(.:format)' => "sites#get_by_site_group_code", :via => :get
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
    match '/people/:id/get_available_roles(.:format)' => "people#get_available_roles", :via => :get
    match '/people/:id/select_roles(.:format)' => "people#select_roles", :via => :get
    match '/people/:id/add_roles(.:format)' => "people#add_roles", :via => :post
    match '/people/:person_id/:role_id/remove_role(.:format)' => "people#remove_role", :via => :get
    match '/people/:person_id/get_owned_roles(.:format)' => "people#get_owned_roles", :via => :get
    #company_accesses
    match '/company_accesses(/index)(.:format)' => "company_accesses#index", :via => :get
    match '/company_accesses/:id/edit(.:format)' => "company_accesses#edit", :via => :get
    match '/company_accesses/:id(.:format)' => "company_accesses#update", :via => :put
    match '/company_accesses/new(.:format)' => "company_accesses#new", :via => :get
    match '/company_accesses/create(.:format)' => "company_accesses#create"
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
    match '/id_flex_segments(/index)(.:format)' => "id_flex_segments#index", :via => :get
    match '/id_flex_segments/get_data(.:format)' => "id_flex_segments#get_data"
    match '/id_flex_segments/:id/edit(.:format)' => "id_flex_segments#edit", :via => :get
    match '/id_flex_segments/:id(.:format)' => "id_flex_segments#update", :via => :put
    match '/id_flex_segments/:id_flex_code/:id_flex_num/new(.:format)' => "id_flex_segments#new", :via => :get
    match '/id_flex_segments/create(.:format)' => "id_flex_segments#create", :via => :post
    match '/id_flex_segments/:id/show(.:format)' => "id_flex_segments#show", :via => :get
    #support_group_members
    match '/support_group_members(/index)(.:format)' => "support_group_members#index", :via => :get
    match '/support_group_members/:id/delete(.:format)' => "support_group_members#delete", :via => :delete
    match '/support_group_members/:support_group_id/create(.:format)' => "support_group_members#create"
    match '/support_group_members/get_data(.:format)' => "support_group_members#get_data"
    match '/support_group_members/:support_group_id/select_person(.:format)' => "support_group_members#select_person"
    match '/support_group_members/get_person(.:format)' => "support_group_members#get_person"
    match '/support_group_members/get_options(.:format)' => "support_group_members#get_options",:via=>:get
    match '/support_group_members/:person_id/new_from_person(.:format)' => "support_group_members#new_from_person",:via=>:get
    match '/support_group_members/:person_id/get_person_support_group(.:format)' => "support_group_members#get_person_support_group",:via=>:get
    match '/support_group_members/:person_id/create_from_person(.:format)' => "support_group_members#create_from_person",:via=>:post
    match '/support_group_members/:id/delete_from_person(.:format)' => "support_group_members#delete_from_person", :via => :delete


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
    #user_home
    match '/user_home(/index)(.:format)' => "user_home#index", :via => :get
    #view_filter
    match '/filters/index/:sc/:bc(.:format)' => "filters#index", :via => :get
    match '/filters/new/:sc/:bc(.:format)' => "filters#new", :via => :get
    match '/filters/create(.:format)' => "filters#create", :via => :post
    match '/filters/:id/edit(.:format)' => "filters#edit", :via => :get
    match '/filters/:id(.:format)' => "filters#update", :via => :put
    match '/filters/operator_value(.:format)' => "filters#operator_value", :via => :get
    #role
    match '/roles(/index)(.:format)' => "roles#index", :via => :get
    match '/roles/:id/edit(.:format)' => "roles#edit", :via => :get
    match '/roles/:id(.:format)' => "roles#update", :via => :put
    match '/roles/new(.:format)' => "roles#new", :via => :get
    match '/roles/create(.:format)' => "roles#create", :via => :post
    match '/roles/get_data(.:format)' => "roles#get_data"
    match '/roles/:id/show(.:format)' => "roles#show", :via => :get
    match '/roles/:id/multilingual_edit(.:format)' => "roles#multilingual_edit", :via => :get
    match '/roles/:id/multilingual_update(.:format)' => "roles#multilingual_update", :via => :put    
    #dev_tools
    match '/dev_tools(/index)(.format)' => 'dev_tools#index', :via => :get
    match '/dev_tools/show_permissions(.format)' => 'dev_tools#show_permissions', :via => :get
    match '/dev_tools/show_permissions_data(.format)' => 'dev_tools#show_permissions_data', :via => :get
    match '/dev_tools/show_missed_permissions(.format)' => 'dev_tools#show_missed_permissions', :via => :get
    match '/dev_tools/missed_permissions_data(.format)' => 'dev_tools#missed_permissions_data', :via => :get
    #reports
    match '/reports(/index)(.:format)' => "reports#index", :via => :get
    match '/reports/:id/edit(.:format)' => "reports#edit", :via => :get
    match '/reports/:id(.:format)' => "reports#update", :via => :put
    match '/reports/new(.:format)' => "reports#new", :via => :get
    match '/reports/create(.:format)' => "reports#create", :via => :post
    match '/reports/get_data(.:format)' => "reports#get_data"
    match '/reports/:id/show(.:format)' => "reports#show", :via => :get
    match '/reports/:id(.:format)' => "reports#show", :via => :get
    match '/reports/:id/multilingual_edit(.:format)' => "reports#multilingual_edit", :via => :get
    match '/reports/:id/multilingual_update(.:format)' => "reports#multilingual_update", :via => :put
    #reports
    match '/report_groups(/index)(.:format)' => "report_groups#index", :via => :get
    match '/report_groups/:id/edit(.:format)' => "report_groups#edit", :via => :get
    match '/report_groups/:id(.:format)' => "report_groups#update", :via => :put
    match '/report_groups/new(.:format)' => "report_groups#new", :via => :get
    match '/report_groups/create(.:format)' => "report_groups#create", :via => :post
    match '/report_groups/get_data(.:format)' => "report_groups#get_data"
    match '/report_groups/:id(.:format)' => "report_groups#show", :via => :get
    match '/report_groups/:id/multilingual_edit(.:format)' => "report_groups#multilingual_edit", :via => :get
    match '/report_groups/:id/multilingual_update(.:format)' => "report_groups#multilingual_update", :via => :put

    #report_lists
    match '/report_lists/index(.:format)' => "report_lists#index"
    match '/report_lists/get_data(.:format)' => "report_lists#get_data"
    #report_groups
    match '/report_groups/:group_id/members(/index)(.:format)' => "report_group_members#index", :via => :get
    match '/report_groups/:group_id/members/new(.:format)' => "report_group_members#new", :via => :get
    match '/report_groups/:group_id/members/get_data(.:format)' => "report_group_members#get_data", :via => :get
    match '/report_groups/:group_id/members/get_selectable_data(.:format)' => "report_group_members#get_selectable_data", :via => :get
    match '/report_groups/:group_id/members/create(.:format)' => "report_group_members#create", :via => :post
    #match '/report_groups/:group_id/members/:id/edit(.:format)' => "report_group_members#create", :via => :post
    #match '/report_groups/:group_id/members/:id(.:format)' => "report_group_members#update", :via => :put
    match '/report_groups/:group_id/members/:id/delete(.:format)' => "report_group_members#destroy", :via => :delete

    #common report
    match '/common_reports/rpt_person_login_summary(.:format)' => "common_reports#rpt_person_login_summary"
    match '/common_reports/get_report_summary(.:format)' => "common_reports#get_report_summary"

    match '/bulletins/new(.:format)' => "bulletins#new", :via => :get
    match '/bulletins/create(.:format)' => "bulletins#create", :via => :post
    match '/bulletins/:id/edit(.:format)' => "bulletins#edit", :via => :get
    match '/bulletins/:id(.:format)' => "bulletins#update", :via => :put
    match '/bulletins/get_data(.:format)' => "bulletins#get_data"
    match '/bulletins/index(.:format)' => "bulletins#index"
    match '/bulletins/:id/show(.:format)' => "bulletins#show", :via => :get
    match '/bulletins/get_ava_departments' => "bulletins#get_ava_departments", :via => :get
    match '/bulletins/get_ava_organizations' => "bulletins#get_ava_organizations", :via => :get

    match '/watchers/:watchable_id/add_watcher(.:format)' => "watchers#add_watcher"
    match '/watchers/delete_watcher(.:format)' => "watchers#delete_watcher"

#    match '/calendar_tasks(/:year(/:month))' => 'calendar_tasks#index', :as => :calendar_task, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}
    match '/todo_events(/index)(.:format)' => "todo_events#index", :via => :get
    match '/todo_events/new(.:format)' => "todo_events#new", :via => :get
    match '/todo_events/create(.:format)' => "todo_events#create", :via => :post
    match '/todo_events/:id/edit(.:format)' => "todo_events#edit", :via => :get
    match '/todo_events/:id(.:format)' => "todo_events#update", :via => :put
    match '/todo_events/get_data(.:format)' => "todo_events#get_data"
    match '/todo_events/get_top_data(.:format)' => "todo_events#get_top_data"
    match '/todo_events/:id/show(.:format)' => "todo_events#show", :via => :get
    match '/todo_events/:id/edit_recurrence(.:format)' => "todo_events#edit_recurrence", :via => :get
    match '/todo_events/:id/update_recurrence(.:format)' => "todo_events#update_recurrence", :via => :put
    match '/todo_events/:id/quick_show(.:format)' => "todo_events#quick_show", :via => :get
    match '/todo_events/my_events_index(.:format)' => "todo_events#my_events_index", :via => :get
    match '/todo_events/my_events_get_data(.:format)' => "todo_events#my_events_get_data"
    match '/todo_events/calendar_view(.:format)' => "todo_events#calendar_view"

    match '/todo_tasks(/index)(.:format)' => "todo_tasks#index", :via => :get
    match '/todo_tasks/new(.:format)' => "todo_tasks#new", :via => :get
    match '/todo_tasks/create(.:format)' => "todo_tasks#create", :via => :post
    match '/todo_tasks/:id/edit(.:format)' => "todo_tasks#edit", :via => :get
    match '/todo_tasks/:id(.:format)' => "todo_tasks#update", :via => :put
    match '/todo_tasks/get_data(.:format)' => "todo_tasks#get_data"
    match '/todo_tasks/get_top_data(.:format)' => "todo_tasks#get_top_data"
    match '/todo_tasks/:id/show(.:format)' => "todo_tasks#show", :via => :get
    match '/todo_tasks/:id/edit_recurrence(.:format)' => "todo_tasks#edit_recurrence", :via => :get
    match '/todo_tasks/:id/update_recurrence(.:format)' => "todo_tasks#update_recurrence", :via => :put
    match '/todo_tasks/my_tasks_index(.:format)' => "todo_tasks#my_tasks_index", :via => :get
    match '/todo_tasks/my_tasks_get_data(.:format)' => "todo_tasks#my_tasks_get_data"

    match '/calendars(/:year(/:month))' => 'calendars#get_full_calendar', :as => :calendar_task, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}
    # business object
    match '/business_objects(/index)(.:format)' => "business_objects#index", :via => :get
    match '/business_objects/new(.:format)' => "business_objects#new", :via => :get
    match '/business_objects/create(.:format)' => "business_objects#create", :via => :post
    match '/business_objects/get_data(.:format)' => "business_objects#get_data"
    match '/business_objects/:id/edit(.:format)' => "business_objects#edit", :via => :get
    match '/business_objects/:id(.:format)' => "business_objects#update", :via => :put
    match '/business_objects/:id/show(.:format)' => "business_objects#show", :via => :get
    match '/business_objects/:id/execute_test(.:format)' => "business_objects#execute_test", :via => :get
    match '/business_objects/:id/multilingual_edit(.:format)' => "business_objects#multilingual_edit", :via => :get
    match '/business_objects/:id/multilingual_update(.:format)' => "business_objects#multilingual_update", :via => :put
    # object attributes
    match '/object_attributes(/index)(.:format)' => "object_attributes#index", :via => :get
    match '/business_objects/:bo_id/object_attributes/new(.:format)' => "object_attributes#new", :via => [:get,:post,:put]
    match '/business_objects/:bo_id/object_attributes/create(.:format)' => "object_attributes#create", :via => :post
    match '/business_objects/:bo_id/object_attributes/get_data(.:format)' => "object_attributes#get_data"
    match '/business_objects/:bo_id/object_attributes/:id/edit(.:format)' => "object_attributes#edit", :via => :get
    match '/business_objects/:bo_id/object_attributes/:id(.:format)' => "object_attributes#update", :via => :put
    match '/business_objects/:bo_id/object_attributes/:id/show(.:format)' => "object_attributes#show", :via => :get
    match '/business_objects/:bo_id/object_attributes/:id/delete(.:format)' => "object_attributes#destroy", :via => :delete
    match '/business_objects/:bo_id/object_attributes/:id/multilingual_edit(.:format)' => "object_attributes#multilingual_edit", :via => :get
    match '/business_objects/:bo_id/object_attributes/:id/multilingual_update(.:format)' => "object_attributes#multilingual_update", :via => :put
    match '/object_attributes/relation_columns(.:format)' => "object_attributes#relation_columns", :via => :get
    match '/object_attributes/selectable_columns(.:format)' => "object_attributes#selectable_columns", :via => :get
    # list of values
    match '/list_of_values(/index)(.:format)' => "list_of_values#index", :via => :get
    match '/list_of_values/new(.:format)' => "list_of_values#new", :via => :get
    match '/list_of_values/create(.:format)' => "list_of_values#create", :via => :post
    match '/list_of_values/get_data(.:format)' => "list_of_values#get_data"
    match '/list_of_values/:id/edit(.:format)' => "list_of_values#edit", :via => :get
    match '/list_of_values/:id(.:format)' => "list_of_values#update", :via => :put
    match '/list_of_values/:id/show(.:format)' => "list_of_values#show", :via => :get
    match '/list_of_values/:id/multilingual_edit(.:format)' => "list_of_values#multilingual_edit", :via => :get
    match '/list_of_values/:id/multilingual_update(.:format)' => "list_of_values#multilingual_update", :via => :put
    match '/list_of_values/:id/execute_test(.:format)' => "list_of_values#execute_test", :via => :get
    match '/list_of_values/:id/get_lov_data(.:format)' => "list_of_values#get_lov_data", :via => :get
    # wf_settings
    match '/wf_settings(/index)(.:format)' => "wf_settings#index", :via => :get
    match '/wf_settings/edit(.:format)' => "wf_settings#edit", :via => :get
    match '/wf_settings(.:format)' => "wf_settings#update", :via => :put
    # wf_rules
    match '/wf_rules(/index)(.:format)' => "wf_rules#index", :via => :get
    match '/wf_rules/new(.:format)' => "wf_rules#new", :via => [:get,:post,:put]
    match '/wf_rules/create(.:format)' => "wf_rules#create", :via => :post
    match '/wf_rules/get_data(.:format)' => "wf_rules#get_data"
    match '/wf_rules/:id/edit(.:format)' => "wf_rules#edit", :via => :get
    match '/wf_rules/:id/active(.:format)' => "wf_rules#active", :via => :get
    match '/wf_rules/:id(.:format)' => "wf_rules#update", :via => :put
    match '/wf_rules/:id/show(.:format)' => "wf_rules#show", :via => :get

    #wf_field_updates
    match '/wf_field_updates(/index)(.:format)' => "wf_field_updates#index", :via => :get
    match '/wf_field_updates/:id/edit(.:format)' => "wf_field_updates#edit", :via => :get
    match '/wf_field_updates/:id(.:format)' => "wf_field_updates#update", :via => :put
    match '/wf_field_updates/new(.:format)' => "wf_field_updates#new", :via => :get
    match '/wf_field_updates/create(.:format)' => "wf_field_updates#create", :via => :post
    match '/wf_field_updates/get_data(.:format)' => "wf_field_updates#get_data"
    match '/wf_field_updates/:id/show(.:format)' => "wf_field_updates#show", :via => :get
    match '/wf_field_updates/:id/destroy(.:format)' => "wf_field_updates#destroy", :via => :delete
    match '/wf_field_updates/set_value(.:format)' => "wf_field_updates#set_value", :via => :get
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
    match '/impact_ranges/:id/multilingual_edit(.:format)' => "impact_ranges#multilingual_edit", :via => :get
    match '/impact_ranges/:id/multilingual_update(.:format)' => "impact_ranges#multilingual_update", :via => :put    
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
    match '/close_reasons/:id/multilingual_edit(.:format)' => "close_reasons#multilingual_edit", :via => :get
    match '/close_reasons/:id/multilingual_update(.:format)' => "close_reasons#multilingual_update", :via => :put

    #incident_phases
    match '/incident_phases(/index)(.:format)' => "incident_phases#index", :via => :get
    match '/incident_phases/:id/edit(.:format)' => "incident_phases#edit", :via => :get
    match '/incident_phases/:id(.:format)' => "incident_phases#update", :via => :put
    match '/incident_phases/new(.:format)' => "incident_phases#new", :via => :get
    match '/incident_phases/create(.:format)' => "incident_phases#create", :via => :post
    match '/incident_phases/get_data(.:format)' => "incident_phases#get_data"
    match '/incident_phases/:id/show(.:format)' => "incident_phases#show", :via => :get
    match '/incident_phases/:id/multilingual_edit(.:format)' => "incident_phases#multilingual_edit", :via => :get
    match '/incident_phases/:id/multilingual_update(.:format)' => "incident_phases#multilingual_update", :via => :put    
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
    #incident_requests
    match '/incident_requests/get_external_systems(.:format)' => "incident_requests#get_external_systems", :via => :get
    match '/incident_requests/get_slm_services(.:format)' => "incident_requests#get_slm_services", :via => :get
    match '/incident_requests(/index)(.:format)' => "incident_requests#index", :via => :get
    match '/incident_requests/:id/edit(.:format)' => "incident_requests#edit", :via => :get
    match '/incident_requests/:id(.:format)' => "incident_requests#update", :via => :put
    match '/incident_requests/new(.:format)' => "incident_requests#new", :via => :get
    match '/incident_requests/create(.:format)' => "incident_requests#create", :via => :post
    match '/incident_requests/get_data(.:format)' => "incident_requests#get_data",:via=>:get
    match '/incident_requests/get_help_desk_data(.:format)' => "incident_requests#get_help_desk_data",:via=>:get
    match '/incident_requests/short_create(.:format)' => "incident_requests#short_create", :via => :post
    match '/incident_requests/assign_dashboard(.:format)' => "incident_requests#assign_dashboard", :via => :get
    match '/incident_requests/assignable_data(.:format)' => "incident_requests#assignable_data", :via => :get
    match '/incident_requests/assign_request(.:format)' => "incident_requests#assign_request", :via => :post
    #incident_journals
    match '/incident_requests/:request_id/journals(/index)(.:format)' => "incident_journals#index", :via => :get    
    match '/incident_requests/:request_id/journals/edit_close(.:format)' => "incident_journals#edit_close", :via => :get
    match '/incident_requests/:request_id/journals/update_close(.:format)' => "incident_journals#update_close", :via => :put
    match '/incident_requests/:request_id/journals/edit_pass(.:format)' => "incident_journals#edit_pass", :via => :get
    match '/incident_requests/:request_id/journals/update_pass(.:format)' => "incident_journals#update_pass", :via => :put
    match '/incident_requests/:request_id/journals/new(.:format)' => "incident_journals#new", :via => :get
    match '/incident_requests/:request_id/journals/create(.:format)' => "incident_journals#create", :via => :post
    match '/incident_requests/:request_id/journals/get_entry_header_data(.:format)' => "incident_journals#get_entry_header_data", :via => :get
    match '/incident_requests/:request_id/journals/apply_entry_header(.:format)' => "incident_journals#apply_entry_header", :via => :get
    #user_requests
    match '/user_requests(/index)(.:format)' => "user_requests#index", :via => :get
    match '/user_requests/new(.:format)' => "user_requests#new", :via => :get
    match '/user_requests/create(.:format)' => "user_requests#create", :via => :post
    match '/user_requests/get_data(.:format)' => "user_requests#get_data"
    match '/user_requests/:id(.:format)' => "user_requests#show", :via => :get
    #user_journals
    match '/user_requests/:request_id/journals(/index)(.:format)' => "user_journals#index", :via => :get
    match '/user_requests/:request_id/journals/new(.:format)' => "user_journals#new", :via => :get
    match '/user_requests/:request_id/journals/create(.:format)' => "user_journals#create", :via => :post
    #incident_reports
    match '/incident_reports/rpt_urgency_summary(.:format)' => "incident_reports#rpt_urgency_summary"
    match '/incident_reports/get_urgency_summary(.:format)' => "incident_reports#get_urgency_summary"
    match '/incident_reports/rpt_report_source_summary(.:format)' => "incident_reports#rpt_report_source_summary"
    match '/incident_reports/rpt_report_type_summary(.:format)' => "incident_reports#rpt_report_type_summary"
    match '/incident_reports/rpt_impact_range_summary(.:format)' => "incident_reports#rpt_impact_range_summary"
    match '/incident_reports/rpt_priority_code_summary(.:format)' => "incident_reports#rpt_priority_code_summary"
    match '/incident_reports/get_report_summary(.:format)' => "incident_reports#get_report_summary"
    match '/incident_reports/rpt_completed_urgency_summary(.:format)' => "incident_reports#rpt_completed_urgency_summary"
    match '/incident_reports/rpt_completed_source_summary(.:format)' => "incident_reports#rpt_completed_source_summary"
    match '/incident_reports/rpt_completed_type_summary(.:format)' => "incident_reports#rpt_completed_type_summary"
    match '/incident_reports/rpt_completed_impact_summary(.:format)' => "incident_reports#rpt_completed_impact_summary"
    match '/incident_reports/rpt_completed_priority_summary(.:format)' => "incident_reports#rpt_completed_priority_summary"
    match '/incident_reports/rpt_unsolved_urgency_summary(.:format)' => "incident_reports#rpt_unsolved_urgency_summary"
    match '/incident_reports/rpt_unsolved_source_summary(.:format)' => "incident_reports#rpt_unsolved_source_summary"
    match '/incident_reports/rpt_unsolved_type_summary(.:format)' => "incident_reports#rpt_unsolved_type_summary"
    match '/incident_reports/rpt_unsolved_impact_summary(.:format)' => "incident_reports#rpt_unsolved_impact_summary"
    match '/incident_reports/rpt_unsolved_priority_summary(.:format)' => "incident_reports#rpt_unsolved_priority_summary"
    match '/incident_reports/rpt_unalloca_urgency_summary(.:format)' => "incident_reports#rpt_unalloca_urgency_summary"
    match '/incident_reports/rpt_unalloca_source_summary(.:format)' => "incident_reports#rpt_unalloca_source_summary"
    match '/incident_reports/rpt_unalloca_type_summary(.:format)' => "incident_reports#rpt_unalloca_type_summary"
    match '/incident_reports/rpt_unalloca_impact_summary(.:format)' => "incident_reports#rpt_unalloca_impact_summary"
    match '/incident_reports/rpt_unalloca_priority_summary(.:format)' => "incident_reports#rpt_unalloca_priority_summary"
    match '/incident_reports/rpt_incident_stat_month(.:format)' => "incident_reports#rpt_incident_stat_month"
    match '/incident_reports/index(.:format)' => "incident_reports#index"
    #group_assignments
    match '/group_assignments(/index)(.:format)' => "group_assignments#index", :via => :get
    match '/group_assignments/:id/edit(.:format)' => "group_assignments#edit", :via => :get
    match '/group_assignments/:id(.:format)' => "group_assignments#update", :via => :put
    match '/group_assignments/new(.:format)' => "group_assignments#new", :via => :get
    match '/group_assignments/create(.:format)' => "group_assignments#create", :via => :post
    match '/group_assignments/get_data(.:format)' => "group_assignments#get_data"
    match '/group_assignments/:id/destroy(.:format)' => "group_assignments#destroy"
    match '/group_assignments/get_customer_departments(.:format)' => "group_assignments#get_customer_departments", :via => :get
    match '/group_assignments/get_customer_sites(.:format)' => "group_assignments#get_customer_sites", :via => :get
    match '/group_assignments/get_customer_site_groups(.:format)' => "group_assignments#get_customer_site_groups", :via => :get
    match '/group_assignments/get_customer_people(.:format)' => "group_assignments#get_customer_people", :via => :get
    match '/group_assignments/get_customer_organizations(.:format)' => "group_assignments#get_customer_organizations", :via => :get
  end

  scope :module => "cms" do
    match '/cmshome(/index)(.:format)' => "home#index", :via => :get
  end

  scope :module => "ebs" do
    match '/ebshome(/index)(.:format)' => "home#index", :via => :get
  end

  scope :module => "csi" do
    #surveys
    match '/surveys(/index)(.:format)' => "surveys#index", :via => :get
    match '/surveys/get_data(.:format)' => "surveys#get_data"
    match '/surveys/:id/edit(.:format)' => "surveys#edit", :via => :get
    match '/surveys/:id(.:format)' => "surveys#update", :via => :put
    match '/surveys/new(.:format)' => "surveys#new", :via => :get
    match '/surveys/:id/reply(.:format)' => "surveys#reply", :via => :get
    match '/surveys/create(.:format)' => "surveys#create", :via => :post
    match '/surveys/password'=> "surveys#password", :via => :post
    match '/surveys/create_result' => "surveys#create_result", :via => :post
    match '/surveys/thanks(.:format)' => "surveys#thanks", :via => :get
    match '/surveys/:id/show_result(.:format)' => "surveys#show_result", :via => :get
    match '/surveys/:id/export_result(.:format)' => "surveys#export_result", :via => :get
    match '/surveys/test(.:format)' => "surveys#test", :via => :get
    match '/surveys/:id/survey_report(.:format)' => "surveys#survey_report", :via => :get
    match '/surveys/get_survey_report(.:format)' => "surveys#get_survey_report", :via => :get
    match '/surveys/:id/show(.:format)' => "surveys#show", :via => :get
    match '/surveys/:id/active(.:format)' => "surveys#active", :via => :get
    match '/surveys/:id/show_reply(.:format)' => "surveys#show_reply", :via => :get



    #survey_subjects
    match '/surveys/:survey_id/survey_subjects(/index)(.:format)' => "survey_subjects#index", :via => :get
    match '/surveys/:survey_id/survey_subjects/get_data(.:format)' => "survey_subjects#get_data"
    match '/surveys/:survey_id/survey_subjects/:id/edit(.:format)' => "survey_subjects#edit", :via => :get
    match '/surveys/:survey_id/survey_subjects/:id(.:format)' => "survey_subjects#update", :via => :put
    match '/surveys/:survey_id/survey_subjects/new(.:format)' => "survey_subjects#new", :via => :get
    match '/surveys/:survey_id/survey_subjects/:id(.:format)' => "survey_subjects#show", :via => :get
    match '/surveys/:survey_id/survey_subjects/create(.:format)' => "survey_subjects#create", :via => :post
    match '/surveys/:survey_id/survey_subjects/:id(.:format)' => "survey_subjects#destroy", :via => :delete
    #survey_ranges
    match '/surveys/:survey_id/survey_ranges/get_data(.:format)' => "survey_ranges#get_data"
    match '/surveys/:survey_id/survey_ranges(/index)(.:format)' => "survey_ranges#index", :via => :get
    match '/surveys/:survey_id/survey_ranges/:id/edit(.:format)' => "survey_ranges#edit", :via => :get
    match '/surveys/:survey_id/survey_ranges/:id(.:format)' => "survey_ranges#update", :via => :put
    match '/surveys/:survey_id/survey_ranges/new(.:format)' => "survey_ranges#new", :via => :get
    match '/surveys/:survey_id/survey_ranges/create(.:format)' => "survey_ranges#create", :via => :post
    match '/surveys/:survey_id/survey_ranges/:id(.:format)'=>"survey_ranges#destroy",:via=>:delete
    match '/surveys/:survey_id/survey_ranges/:id(.:format)' => "survey_ranges#show", :via => :get
  end

  scope :module => "skm" do
    #entry_statuses
    match '/entry_statuses(/index)(.:format)' => "entry_statuses#index", :via => :get
    match '/entry_statuses/:id/edit(.:format)' => "entry_statuses#edit", :via => :get
    match '/entry_statuses/:id(.:format)' => "entry_statuses#update", :via => :put
    match '/entry_statuses/new(.:format)' => "entry_statuses#new", :via => :get
    match '/entry_statuses/create(.:format)' => "entry_statuses#create", :via => :post
    match '/entry_statuses/get_data(.:format)' => "entry_statuses#get_data"
    match '/entry_statuses/:id/show(.:format)' => "entry_statuses#show", :via => :get
    #entry_elements
    match '/entry_template_elements(/index)(.:format)' => "entry_template_elements#index", :via => :get
    match '/entry_template_elements/:id/edit(.:format)' => "entry_template_elements#edit", :via => :get
    match '/entry_template_elements/:id(.:format)' => "entry_template_elements#update", :via => :put
    match '/entry_template_elements/new(.:format)' => "entry_template_elements#new", :via => :get
    match '/entry_template_elements/create(.:format)' => "entry_template_elements#create", :via => :post
    match '/entry_template_elements/get_data(.:format)' => "entry_template_elements#get_data"
    match '/entry_template_elements/:id/show(.:format)' => "entry_template_elements#show", :via => :get
    #entry_templates
    match '/entry_templates(/index)(.:format)' => "entry_templates#index", :via => :get
    match '/entry_templates/:id/edit(.:format)' => "entry_templates#edit", :via => :get
    match '/entry_templates/:id(.:format)' => "entry_templates#update", :via => :put
    match '/entry_templates/new(.:format)' => "entry_templates#new", :via => :get
    match '/entry_templates/create(.:format)' => "entry_templates#create", :via => :post
    match '/entry_templates/get_data(.:format)' => "entry_templates#get_data"
    match '/entry_templates/:id/show(.:format)' => "entry_templates#show", :via => :get
    match '/entry_templates/:template_id/:element_id/remove_element(.:format)' => "entry_templates#remove_element", :via => :get
    match '/entry_templates/:template_id/add_elements(.:format)' => "entry_templates#add_elements", :via => :post
    match '/entry_templates/:template_id/select_elements(.:format)' => "entry_templates#select_elements", :via => :get
    match '/entry_templates/:template_id/get_owned_elements_data(.:format)' => "entry_templates#get_owned_elements_data", :via => :get
    match '/entry_templates/:template_id/get_available_elements(.:format)' => "entry_templates#get_available_elements", :via => :get
    match '/entry_templates/:template_id:element_id/up_element(.:format)' => "entry_templates#up_element", :via => :get
    match '/entry_templates/:template_id:element_id/down_element_elements(.:format)' => "entry_templates#down_element", :via => :get
    match '/entry_templates/:id/edit_detail(.:format)' => "entry_templates#edit_detail", :via => :get
    match '/entry_templates/:detail_id/update_detail(.:format)' => "entry_templates#update_detail"
    #entry_headers
    match '/entry_headers(/index)(.:format)' => "entry_headers#index", :via => :get
    match '/entry_headers/:id/edit(.:format)' => "entry_headers#edit", :via => :get
    match '/entry_headers/:id/update(.:format)' => "entry_headers#update", :via => :put
    match '/entry_headers/new(.:format)' => "entry_headers#new"
    match '/entry_headers/create(.:format)' => "entry_headers#create", :via => :post
    match '/entry_headers/get_data(.:format)' => "entry_headers#get_data"
    match '/entry_headers/:doc_number/get_history_entries_data(.:format)' => "entry_headers#get_history_entries_data"
    match '/entry_headers/:id/show(.:format)' => "entry_headers#show", :via => :get
    match '/entry_headers/new_step_1(.:format)' => "entry_headers#new_step_1", :via => :get
    match '/entry_headers/new_step_2(.:format)' => "entry_headers#new_step_2", :via => :get
    match '/entry_headers/new_step_3(.:format)' => "entry_headers#new_step_3", :via => :get
    match '/entry_headers/new_step_4(.:format)' => "entry_headers#new_step_4", :via => :get
    match '/entry_headers/index_search(.:format)' => "entry_headers#index_search", :via => :post
    match '/entry_headers/index_search_get_data(.:format)' => "entry_headers#index_search_get_data"
    match '/entry_headers/:person_id/my_favorites_data' => "entry_headers#my_favorites_data"
    match '/entry_headers/:person_id/my_favorites' => "entry_headers#my_favorites", :via => :get
    match '/entry_headers/:person_id/:id/add_favorites' => "entry_headers#add_favorites", :via => :get
    match '/entry_headers/data_grid(.:format)' => "entry_headers#data_grid", :via => :get
    match '/entry_headers/my_favorites(.:format)' => "entry_headers#my_favorites", :via => :get
    match '/entry_headers/remove_favorite(.:format)' => "entry_headers#remove_favorite", :via => :get
    match '/entry_headers/my_drafts(.:format)' => "entry_headers#my_drafts", :via => :get
    match '/entry_headers/:person_id/my_drafts_data' => "entry_headers#my_drafts_data"
    match '/entry_headers/new_from_icm_request' => "entry_headers#new_from_icm_request", :via => :get
    match '/entry_headers/:att_id/remove_exits_attachment_during_create' => "entry_headers#remove_exits_attachment_during_create", :via => :get
    #entry_reports
    match '/entry_reports/rpt_entry_submit_summary(.:format)'=>"entry_reports#rpt_entry_submit_summary"
    match '/entry_reports(/index)(.:format)'=>"entry_reports#index"

    match '/entry_reports/get_rpt_apply_data(.:format)' => "entry_reports#get_rpt_apply_data"
    match '/entry_reports/rpt_entry_apply_summary(.:format)'=>"entry_reports#rpt_entry_apply_summary"

    match '/entry_reports/rpt_search_history_summary(.:format)' => "entry_reports#rpt_search_history_summary"
    match '/entry_reports/get_search_history_data(.:format)'=>"entry_reports#get_search_history_data"

    match '/entry_reports/rpt_entry_show_history(.:format)' => "entry_reports#rpt_entry_show_history"
    match '/entry_reports/get_rpt_show_data(.:format)'=>"entry_reports#get_rpt_show_data"

    match '/entry_reports/rpt_entry_history_summary(.:format)' => "entry_reports#rpt_entry_history_summary"

    #file_managements
    match '/file_managements(/index)(.:format)' => "file_managements#index", :via => :get
    match '/file_managements/:id/edit(.:format)' => "file_managements#edit", :via => :get
    match '/file_managements/:id/update(.:format)' => "file_managements#update"
    match '/file_managements/new(.:format)' => "file_managements#new"
    match '/file_managements/batch_new(.:format)' => "file_managements#batch_new"
    match '/file_managements/create(.:format)' => "file_managements#create", :via => :post
    match '/file_managements/batch_create(.:format)' => "file_managements#batch_create", :via => :post
    match '/file_managements/get_data(.:format)' => "file_managements#get_data"
    match '/file_managements/:id/show(.:format)' => "file_managements#show", :via => :get
    match '/file_managements/destroy(.:format)' => "file_managements#destroy"
    match '/file_managements/:id/get_version_files(.:format)' => "file_managements#get_version_files"

    #skm_setting
    match '/skm_settings(/index)(.:format)' => "settings#index", :via => :get
    match '/skm_settings/edit(.:format)' => "settings#edit", :via => :get
    match '/skm_settings/update(.:format)' => "settings#update"
  end

  scope :module => "uid" do
    #external_systems
    match '/external_systems(/index)(.:format)' => "external_systems#index", :via => :get
    match '/external_systems/get_data(.:format)' => "external_systems#get_data"
    match '/external_systems/:id/edit(.:format)' => "external_systems#edit", :via => :get
    match '/external_systems/:id(.:format)' => "external_systems#update", :via => :put
    match '/external_systems/new(.:format)' => "external_systems#new", :via => :get
    match '/external_systems/:id(.:format)' => "external_systems#show", :via => :get
    match '/external_systems/create(.:format)' => "external_systems#create", :via => :post
    match '/external_systems/:id/multilingual_edit(.:format)' => "external_systems#multilingual_edit", :via => :get
    match '/external_systems/:id/multilingual_update(.:format)' => "external_systems#multilingual_update", :via => :put
    #external_logins
    match '/external_logins(/index)(.:format)' => "external_logins#index", :via => :get
    match '/external_logins/get_data(.:format)' => "external_logins#get_data"
    match '/external_logins/:id/edit(.:format)' => "external_logins#edit", :via => :get
    match '/external_logins/:id(.:format)' => "external_logins#update", :via => :put
    match '/external_logins/new(.:format)' => "external_logins#new", :via => :get
    match '/external_logins/:id/show(.:format)' => "external_logins#show", :via => :get
    match '/external_logins/create(.:format)' => "external_logins#create", :via => :post
    match '/external_logins/:id/multilingual_edit(.:format)' => "external_logins#multilingual_edit", :via => :get
    match '/external_logins/:id/multilingual_update(.:format)' => "external_logins#multilingual_update", :via => :put
    match '/external_logins/:id/delete(.:format)' => "external_logins#destroy", :via => :delete

    #login_mappings
    match '/login_mappings(/index)(.:format)' => "login_mappings#index", :via => :get
    match '/login_mappings/get_data(.:format)' => "login_mappings#get_data"
    match '/login_mappings/:id/edit(.:format)' => "login_mappings#edit", :via => :get
    match '/login_mappings/:id(.:format)' => "login_mappings#update", :via => :put
    match '/login_mappings/new(.:format)' => "login_mappings#new", :via => :get
    match '/login_mappings/:id/show(.:format)' => "login_mappings#show", :via => :get
    match '/login_mappings/create(.:format)' => "login_mappings#create", :via => :post
    match '/login_mappings/not_mpping_external_logins(.:format)' => "login_mappings#not_mpping_external_logins", :via => :get
    match '/login_mappings/:id/delete(.:format)' => "login_mappings#destroy", :via => :delete
    #auto_mappings
    match '/auto_mappings(/index)(.:format)' => "auto_mappings#index", :via => :get
    match '/auto_mappings/get_data(.:format)' => "auto_mappings#get_data"
    match '/auto_mappings/confirm(.:format)' => "auto_mappings#confirm"
    match '/auto_mappings/:id/edit(.:format)' => "auto_mappings#edit", :via => :get
    match '/auto_mappings/:id(.:format)' => "auto_mappings#update", :via => :put
    match '/auto_mappings/new(.:format)' => "auto_mappings#new", :via => :get
    match '/auto_mappings/:id(.:format)' => "auto_mappings#show", :via => :get
    match '/auto_mappings/create(.:format)' => "auto_mappings#create", :via => :post
    #import_files
    match '/import_files(/index)(.:format)' => "import_files#index", :via => :get
    match '/import_files/get_data(.:format)' => "import_files#get_data"
    match '/import_files/:id/edit(.:format)' => "import_files#edit", :via => :get
    match '/import_files/:id(.:format)' => "import_files#update", :via => :put
    match '/import_files/new(.:format)' => "import_files#new", :via => :get
    match '/import_files/:id(.:format)' => "import_files#show", :via => :get
    match '/import_files/create(.:format)' => "import_files#create", :via => :post
    #system_user_home
    match '/system_user_home(/index)(.:format)' => "system_user_home#index", :via => :get
    #external_user_home
    match '/external_user_home(/index)(.:format)' => "external_user_home#index", :via => :get
  end

  #service catalog and service level agreement(slm)
  scope :module => "slm" do
    #service categories
    match '/service_categories(/index)(.:format)' => "service_categories#index", :via => :get
    match '/service_categories/get_data(.:format)' => "service_categories#get_data"
    match '/service_categories/:id/edit(.:format)' => "service_categories#edit", :via => :get
    match '/service_categories/:id(.:format)' => "service_categories#update", :via => :put
    match '/service_categories/new(.:format)' => "service_categories#new", :via => :get
    match '/service_categories/:id(.:format)' => "service_categories#show", :via => :get
    match '/service_categories/create(.:format)' => "service_categories#create", :via => :post
    match '/service_categories/:id/multilingual_edit(.:format)' => "service_categories#multilingual_edit", :via => :get
    match '/service_categories/:id/multilingual_update(.:format)' => "service_categories#multilingual_update", :via => :put
    #service catalogs
    match '/service_catalogs(/index)(.:format)' => "service_catalogs#index", :via => :get
    match '/service_catalogs/get_data(.:format)' => "service_catalogs#get_data"
    match '/service_catalogs/:id/edit(.:format)' => "service_catalogs#edit", :via => :get
    match '/service_catalogs/:id(.:format)' => "service_catalogs#update", :via => :put
    match '/service_catalogs/new(.:format)' => "service_catalogs#new", :via => :get
    match '/service_catalogs/:id(.:format)' => "service_catalogs#show", :via => :get
    match '/service_catalogs/create(.:format)' => "service_catalogs#create", :via => :post
    match '/service_catalogs/:id/multilingual_edit(.:format)' => "service_catalogs#multilingual_edit", :via => :get
    match '/service_catalogs/:id/multilingual_update(.:format)' => "service_catalogs#multilingual_update", :via => :put
    #service_members
    match '/service_catalogs/:service_catalog_id/service_members(/index)(.:format)' => "service_members#index", :via => :get
    match '/service_catalogs/:service_catalog_id/service_members/get_data(.:format)' => "service_members#get_data"
    match '/service_catalogs/:service_catalog_id/service_members/:id/edit(.:format)' => "service_members#edit", :via => :get
    match '/service_catalogs/:service_catalog_id/service_members/:id(.:format)' => "service_members#update", :via => :put
    match '/service_catalogs/:service_catalog_id/service_members/new(.:format)' => "service_members#new", :via => :get
    match '/service_catalogs/:service_catalog_id/service_members/create(.:format)' => "service_members#create", :via => :post
    match '/service_catalogs/:service_catalog_id/service_members/:id(.:format)' => "service_members#destroy", :via => :delete
    match '/service_catalogs/:service_catalog_id/service_members/:id(.:format)' => "service_members#show", :via => :get
    #service_breaks
    match '/service_catalogs/:service_catalog_id/service_breaks(/index)(.:format)' => "service_breaks#index", :via => :get
    match '/service_catalogs/:service_catalog_id/service_breaks/get_data(.:format)' => "service_breaks#get_data"
    match '/service_catalogs/:service_catalog_id/service_breaks/:id/edit(.:format)' => "service_breaks#edit", :via => :get
    match '/service_catalogs/:service_catalog_id/service_breaks/:id(.:format)' => "service_breaks#update", :via => :put
    match '/service_catalogs/:service_catalog_id/service_breaks/new(.:format)' => "service_breaks#new", :via => :get
    match '/service_catalogs/:service_catalog_id/service_breaks/create(.:format)' => "service_breaks#create", :via => :post
    match '/service_catalogs/:service_catalog_id/service_breaks/:id(.:format)' => "service_breaks#destroy", :via => :delete
    match '/service_catalogs/:service_catalog_id/service_breaks/:id(.:format)' => "service_breaks#show", :via => :get
    #service_agreements
    match '/service_agreements(/index)(.:format)' => "service_agreements#index", :via => :get
    match '/service_agreements/get_data(.:format)' => "service_agreements#get_data"
    match '/service_agreements/add_response_time_rule(.:format)' => "service_agreements#add_response_time_rule"
    match '/service_agreements/add_solve_time_rule(.:format)' => "service_agreements#add_solve_time_rule"
    match '/service_agreements/get_by_assignee_type(.:format)' => "service_agreements#get_by_assignee_type"
    match '/service_agreements/:id/edit(.:format)' => "service_agreements#edit", :via => :get
    match '/service_agreements/:id(.:format)' => "service_agreements#update", :via => :put
    match '/service_agreements/new(.:format)' => "service_agreements#new", :via => :get
    match '/service_agreements/:id(.:format)' => "service_agreements#show", :via => :get
    match '/service_agreements/create(.:format)' => "service_agreements#create", :via => :post
    match '/service_agreements/:id/multilingual_edit(.:format)' => "service_agreements#multilingual_edit", :via => :get
    match '/service_agreements/:id/multilingual_update(.:format)' => "service_agreements#multilingual_update", :via => :put
    match '/service_agreements/:id/match_filter_edit(.:format)' => "service_agreements#match_filter_edit", :via => :get
    match '/service_agreements/:id/match_filter_update(.:format)' => "service_agreements#match_filter_update", :via => :put
  end
  
  match '/demo(/index)' => 'demo#index'
  themes_for_rails
end
