class Irm::FlexValuesController < ApplicationController
  def index
    @value_set = Irm::FlexValueSet.find(params[:value_set_id]) if params[:value_set_id]
    respond_to do |format|
      format.html # index.html.erb
    end    
  end

  def edit
    @flex_value = Irm::FlexValue.multilingual.find(params[:id])
  end

  def update
    @flex_value = Irm::FlexValue.find(params[:id])
    respond_to do |format|
      if @flex_value.update_attributes(params[:irm_flex_value])
        format.html { redirect_to({:action=>"index", :value_set_id => @flex_value.flex_value_set_id}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @flex_value.errors, :status => :unprocessable_entity }
      end
    end
  end

  def new
    @value_set = Irm::FlexValueSet.find(params[:value_set_id]) if params[:value_set_id]
    @flex_value = Irm::FlexValue.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @flex_value }
    end
  end

  def create
    @flex_value = Irm::FlexValue.new(params[:irm_flex_value])
#    @flex_value.value_set_code = @value_set.value_set_code
    respond_to do |format|
      if @flex_value.save
        format.html { redirect_to({:action=>"index", :value_set_id => @flex_value.flex_value_set_id}, :notice =>t(:successfully_created)) }
        format.xml  { render :xml => @flex_value, :status => :created, :location => @flex_value }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @flex_value.errors, :status => :unprocessable_entity }
      end
    end
  end

  def get_data
    @value_set = Irm::FlexValueSet.find(params[:value_set_id])
    
    flex_values_scope = Irm::FlexValue.multilingual.where(:flex_value_set_id => params[:value_set_id])
    flex_values,count = paginate(flex_values_scope)
    respond_to do |format|
      format.json  {render :json => to_jsonp(flex_values.to_grid_json([:display_sequence,:flex_value,:flex_value_meaning,:description,:start_date_active,:end_date_active,], count)) }
    end    
  end

  def destroy
    @flex_value = Irm::FlexValue.find(params[:delete_list])

    respond_to do |format|
      if @flex_value.destroy
         flash[:successful_message] = (t :successfully_deleted)
         format.html { render "successful_info" }
      else
         @error = @flex_value
         format.html { render "error_message" }
      end
    end    
  end

  def show
    @flex_value = Irm::FlexValue.multilingual.find(params[:id])
  end

  def select_set
    redirect_to :action => "index", :value_set_id => params[:flex_value_set][:value_set_id]
  end
end