class Irm::FlexValueSetsController < ApplicationController
  def index
    @value_set = Irm::FlexValueSet.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @value_set }
    end
  end

  def edit
    @value_set = Irm::FlexValueSet.find(params[:id])
  end

  def update
    @value_set = Irm::FlexValueSet.find(params[:id])

    respond_to do |format|
      if @value_set.update_attributes(params[:irm_flex_value_set])
        flash[:successful_message] = (t :successfully_updated)
        format.html { render "successful_info" }
      else
        @error = @value_set
        format.html { render "error_message" }
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
        flash[:successful_message] = (t :successfully_updated)
        format.html { render "successful_info" }
      else
         @error = @value_set
         format.html { render "error_message" }
      end
    end
  end

  def get_data
    @value_sets = Irm::FlexValueSet.all
    respond_to do |format|
      format.json  {render :json => @value_sets.to_dhtmlxgrid_json(['0',
                                                               :flex_value_set_name,
                                                               :description,
                                                               :status_code], @value_sets.size) }
    end    
  end
end