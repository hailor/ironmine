class Irm::ValueSetsController < ApplicationController
  def index
    @value_set = Irm::ValueSet.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @value_set }
    end
  end

  def edit
    @value_set = Irm::ValueSet.multilingual.find(params[:id])
  end

  def update
    @value_set = Irm::ValueSet.find(params[:id])

    respond_to do |format|
      if @value_set.update_attributes(params[:irm_value_set])
        flash[:successful_message] = (t :successfully_updated)
        format.html { render "successful_info" }
      else
        @error = @value_set
        format.html { render "error_message" }
      end
    end
  end

  def new
    @value_set = Irm::ValueSet.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @value_set }
    end
  end

  def create
    @value_set = Irm::ValueSet.new(params[:irm_value_set])
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
    @value_sets = Irm::ValueSet.multilingual
    respond_to do |format|
      format.json  {render :json => @value_sets.to_dhtmlxgrid_json(['0',
                                                               :value_set_code,
                                                               :name,
                                                               :description,
                                                               :status_code,
                                                               {:value => 'M', :controller => 'irm/value_sets',:action =>  'multilingual_edit', :id => 'id', :action_type => 'multilingual',:view_port=>'data_area', :script => ''}], @value_sets.size) }
    end    
  end


  def multilingual_edit
    @value_set = Irm::ValueSet.find(params[:id])
  end

  def multilingual_update
    @value_set = Irm::ValueSet.find(params[:id])
    @value_set.not_auto_mult=true
    respond_to do |format|
      if @value_set.update_attributes(params[:irm_value_set])
        format.html { redirect_to({:action=>"multilingual_edit",:format=>"js"}, :notice => t(:successfully_updated)) }
        format.js { redirect_to({:action=>"multilingual_edit",:format=>"js"}, :notice => t(:successfully_updated)) }
      else
        format.html { render({:action=>"multilingual_edit"}) }
        format.js   { render({:action=>"multilingual_edit"}) }
      end
    end
  end
end