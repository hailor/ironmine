Ironmine::Application.routes.draw do
  scope :module => "irm" do
    match 'login'=>'common#login',:as=>:login
  end

  match '/demo(/index)' => 'demo#index'
  themes_for_rails
end
