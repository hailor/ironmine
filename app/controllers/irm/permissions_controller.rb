class Irm::PermissionsController < ApplicationController
  def index
    @permission = Irm::Permission.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @permission }
    end
  end

  def show
    @permission = Irm::Permission.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @permission }
    end
  end

  def new
    @permission = Irm::Permission.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @permission }
    end
  end

  def edit
    @permission = Irm::Permission.multilingual.find(params[:id])
  end

  def create
    @permission = Irm::Permission.new(params[:irm_permission])
    @permission.company_id = Irm::Company.current.id
    respond_to do |format|
      if @permission.save
        flash[:successful_message] = (t :successfully_created)
        format.html { render "successful_info" }        
      else
         @error = @permission
         format.html { render "error_message" }
      end
    end
  end

  def update
    @permission = Irm::Permission.find(params[:id])

    respond_to do |format|
      if @permission.update_attributes(params[:irm_permission])
        flash[:successful_message] = (t :successfully_updated)
        format.html { render "successful_info" }
      else
        @error = @permission
        format.html { render "error_message" }
      end
    end
  end

  def destroy
    @permission = Irm::Permission.find(params[:id])
    @permission.destroy

    respond_to do |format|
      format.html { redirect_to(permissions_url) }
      format.xml  { head :ok }
    end
  end

  def multilingual_edit
    @permission = Irm::Permission.find(params[:id])
  end

  def multilingual_update
    @permission = Irm::Permission.find(params[:id])
    @permission.not_auto_mult=true
    respond_to do |format|
      if @permission.update_attributes(params[:irm_permission])
        format.html { redirect_to({:action=>"multilingual_edit",:format=>"js"}, :notice => t(:successfully_updated)) }
      else
        format.html { render({:action=>"multilingual_edit"}) }
      end
    end
  end

  def get_data
    @permissions = Irm::Permission.list_all
    respond_to do |format|
      format.json  {render :json => @permissions.to_dhtmlxgrid_json(['0',:product_module_name,:permission_code,
                                                                     :name,:page_controller,:page_action,
                                                                     :status_code,
                                                                    {:value => 'M', :controller => 'irm/permissions',:action =>  'multilingual_edit', :id => 'id', :action_type => 'multilingual',:view_port=>'data_area', :script => ''}
                                                                    ], @permissions.size) }
    end
  end
end
