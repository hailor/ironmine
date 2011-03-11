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
        format.html { redirect_to({:action=>"index"}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @menu.errors, :status => :unprocessable_entity }
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
        format.html { redirect_to({:action=>"index"}, :notice =>t(:successfully_created)) }
        format.xml  { render :xml => @menu, :status => :created, :location => @menu }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @menu.errors, :status => :unprocessable_entity }
      end
    end
  end

  def get_data
    menus_scope = Irm::Menu.multilingual
    menus_scope = menus_scope.match_value("#{Irm::Menu.table_name}.menu_code",params[:menu_code])
    menus_scope = menus_scope.match_value("#{Irm::MenusTl.table_name}.name",params[:name])    
    menus,count = paginate(menus_scope)
    respond_to do |format|
      format.json  {render :json => to_jsonp(menus.to_grid_json([:menu_code,:name,:description,:status_code], count)) }
    end        
  end

  def show
    @menu = Irm::Menu.multilingual.find(params[:id])
  end

  def remove_entry
    return_url = params[:return_url]
    menu_entry = Irm::MenuEntry.where(:id => params[:entry_id]).first
    menu_entry.destroy
    if return_url.blank?
      redirect_to({:action=>"show", :id=> params[:id]})
    else
      redirect_to(return_url)
    end
  end

  def multilingual_edit
    @menu = Irm::Menu.find(params[:id])
  end

  def multilingual_update
    @menu = Irm::Menu.find(params[:id])
    @menu.not_auto_mult = true
    respond_to do |format|
      if @menu.update_attributes(params[:irm_menu])
        format.html { redirect_to({:action=>"show"}, :notice => 'Menu was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "multilingual_edit" }
        format.xml  { render :xml => @menu.errors, :status => :unprocessable_entity }
      end
    end
  end    
end