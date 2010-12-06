class Irm::CommonController < ApplicationController
  skip_before_filter :check_if_login_required

  def login
    
  end


  def multilingual_edit
    @product_module = Irm::ProductModule.first
  end

  def multilingual_update
    @product_module = Irm::ProductModule.first
    @product_module.not_auto_mult=true
    respond_to do |format|
      if @product_module.update_attributes(params[:irm_product_module])
        format.html { redirect_to({:action=>"multilingual_edit",:format=>"js"}, :notice => t(:successfully_updated)) }
        format.js { redirect_to({:action=>"multilingual_edit",:format=>"js"}, :notice => t(:successfully_updated)) }
      else
        format.html { render({:action=>"multilingual_edit"}) }
        format.js   { render({:action=>"multilingual_edit"}) }
      end
    end
  end


end
