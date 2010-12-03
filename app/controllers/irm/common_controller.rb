class Irm::CommonController < ApplicationController
  skip_before_filter :check_if_login_required

  def login
    
  end


  def win_edit

  end

  def win_update
      @from_update = "i am from update"
    respond_to do |format|

        format.html { render({:action=>"win_edit",:format=>"html"}) }
        format.js   { render({:action=>"win_edit",:format=>"html"}) }

    end
  end
end
