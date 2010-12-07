class Irm::MenusController < ApplicationController
  def index
    @menu = Irm::Menu.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @menu }
    end
  end

  def edit
    @menu = Irm::Menu.multilingual.find(params[:id])
  end

  def update
    @menu = Irm::Menu.find(params[:id])

    respond_to do |format|
      if @menu.update_attributes(params[:irm_menu])
        flash[:successful_message] = (t :successfully_updated)
        format.html { render "successful_info" }
      else
        @error = @menu
        format.html { render "error_message" }
      end
    end
  end

  def new
    @menu = Irm::Menu.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @menu }
    end
  end

  def create
    @menu = Irm::Menu.new(params[:irm_menu])

    respond_to do |format|
      if @menu.save
        flash[:successful_message] = (t :successfully_updated)
        format.html { render "successful_info" }
      else
         @error = @menu
         format.html { render "error_message" }
      end
    end
  end

  def get_data
    @menus = Irm::Menu.multilingual
    respond_to do |format|
      format.json  {render :json => @menus.to_dhtmlxgrid_json(['0',
                                                               :menu_code,
                                                               :name,
                                                               :description,
                                                               :status_code,
                                                               {:value => 'M', :controller => 'irm/menus',:action =>  'multilingual_edit', :id => 'id', :action_type => 'multilingual',:view_port=>'data_area', :script => ''}], @menus.size) }
    end    
  end


  def multilingual_edit
    @menu = Irm::Menu.find(params[:id])
  end

  def multilingual_update
    @menu = Irm::MenuModule.find(params[:id])
    @menu.not_auto_mult=true
    respond_to do |format|
      if @menu.update_attributes(params[:irm_menu])
        format.html { redirect_to({:action=>"multilingual_edit",:format=>"js"}, :notice => t(:successfully_updated)) }
        format.js { redirect_to({:action=>"multilingual_edit",:format=>"js"}, :notice => t(:successfully_updated)) }
      else
        format.html { render({:action=>"multilingual_edit"}) }
        format.js   { render({:action=>"multilingual_edit"}) }
      end
    end
  end
end