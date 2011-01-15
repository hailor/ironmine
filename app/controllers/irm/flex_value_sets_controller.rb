class Irm::FlexValueSetsController < ApplicationController
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def edit
    @value_set = Irm::FlexValueSet.find(params[:id])
  end

  def update
    @value_set = Irm::FlexValueSet.find(params[:id])

    respond_to do |format|
      if @value_set.update_attributes(params[:irm_value_set])
        format.html { redirect_to({:action=>"index"}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @value_set.errors, :status => :unprocessable_entity }
      end
    end
  end

  def new
    @value_set = Irm::FlexValueSet.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @value_set }
    end
  end

  def create
    @value_set = Irm::FlexValueSet.new(params[:irm_flex_value_set])
    respond_to do |format|
      if @value_set.save
        format.html { redirect_to({:action=>"index"}, :notice =>t(:successfully_created)) }
        format.xml  { render :xml => @value_set, :status => :created, :location => @value_set }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @value_set.errors, :status => :unprocessable_entity }
      end
    end
  end

  def get_data
    value_sets_scope = Irm::FlexValueSet.where("1=1")
    value_sets,count = paginate(value_sets_scope)
    respond_to do |format|
      format.json  {render :json => to_jsonp(value_sets.to_grid_json([:flex_value_set_name,:description,:status_code], count)) }
    end    
  end

  def show
    @value_set = Irm::FlexValueSet.find(params[:id])
  end
end