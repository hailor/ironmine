class Irm::MenuEntriesController < ApplicationController
  def index
    @menu_entry = Irm::MenuEntry.new
    @menu = Irm::Menu.find(params[:menu_id])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @menu_entry }
    end    
  end

  def edit
    @menu_entry = Irm::MenuEntry.multilingual.find(params[:id])
  end

  def update
    @menu_entry = Irm::MenuEntry.find(params[:id])
    respond_to do |format|
      if @menu_entry.update_attributes(params[:irm_menu_entry])
        flash[:successful_message] = (t :successfully_updated)
        format.html { render "successful_info" }
      else
        @error = @menu_entry
        format.html { render "error_message" }
      end
    end
  end

  def new
    @menu_entry = Irm::MenuEntry.new
    @menu = Irm::Menu.find(params[:menu_id])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @menu_entry }
    end
  end

  def create
    @menu_entry = Irm::MenuEntry.new(params[:irm_menu_entry])
    @menu = Irm::Menu.find(params[:menu_id])
    @menu_entry.menu_code = @menu.menu_code
    respond_to do |format|
      if @menu_entry.save
        flash[:successful_message] = (t :successfully_created)
        format.html { render "successful_info" }
      else
         @error = @menu_entry
         format.html { render "error_message" }
      end
    end
  end

  def get_data
    @menu = Irm::Menu.find(params[:menu_id])
    @menu_entries = Irm::MenuEntry.multilingual.where(:menu_code => @menu.menu_code)
    respond_to do |format|
      format.json  {render :json => @menu_entries.to_dhtmlxgrid_json(['0',
                                                               :display_sequence,
                                                               :name,
                                                               :description,
                                                               :sub_menu_code,
                                                               :permission_code,
                                                               :display_flag,
                                                               :status_code,
                                                               {:value => 'M', :controller => 'irm/menu_entries',:action =>  'multilingual_edit', :id => 'id', :action_type => 'multilingual',:view_port=>'data_area', :script => ''}], @menu_entries.size) }
    end        
  end

  def link_edit
    respond_to do |format|
      if params[:menu_id]
        format.html{redirect_to(:controller => "irm/menu_entries", :action => "index", :menu_id => params[:menu_id])}
      else
        format.html{render("error_message")}
      end
    end
  end

  def multilingual_edit
    @menu_entry = Irm::MenuEntry.find(params[:id])
  end

  def multilingual_update
    @menu_entry = Irm::MenuEntry.find(params[:id])
    @menu_entry.not_auto_mult=true
    respond_to do |format|
      if @menu_entry.update_attributes(params[:irm_menu_entry])
        format.html { redirect_to({:action=>"multilingual_edit",:format=>"js"}, :notice => t(:successfully_updated)) }
        format.js { redirect_to({:action=>"multilingual_edit",:format=>"js"}, :notice => t(:successfully_updated)) }
      else
        format.html { render({:action=>"multilingual_edit"}) }
        format.js   { render({:action=>"multilingual_edit"}) }
      end
    end
  end

  def destroy
    @menu_entry = Irm::MenuEntry.find(params[:delete_list])

    respond_to do |format|
      if @menu_entry.destroy
         flash[:successful_message] = (t :successfully_deleted)
         format.html { render "successful_info" }
      else
         @error = @menu_entry
         format.html { render "error_message" }
      end
    end    
  end
end