class Irm::MenuEntriesController < ApplicationController
  def index
    @menu = Irm::Menu.where(:menu_code => params[:menu_code]).first if params[:menu_code]
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def edit
    @menu_entry = Irm::MenuEntry.multilingual.find(params[:id])
    @menu = Irm::Menu.multilingual.where(:menu_code => @menu_entry.menu_code).first
  end

  def update
    @menu_entry = Irm::MenuEntry.find(params[:id])
    respond_to do |format|
      if @menu_entry.update_attributes(params[:irm_menu_entry])
        format.html { redirect_to({:action=>"index", :menu_code => @menu_entry.menu_code}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @menu_entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  def new
    @menu_entry = Irm::MenuEntry.new
    @menu = Irm::Menu.multilingual.where(:menu_code => params[:menu_code]).first
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @menu_entry }
    end
  end

  def create
    @menu_entry = Irm::MenuEntry.new(params[:irm_menu_entry])
    respond_to do |format|
      if @menu_entry.save
        format.html { redirect_to({:action=>"index", :menu_code => @menu_entry.menu_code}, :notice =>t(:successfully_created)) }
        format.xml  { render :xml => @menu_entry, :status => :created, :location => @menu_entry }
      else
        @menu = Irm::Menu.where(:menu_code => @menu_entry.menu_code).first
        format.html { render :action => "new"}
        format.xml  { render :xml => @menu_entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  def get_data
    menu_entries_scope = Irm::MenuEntry.multilingual.where(:menu_code => params[:menu_code])
    menu_entries,count = paginate(menu_entries_scope)
    respond_to do |format|
      format.json  {render :json => to_jsonp(menu_entries.to_grid_json([:display_sequence,:name,:description,:sub_menu_code,:permission_code, :icon, :css_name, :display_flag,:status_code], count)) }
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

  def select_parent
    redirect_to :action => "index", :menu_code => params[:menu][:menu_code]
  end

  def show
    @menu_entry = Irm::MenuEntry.multilingual.where(:id => params[:id]).first
    @menu = Irm::Menu.multilingual.where(:menu_code => @menu_entry.menu_code).first
  end  
end