class Icm::CloseReasonsController < ApplicationController
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @close_reason = Icm::CloseReason.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @close_reason }
    end
  end

  def new
    @close_reason = Icm::CloseReason.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @close_reason }
    end
  end

  def edit
    @close_reason = Icm::CloseReason.multilingual.find(params[:id])
  end

  def create
    @close_reason = Icm::CloseReason.new(params[:icm_close_reason])
    
    respond_to do |format|
      if @close_reason.save
        format.html { redirect_to({:action=>"index"}, :notice =>t(:successfully_created)) }
        format.xml  { render :xml => @close_reason, :status => :created, :location => @close_reason }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @close_reason.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @close_reason = Icm::CloseReason.find(params[:id])

    respond_to do |format|
      if @close_reason.update_attributes(params[:icm_close_reason])
        format.html { redirect_to({:action=>"index"}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @close_reason.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @close_reason = Icm::CloseReason.find(params[:id])
    @close_reason.destroy

    respond_to do |format|
      format.html { redirect_to(permissions_url) }
      format.xml  { head :ok }
    end
  end
  
  def get_data
    close_reasons_scope = Icm::CloseReason.multilingual.list_all
    close_reasons,count = paginate(close_reasons_scope)
    
    respond_to do |format|
      format.json  {render :json => to_jsonp(close_reasons.to_grid_json([:company_name,:name,
                                                                     :close_code,:category_name], count)) }
    end
  end  
end
