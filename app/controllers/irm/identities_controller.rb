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
    @identity = Irm::Identity.find(params[:id])
  end

  def create
    @identity = Irm::Identity.new(params[:irm_identity])

    respond_to do |format|
      if @identity.save
        format.html { redirect_to({:action=>"index"}, :notice =>t(:successfully_created)) }
        format.xml  { render :xml => @identity, :status => :created, :location => @identity }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @identity.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @identity = Irm::Identity.find(params[:id])

    respond_to do |format|
      if @identity.update_attributes(params[:irm_identity])
        format.html { redirect_to({:action=>"index"}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @identity.errors, :status => :unprocessable_entity }
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

  def get_data
    identities_scope = Irm::Identity.list_all.status_meaning
    identities_scope = identities_scope.match_value("#{Irm::Identity.table_name}.login_name",params[:login_name])
    identities_scope = identities_scope.match_value("#{Irm::Identity.table_name}.full_name",params[:full_name])
    identities_scope = identities_scope.match_value("#{Irm::Identity.table_name}.email",params[:email])

    identities,count = paginate(identities_scope)
    respond_to do |format|
      format.json  {render :json => to_jsonp(identities.to_grid_json([:login_name,:full_name,:email,:language_description,:status_code,:status_meaning], count)) }
    end    
  end


  def show
     @identity = Irm::Identity.find(params[:id])
  end
 
end
