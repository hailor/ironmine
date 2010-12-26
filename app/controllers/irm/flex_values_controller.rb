class Irm::FlexValuesController < ApplicationController
  def index
    @flex_value = Irm::FlexValue.new
    @value_set = Irm::FlexValueSet.find(params[:value_set_id])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @flex_value }
    end    
  end

  def edit
    @flex_value = Irm::FlexValue.multilingual.find(params[:id])
  end

  def update
    @flex_value = Irm::FlexValue.find(params[:id])
    respond_to do |format|
      if @flex_value.update_attributes(params[:irm_flex_value])
        flash[:successful_message] = (t :successfully_updated)
        format.html { render "successful_info" }
      else
        @error = @flex_value
        format.html { render "error_message" }
      end
    end
  end

  def new
    @flex_value = Irm::FlexValue.new
    @value_set = Irm::FlexValueSet.find(params[:value_set_id])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @flex_value }
    end
  end

  def create
    @flex_value = Irm::FlexValue.new(params[:irm_flex_value])
    @value_set = Irm::FlexValueSet.find(params[:value_set_id])
    @flex_value.value_set_code = @value_set.value_set_code
    respond_to do |format|
      if @flex_value.save
        flash[:successful_message] = (t :successfully_created)
        format.html { render "successful_info" }
      else
         @error = @flex_value
         format.html { render "error_message" }
      end
    end
  end

  def create_value
    value_set = Irm::FlexValueSet.find(params[:value_set_id])
    display_sequence = params["c1"]
    flex_value = params["c2"]
    name   = params["c3"]
    description = params["c4"]
    start_date_active = params["c5"]
    end_date_active = params["c6"]

    @mode = params["!nativeeditor_status"]

    @id = params["gr_id"]
    case @mode
      when "inserted"
        @flex_value = Irm::FlexValue.new({:flex_value_set_id => value_set.id, :display_sequence => display_sequence, :flex_value => flex_value,
                                          :flex_value_meaning => name, :description => description, :start_date_active => start_date_active, :end_date_active => end_date_active})
        @flex_value.save
        @id = @flex_value.id
        @tid = @flex_value.id
      when "updated"
        exist_flag = Irm::FlexValue.check_flex_value_exist(@id)
        #no exists
        if !exist_flag
          @flex_value = Irm::FlexValue.new({:flex_value_set_id => value_set.id, :display_sequence => display_sequence, :flex_value => flex_value,
                                          :flex_value_meaning => name, :description => description, :start_date_active => start_date_active, :end_date_active => end_date_active})
          @flex_value.save
          @id = @flex_value.id
          @tid = @flex_value.id
        else
          @flex_value=Irm::FlexValue.find(@id)
          @flex_value.update_attributes({:flex_value_set_id => value_set.id, :display_sequence => display_sequence, :flex_value => flex_value,
                                          :flex_value_meaning => name, :description => description, :start_date_active => start_date_active, :end_date_active => end_date_active})
          @id = @flex_value.id
          @tid = @flex_value.id
        end
    end    
  end

  def get_data
    @value_set = Irm::FlexValueSet.find(params[:value_set_id])
    @flex_values = Irm::FlexValue.multilingual.where(:flex_value_set_id => params[:value_set_id])
    respond_to do |format|
      format.json  {render :json => @flex_values.to_dhtmlxgrid_json(['0',
                                                               :display_sequence,
                                                               :flex_value,
                                                               :flex_value_meaning,
                                                               :description,
                                                               :start_date_active,
                                                               :end_date_active,
                                                               {:value => 'M', :controller => 'irm/flex_values',:action =>  'multilingual_edit', :id => 'id', :action_type => 'multilingual',:view_port=>'data_area', :script => ''}], @flex_values.size) }
    end        
  end

  def link_edit
    respond_to do |format|
      if params[:value_set_id]
        format.html{redirect_to(:controller => "irm/flex_values", :action => "index", :value_set_id => params[:value_set_id])}
      else
        format.html{render("error_message")}
      end
    end
  end

  def multilingual_edit
    @flex_value = Irm::FlexValue.find(params[:id])
  end

  def multilingual_update
    @flex_value = Irm::FlexValue.find(params[:id])
    @flex_value.not_auto_mult=true
    respond_to do |format|
      if @flex_value.update_attributes(params[:irm_flex_value])
        format.html { redirect_to({:action=>"multilingual_edit",:format=>"js"}, :notice => t(:successfully_updated)) }
        format.js { redirect_to({:action=>"multilingual_edit",:format=>"js"}, :notice => t(:successfully_updated)) }
      else
        format.html { render({:action=>"multilingual_edit"}) }
        format.js   { render({:action=>"multilingual_edit"}) }
      end
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
end