Ironmine::Application.routes.draw do
  scope :module => "irm" do
    match 'login'=>'common#login',:as=>:login
  end
end
