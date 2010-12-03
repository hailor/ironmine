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
    match '/lookup_types/get_lookup_types(.:format)'=>"lookup_types#get_lookup_types",:via=>:get
    match '/lookup_types/index(.:format)'=>"lookup_types#index",:via=>:get
    match '/lookup_types/:id/show(.:format)'=>"lookup_types#show",:via=>:get
    match '/lookup_types/:id/edit(.:format)'=>"lookup_types#edit",:via=>:get
    match '/lookup_types/:id(.:format)'=>"lookup_types#update",:via=>:put
    match '/lookup_types/:id(.:format)'=>"lookup_types#destroy",:via=>:delete
    match '/lookup_types/:id/multilingual_edit(.:format)'=>"lookup_types#multilingual_edit",:via=>:get
    match '/lookup_types/get_current_language(.:format)'=>"lookup_types#get_current_language",:via=>:get
    match '/lookup_types/:id(.:format)/multilingual_update'=>"lookup_types#multilingual_update",:via=>:put

    #product modules
    match '/product_modules/index(.:format)' => "product_modules#index", :via => :get
    match '/product_modules/:id/edit(.:format)' => "product_modules#edit", :via => :get
    match '/product_modules/:id(.:format)' => "product_modules#update", :via => :put
    match '/product_modules/new(.:format)' => "product_modules#new", :via => :get
    match '/product_modules/create(.:format)' => "product_modules#create", :via => :post
    match '/product_modules/get_data(.:format)' => "product_modules#get_data"
  end

  match '/demo(/index)' => 'demo#index'
  themes_for_rails
end
