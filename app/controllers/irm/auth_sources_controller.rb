class Irm::AuthSourcesController < ApplicationController
  def index
    @auth_source = Irm::AuthSource.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @auth_source }
    end
  end

  def show
    @auth_source = Irm::AuthSource.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @auth_source }
    end
  end

  def new
    @auth_source = Irm::AuthSource.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @auth_source }
    end
  end

  def edit
    @auth_source = Irm::AuthSource.find(params[:id])
  end

  def create
    @auth_source = Irm::AuthSource.new(params[:irm_auth_source])
    @auth_source.company_id = Irm::Company.current.id
    @auth_source.type = "LDAP"
    respond_to do |format|
      if @auth_source.save
        flash[:successful_message] = (t :successfully_created)
        format.html { render "successful_info" }
      else
         @error = @auth_source
         format.html { render "error_message" }
      end
    end
  end

  def update
    @auth_source = Irm::AuthSource.find(params[:id])

    respond_to do |format|
      if @auth_source.update_attributes(params[:irm_auth_source])
        flash[:successful_message] = (t :successfully_updated)
        format.html { render "successful_info" }
      else
        @error = @auth_source
        format.html { render "error_message" }
      end
    end
  end

  def destroy
    @auth_source = Irm::AuthSource.find(params[:id])
    @auth_source.destroy

    respond_to do |format|
      format.html { redirect_to(auth_source_url) }
      format.xml  { head :ok }
    end
  end

  def multilingual_edit
    @auth_source = Irm::AuthSource.find(params[:id])
  end

  def multilingual_update
    @auth_source = Irm::AuthSource.find(params[:id])
    @auth_source.not_auto_mult=true
    respond_to do |format|
      if @auth_source.update_attributes(params[:irm_auth_source])
        format.html { redirect_to({:action=>"multilingual_edit",:format=>"js"}, :notice => t(:successfully_updated)) }
      else
        format.html { render({:action=>"multilingual_edit"}) }
      end
    end
  end

  def get_data
    @auth_sources = Irm::AuthSource.all
    respond_to do |format|
      format.json  {render :json => @auth_sources.to_dhtmlxgrid_json(['0',:name, :host, :port, :account, :base_dn,:attr_login,:status_code,], @auth_sources.size) }
    end
  end
end
