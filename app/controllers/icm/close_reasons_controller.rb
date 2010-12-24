class Icm::CloseReasonsController < ApplicationController
  def index
    @close_reason = Icm::CloseReason.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @close_reason }
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
        flash[:successful_message] = (t :successfully_created)
        format.html { render "successful_info" }
      else
         @error = @close_reason
         format.html { render "error_message" }
      end
    end
  end

  def update
    @close_reason = Icm::CloseReason.find(params[:id])

    respond_to do |format|
      if @close_reason.update_attributes(params[:icm_close_reason])
        flash[:successful_message] = (t :successfully_updated)
        format.html { render "successful_info" }
      else
        @error = @close_reason
        format.html { render "error_message" }
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

  def multilingual_edit
    @close_reason = Icm::CloseReason.find(params[:id])
  end

  def multilingual_update
    @close_reason = Icm::CloseReason.find(params[:id])
    @close_reason.not_auto_mult=true
    respond_to do |format|
      if @close_reason.update_attributes(params[:icm_close_reason])
        format.html { redirect_to({:action=>"multilingual_edit",:format=>"js"}, :notice => t(:successfully_updated)) }
      else
        format.html { render({:action=>"multilingual_edit"}) }
      end
    end
  end

  def get_data
    @close_reasons = Icm::CloseReason.multilingual.list_all
    respond_to do |format|
      format.json  {render :json => @close_reasons.to_dhtmlxgrid_json(['0',:company_name,:name,
                                                                     :close_code,:category_name,
                                                                    {:value => 'M', :controller => 'icm/close_reasons',:action =>  'multilingual_edit', :id => 'id', :action_type => 'multilingual',:view_port=>'data_area', :script => ''}
                                                                    ], @close_reasons.size) }
    end
  end   
end
