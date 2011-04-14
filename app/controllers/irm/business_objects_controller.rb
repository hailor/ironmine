class Irm::BusinessObjectsController < ApplicationController
  # GET /business_objects
  # GET /business_objects.xml
  def index


    respond_to do |format|
      format.html # index.html.erb
      format.xml  { @business_objects = BusinessObject.all
                    render :xml => @business_objects }
    end
  end

  # GET /business_objects/1
  # GET /business_objects/1.xml
  def show
    @business_object = Irm::BusinessObject.multilingual.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @business_object }
    end
  end

  def execute_test
    @business_object = Irm::BusinessObject.find(params[:id])
    @rows = 10
    @result_message = ""
    begin
      @result_message << "====================Generate model scope:====================\n"
      model_query = @business_object.generate_query(true)
      @result_message << model_query
      @result_message << "\n"
      @result_message << "====================Execute  query:====================\n"
      result_scope = eval(model_query)
      @result_message << "#{result_scope.to_sql}\n"
      @result_message << "==================Result  count======================\n"
      @result_message << "#{result_scope.length}\n"

    rescue =>text
      @rows = 20
      @result_message << "====================Error  message:====================\n"
      @result_message << text.message
      puts("=====Execute error=========")
    end
  end

  # GET /business_objects/new
  # GET /business_objects/new.xml
  def new
    @business_object = Irm::BusinessObject.new({:business_object_code=>"DEFAULT_BO_CODE",
                                                :bo_table_name =>"default_table_name",
                                                :bo_model_name=>"default_model_name",
                                                :auto_generate_flag=>Irm::Constant::SYS_YES,
                                                :multilingual_flag=>Irm::Constant::SYS_YES})

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @business_object }
    end
  end

  # GET /business_objects/1/edit
  def edit
    @business_object = Irm::BusinessObject.multilingual.find(params[:id])
  end

  # POST /business_objects
  # POST /business_objects.xml
  def create
    @business_object = Irm::BusinessObject.new(params[:irm_business_object])
    #origin = Irm::BusinessObject.find(params[:id])
    #origin.object_attributes.includes(:object_attributes_tls).each do |oa|
    #  new_oa = @business_object.object_attributes.build(oa.attributes.merge({:not_auto_mult=>true,:business_object_code=>@business_object.business_object_code,:created_at=>nil,:updated_at=>nil,:created_by=>nil,:updated_by=>nil}))
    #  oa.object_attributes_tls.each do |oatl|
    #    new_oa.object_attributes_tls.build(oatl.attributes.merge({:created_at=>nil,:updated_at=>nil,:created_by=>nil,:updated_by=>nil}))
    #  end
    #end
    respond_to do |format|
      if @business_object.valid?
        Irm::AutoInitBusinessObject.setup_by_model(@business_object.bo_model_name,{:name=>@business_object.name})
        format.html { redirect_to(:action=>"index", :notice => t(:successfully_created)) }
        format.xml  { render :xml => @business_object, :status => :created, :location => @business_object }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @business_object.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /business_objects/1
  # PUT /business_objects/1.xml
  def update
    @business_object = Irm::BusinessObject.find(params[:id])

    respond_to do |format|
      if @business_object.update_attributes(params[:irm_business_object])
        format.html { redirect_to(:action=>"index", :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @business_object.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /business_objects/1
  # DELETE /business_objects/1.xml
  def destroy
    @business_object = Irm::BusinessObject.find(params[:id])
    @business_object.destroy

    respond_to do |format|
      format.html { redirect_to(business_objects_url) }
      format.xml  { head :ok }
    end
  end

  def multilingual_edit
    @business_object = Irm::BusinessObject.find(params[:id])
  end

  def multilingual_update
    @business_object = Irm::BusinessObject.find(params[:id])
    @business_object.not_auto_mult=true
    respond_to do |format|
      if @business_object.update_attributes(params[:irm_business_object])
        format.html { redirect_to({:action=>"show"}, :notice => 'Business object was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @business_object.errors, :status => :unprocessable_entity }
      end
    end
  end

  def get_data
    business_objects_scope = Irm::BusinessObject.multilingual.order(:bo_table_name)
    business_objects_scope = business_objects_scope.match_value("#{Irm::BusinessObjectsTl.table_name}.name",params[:name])
    business_objects_scope = business_objects_scope.match_value("#{Irm::BusinessObject.table_name}.bo_table_name",params[:bo_table_name])
    business_objects_scope = business_objects_scope.match_value("#{Irm::BusinessObject.table_name}.bo_model_name",params[:bo_model_name])
    business_objects_scope = business_objects_scope.match_value("#{Irm::BusinessObject.table_name}.business_object_code",params[:business_object_code])
    business_objects,count = paginate(business_objects_scope)
    respond_to do |format|
      format.json {render :json=>to_jsonp(business_objects.to_grid_json([:business_object_code,:auto_generate_flag,:bo_table_name,:bo_model_name,:multilingual_flag,:name],count))}
    end
  end
end
