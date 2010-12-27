class Irm::LookupTypesController < ApplicationController
  # GET /lookup_types
  # GET /lookup_types.xml
  def index
   @lookup_type = Irm::LookupType.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lookup_types }
    end
  end

  # GET /lookup_types/new
  # GET /lookup_types/new.xml
  def new
    @lookup_type = Irm::LookupType.new(:lookup_level=>'USER')

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @lookup_type }
    end
  end

  # GET /lookup_types/1/edit
  def edit
    @lookup_type = Irm::LookupType.multilingual.find(params[:id])
  end

  # POST /lookup_types
  # POST /lookup_types.xml
  def create
    @lookup_type = Irm::LookupType.new(params[:irm_lookup_type])

    respond_to do |format|
      if @lookup_type.save
        flash[:successful_message] = (t :successfully_created)
        @lookup_type = Irm::LookupType.multilingual.find(@lookup_type.id)
        format.html { render "return" }
        format.xml  { render :xml => @lookup_type, :status => :created, :location => @lookup_type }
      else
        @error=@lookup_type
        format.html { render "irm/common/error_message" }
        format.xml  { render :xml => @lookup_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /lookup_types/1
  # PUT /lookup_types/1.xml
  def update
    @lookup_type = Irm::LookupType.find(params[:irm_lookup_type][:id])

    respond_to do |format|
      if @lookup_type.update_attributes(params[:irm_lookup_type])
        flash[:successful_message] = (t :successfully_updated)
        format.html { render "irm/common/_successful_message"}
        format.xml  { head :ok }
      else
        @error=@lookup_type
        format.html { render "irm/common/error_message" }
        format.xml  { render :xml => @lookup_type.errors, :status => :unprocessable_entity }
      end
    end
  end


  def get_lookup_types
    @lookup_types = Irm::LookupType.multilingual
    count=@lookup_types.size
    respond_to do |format|
      format.json  {render :json => @lookup_types.to_dhtmlxgrid_json(['R',:lookup_level,:lookup_type,:meaning,:description,:status_code,'M'],
                                                                               count) }
    end
  end

  #TODO once for submit all
  def create_value
    lookup_type_id = params[:lookup_type_id]
    @lookup_type = Irm::LookupType.find(lookup_type_id)
    @lookup_code = params["c1"]
    @meaning = params["c2"]
    @description   = params["c3"]
    @start_date_active = params["c4"]
    @end_date_active   = params["c5"]

    @mode = params["!nativeeditor_status"]

    @id = params["gr_id"]
    case @mode
      when "inserted"
            @lookup_value = Irm::LookupValue.new({:lookup_type=>@lookup_type.lookup_type,
                                                  :lookup_code=>@lookup_code,
                                                  :meaning=>@meaning,
                                                  :description=>@description,
                                                  :start_date_active=>@start_date_active,
                                                  :end_date_active => @end_date_active})
            @lookup_value.save!

            @tid = @lookup_value.id
        when "deleted"
            @lookup_value=Irm::LookupValue.find(@id)
            @lookup_value.destroy

            @tid = @id
        when "updated"
            @lookup_value=Irm::LookupValue.find(@id)
            @lookup_value.lookup_code = @lookup_code
            @lookup_value.meaning=@meaning
            @lookup_value.description=@description
            @lookup_value.start_date_active = @start_date_active
            @lookup_value.end_date_active = @end_date_active
            @lookup_value.save!

            @tid = @id
    end
  end

  def get_lookup_values
    lookup_type=params[:lookup_type]
    lookup_values = Irm::LookupValue.query_by_lookup_type(lookup_type).multilingual
    respond_to do |format|
      format.json  {render :json => lookup_values.to_dhtmlxgrid_json(['R',:lookup_code,:meaning,:description,:start_date_active,:end_date_active,'M'],
                                                                               lookup_values.size) }
    end
  end


  def create_edit_value
    lookup_type_id = params[:lookup_type_id]
    @lookup_type = Irm::LookupType.find(lookup_type_id)
    @lookup_code = params["c1"]
    @meaning = params["c2"]
    @description   = params["c3"]
    @start_date_active = params["c4"]
    @end_date_active   = params["c5"]

    @mode = params["!nativeeditor_status"]

    @id = params["gr_id"]
    case @mode
      when "inserted"
            @lookup_value = Irm::LookupValue.new({:lookup_type=>@lookup_type.lookup_type,
                                                  :lookup_code=>@lookup_code,
                                                  :meaning=>@meaning,
                                                  :description=>@description,
                                                  :start_date_active=>@start_date_active,
                                                  :end_date_active => @end_date_active})
            @lookup_value.save!
            
            @tid = @lookup_value.id
      when "updated"
            exist_flag,lookup_value_id = Irm::LookupValue.check_lookup_code_exist(@lookup_type.lookup_type,@lookup_code)
            #no exists
            if exist_flag
              @lookup_value = Irm::LookupValue.new({:lookup_type=>@lookup_type.lookup_type,
                                                  :lookup_code=>@lookup_code,
                                                  :meaning=>@meaning,
                                                  :description=>@description,
                                                  :start_date_active=>@start_date_active,
                                                  :end_date_active => @end_date_active})

              @lookup_value.save!

              @tid = @lookup_value.id
            else
              @lookup_value=Irm::LookupValue.find(lookup_value_id)
              @lookup_value.lookup_code = @lookup_code
              @lookup_value.meaning=@meaning
              @lookup_value.description=@description
              @lookup_value.start_date_active = @start_date_active
              @lookup_value.end_date_active = @end_date_active
              @lookup_value.save!
            end

            @tid = @id
    end
  end

  def add_code
    @lookup_type = Irm::LookupType.multilingual.find(params[:id])
  end

  def check_lookup_code
    @flag=Irm::LookupValue.check_lookup_code(params[:lookup_type],params[:lookup_code])
    respond_to do |format|
      format.json  { render :json => @flag}
    end
  end

  def get_lookup_values
    lookup_type= params[:lookup_type]
    @lookup_types=Irm::LookupValue.multilingual.query_by_lookup_type(lookup_type)
    respond_to do |format|
      format.json { render :json => @lookup_types.collect{|d| [d.lookup_code,d[:meaning]]}}
    end
  end
end
