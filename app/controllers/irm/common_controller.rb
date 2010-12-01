class Irm::CommonController < ApplicationController
  skip_before_filter :check_if_login_required

  def login
    
  end
end
