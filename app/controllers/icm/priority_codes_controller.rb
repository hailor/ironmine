class Icm::PriorityCodesController < ApplicationController
  def index
    @priority_code = Icm::PriorityCode.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @priority_code }
    end
  end

  def show
    @priority_code = Icm::PriorityCode.multilingual.with_company.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @priority_code }
    end
  end

  def new
    @priority_code = Icm::PriorityCode.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @priority_code }
    end
  end

  def edit
    @priority_code = Icm::PriorityCode.multilingual.find(params[:id])
  end

  def create
    @priority_code = Icm::PriorityCode.new(params[:icm_priority_code])
    respond_to do |format|
      if @priority_code.save
        flash[:successful_message] = (t :successfully_created)
        format.html { render "index" }
      else
         format.html { render "new" }
      end
    end
  end

  def update
    @priority_code = Icm::PriorityCode.find(params[:id])

    respond_to do |format|
      if @priority_code.update_attributes(params[:icm_priority_code])
        flash[:successful_message] = (t :successfully_updated)
        format.html { render "index" }
      else
        format.html { render "edit" }
      end
    end
  end

  def destroy
    @priority_code = Icm::PriorityCode.find(params[:id])
    @priority_code.destroy

    respond_to do |format|
      format.html { redirect_to(permissions_url) }
      format.xml  { head :ok }
    end
  end

  def multilingual_edit
    @priority_code = Icm::PriorityCode.find(params[:id])
  end

  def multilingual_update
    @priority_code = Icm::PriorityCode.find(params[:id])
    @priority_code.not_auto_mult=true
    respond_to do |format|
      if @priority_code.update_attributes(params[:icm_priority_code])
        format.html { render({:action=>"show"}, :notice => t(:successfully_updated)) }
      else
        format.html { render({:action=>"multilingual_edit"}) }
      end
    end
  end

  def get_data
    priority_codes_scope = Icm::PriorityCode.multilingual.with_company.status_meaning
    priority_codes_scope = priority_codes_scope.match_value("#{Irm::Company.view_name}.name",params[:company_name])
    priority_codes_scope = priority_codes_scope.match_value("#{Icm::PriorityCode.table_name}.priority_code",params[:priority_code])
    priority_codes_scope = priority_codes_scope.match_value("#{Icm::PriorityCodesTl.table_name}.name",params[:name])
    priority_codes,count = paginate(priority_codes_scope)
    respond_to do |format|
      format.json  {render :json => to_jsonp(priority_codes.to_grid_json([:company_name,:priority_code,:name,
                                                                     :low_weight_value,:high_weight_value,:status_meaning], count)) }
    end
  end  
end
