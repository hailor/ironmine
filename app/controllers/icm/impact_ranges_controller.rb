class Icm::ImpactRangesController < ApplicationController
  def index
    @impact_range = Icm::ImpactRange.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @impact_range }
    end
  end

  def show
    @impact_range = Icm::ImpactRange.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @impact_range }
    end
  end

  def new
    @impact_range = Icm::ImpactRange.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @impact_range }
    end
  end

  def edit
    @impact_range = Icm::ImpactRange.multilingual.find(params[:id])
  end

  def create
    @impact_range = Icm::ImpactRange.new(params[:icm_impact_range])
    respond_to do |format|
      if @impact_range.save
        flash[:successful_message] = (t :successfully_created)
        format.html { render "successful_info" }
      else
         @error = @impact_range
         format.html { render "error_message" }
      end
    end
  end

  def update
    @impact_range = Icm::ImpactRange.find(params[:id])

    respond_to do |format|
      if @impact_range.update_attributes(params[:icm_impact_range])
        flash[:successful_message] = (t :successfully_updated)
        format.html { render "successful_info" }
      else
        @error = @impact_range
        format.html { render "error_message" }
      end
    end
  end

  def destroy
    @impact_range = Icm::ImpactRange.find(params[:id])
    @impact_range.destroy

    respond_to do |format|
      format.html { redirect_to(permissions_url) }
      format.xml  { head :ok }
    end
  end

  def multilingual_edit
    @impact_range = Icm::ImpactRange.find(params[:id])
  end

  def multilingual_update
    @impact_range = Icm::ImpactRange.find(params[:id])
    @impact_range.not_auto_mult=true
    respond_to do |format|
      if @impact_range.update_attributes(params[:icm_impact_range])
        format.html { redirect_to({:action=>"multilingual_edit",:format=>"js"}, :notice => t(:successfully_updated)) }
      else
        format.html { render({:action=>"multilingual_edit"}) }
      end
    end
  end

  def get_data
    @impact_ranges = Icm::ImpactRange.multilingual.list_all
    respond_to do |format|
      format.json  {render :json => @impact_ranges.to_dhtmlxgrid_json(['0',:company_name,:name,:impact_code,
                                                                     :weight_values,
                                                                    {:value => 'M', :controller => 'icm/impact_ranges',:action =>  'multilingual_edit', :id => 'id', :action_type => 'multilingual',:view_port=>'data_area', :script => ''}
                                                                    ], @impact_ranges.size) }
    end
  end  
end
