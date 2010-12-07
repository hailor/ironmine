Ironmine::Application.routes.draw do

  scope :module => "irm" do
    match 'login'=>'common#login',:as=>:login
    match 'multilingual_edit'=>'common#multilingual_edit'
    match 'multilingual_update'=>'common#multilingual_update'
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
    #product modules
    match '/product_modules/index(.:format)' => "product_modules#index", :via => :get
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
    match '/languages/index(.:format)' => "languages#index", :via => :get
    match '/languages/:id/edit(.:format)' => "languages#edit", :via => :get
    match '/languages/:id(.:format)' => "languages#update", :via => :put
    match '/languages/new(.:format)' => "languages#new", :via => :get
    match '/languages/create(.:format)' => "languages#create", :via => :post
    match '/languages/get_data(.:format)' => "languages#get_data"
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
    match '/menu_entries/index(.:format)' => "menu_entries#index", :via => :get
    match '/menu_entries/new(.:format)' => "menu_entries#new", :via => :get
    match '/menu_entries/create(.:format)' => "menu_entries#create", :via => :post
    match '/menu_entries/get_data(.:format)' => "menu_entries#get_data"
    match '/menu_entries/:id/edit(.:format)' => "menu_entries#edit", :via => :get
    match '/menu_entries/:id(.:format)' => "menu_entries#update", :via => :put
    match '/menu_entries/:id/multilingual_edit(.:format)' => "menu_entries#multilingual_edit", :via => :get
    match '/menu_entries/:id/multilingual_update(.:format)' => "menu_entries#multilingual_update", :via => :put    
  end

  match '/demo(/index)' => 'demo#index'
  themes_for_rails
end
