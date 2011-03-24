class Irm::MyAvatarController < ApplicationController
  def index

  end

  def edit
    @person = Irm::Person.current
  end

  def avatar_crop
    @person = Irm::Person.find(params[:id])
  end

  def update
    @person = Irm::Person.find(params[:id])
    respond_to do |format|
      if params[:irm_person] && params[:irm_person][:avatar] && !params[:irm_person][:avatar].blank?
        if @person.update_attribute(:avatar, params[:irm_person][:avatar])
          if params[:return_url]
            format.html {redirect_to(params[:return_url])}
            format.xml { head :ok}
          else
            format.html {render "avatar_crop"}
          end
        else
          format.html {render "edit"}
        end
      elsif params[:irm_person] && @person.update_attributes(params[:irm_person])
        if params[:return_url]
          format.html {redirect_to(params[:return_url])}
          format.xml { head :ok}
        else
          format.html {render "index"}
        end
      else
        format.html {render "index"}
      end
    end
  end
end