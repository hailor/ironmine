class Irm::IdentitiesController < ApplicationController
  def index
    @identity = Irm::Identity.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @identity }
    end
  end

  def show
    @identity = Irm::Identity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @identity }
    end
  end

  def new
    @identity = Irm::Identity.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @identity }
    end
  end

  def edit
    @identity = Irm::Identity.multilingual.find(params[:id])
  end

  def create
    @identity = Irm::Identity.new(params[:irm_identity])

    respond_to do |format|
      if @identity.save
        flash[:successful_message] = (t :successfully_created)
        format.html { render "successful_info" }
      else
         @error = @identity
         format.html { render "error_message" }
      end
    end
  end

  def update
    @identity = Irm::Identity.find(params[:id])

    respond_to do |format|
      if @identity.update_attributes(params[:irm_identity])
        flash[:successful_message] = (t :successfully_updated)
        format.html { render "successful_info" }
      else
        @error = @product_module
        format.html { render "error_message" }
      end
    end
  end

  def destroy
    @identity = Irm::Identity.find(params[:id])
    @identity.destroy

    respond_to do |format|
      format.html { redirect_to(permissions_url) }
      format.xml  { head :ok }
    end
  end

  def multilingual_edit
    @identity = Irm::Identity.find(params[:id])
  end

  def multilingual_update
    @identity = Irm::Identity.find(params[:id])
    @identity.not_auto_mult=true
    respond_to do |format|
      if @identity.update_attributes(params[:irm_identity])
        format.html { redirect_to({:action=>"multilingual_edit",:format=>"js"}, :notice => t(:successfully_updated)) }
      else
        format.html { render({:action=>"multilingual_edit"}) }
      end
    end
  end

  def get_data
    @identitys = Irm::Identity.list_all
    respond_to do |format|
      format.json  {render :json => @identitys.to_dhtmlxgrid_json(['0',:product_module_name,:permission_code,
                                                                     :name,:page_controller,:page_action,
                                                                     :status_code,
                                                                    {:value => 'M', :controller => 'irm/permissions',:action =>  'multilingual_edit', :id => 'id', :action_type => 'multilingual',:view_port=>'data_area', :script => ''}
                                                                    ], @identitys.size) }
    end
  end
end
