class Icm::ImpactRangesController < ApplicationController
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @impact_range = Icm::ImpactRange.multilingual.with_company.find(params[:id])

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
        format.html { redirect_to({:action=>"index"}, :notice =>t(:successfully_created)) }
        format.xml  { render :xml => @impact_range, :status => :created, :location => @impact_range }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @impact_range.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @impact_range = Icm::ImpactRange.find(params[:id])

    respond_to do |format|
      if @impact_range.update_attributes(params[:icm_impact_range])
        format.html { redirect_to({:action=>"index"}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @impact_range.errors, :status => :unprocessable_entity }
      end
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
        format.html { render({:action=>"show"}, :notice => t(:successfully_updated)) }
      else
        format.html { render({:action=>"multilingual_edit"}) }
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
  
  def get_data
    impact_ranges_scope = Icm::ImpactRange.multilingual.with_company.status_meaning
    impact_ranges_scope = impact_ranges_scope.match_value("#{Irm::Company.view_name}.name",params[:company_name])
    impact_ranges_scope = impact_ranges_scope.match_value("#{Icm::ImpactRange.table_name}.impact_code",params[:impact_code])
    impact_ranges_scope = impact_ranges_scope.match_value("#{Icm::ImpactRangesTl.table_name}.name",params[:name])
    impact_ranges_scope = impact_ranges_scope.match_value("#{Icm::ImpactRange.table_name}.default_flag",params[:default_flag])            
    impact_ranges,count = paginate(impact_ranges_scope)

    respond_to do |format|
      format.json  {render :json => to_jsonp(impact_ranges.to_grid_json([:company_name,
                                                                         :name,:impact_code,
                                                                         :weight_values,:status_meaning,
                                                                         :default_flag,:display_sequence], count)) }
    end
  end    
end
