class Irm::ObjectAttributesController < ApplicationController
  before_filter :setup_business_object
  # GET /object_attributes
  # GET /object_attributes.xml
  def index
    @object_attributes = Irm::ObjectAttribute.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @object_attributes }
    end
  end

  # GET /object_attributes/1
  # GET /object_attributes/1.xml
  def show
    @object_attribute = Irm::ObjectAttribute.with_lov(I18n.locale).with_attribute_type(I18n.locale).with_relation_bo(I18n.locale).multilingual.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @object_attribute }
    end
  end

  # GET /object_attributes/new
  # GET /object_attributes/new.xml
  def new
    session[:irm_object_attribute]={} unless params[:irm_object_attribute]
    session[:irm_object_attribute]||={}
    session[:irm_object_attribute][:step] = params[:step]
    session[:irm_object_attribute].merge!(params[:irm_object_attribute]) if params[:irm_object_attribute]
    session[:irm_object_attribute][:step]||=1
    @object_attribute = Irm::ObjectAttribute.new(session[:irm_object_attribute])
    respond_to do |format|
      format.html
      format.xml  { render :xml => @object_attribute }
    end
  end

  # GET /object_attributes/1/edit
  def edit
    @object_attribute = Irm::ObjectAttribute.multilingual.find(params[:id])
  end

  # POST /object_attributes
  # POST /object_attributes.xml
  def create
    session[:irm_object_attribute].merge!(params[:irm_object_attribute]) if params[:irm_object_attribute]
    @object_attribute = Irm::ObjectAttribute.new(session[:irm_object_attribute].merge(:business_object_code=>@business_object.business_object_code))

    respond_to do |format|
      if @object_attribute.save
        format.html { redirect_to({:controller=>"irm/business_objects",:action=>"show",:id=>@business_object.id}, {:notice => t(:successfully_created)} ) }
        format.xml  { render :xml => @object_attribute, :status => :created, :location => @object_attribute }
      else
        format.html { render :action => "new",:step=>2 }
        format.xml  { render :xml => @object_attribute.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /object_attributes/1
  # PUT /object_attributes/1.xml
  def update
    @object_attribute = Irm::ObjectAttribute.find(params[:id])

    respond_to do |format|
      if @object_attribute.update_attributes(params[:irm_object_attribute])
        format.html { redirect_to({:controller=>"irm/business_objects",:action=>"show",:id=>@business_object.id}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @object_attribute.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /object_attributes/1
  # DELETE /object_attributes/1.xml
  def destroy
    @object_attribute = Irm::ObjectAttribute.find(params[:id])
    @object_attribute.destroy

    respond_to do |format|
      format.html { redirect_to(:controller=>"irm/business_objects",:action=>"show",:id=>@business_object.id) }
      format.xml  { head :ok }
    end
  end

  def multilingual_edit
    @object_attribute = Irm::ObjectAttribute.find(params[:id])
  end

  def multilingual_update
    @object_attribute = Irm::ObjectAttribute.find(params[:id])
    @object_attribute.not_auto_mult=true
    respond_to do |format|
      if @object_attribute.update_attributes(params[:irm_object_attribute])
        format.html { redirect_to({:controller=>"irm/business_objects",:action=>"show",:id=>@business_object.id}, :notice => 'Object attribute was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @object_attribute.errors, :status => :unprocessable_entity }
      end
    end
  end

  def get_data
    object_attributes_scope = Irm::ObjectAttribute.with_attribute_type(I18n.locale).with_relation_bo(I18n.locale).multilingual.query_by_business_object_code(@business_object.business_object_code).order(:attribute_name)
    object_attributes_scope = object_attributes_scope.match_value("#{Irm::ObjectAttributesTl.table_name}.name",params[:name])
    object_attributes_scope = object_attributes_scope.match_value("#{Irm::ObjectAttribute.table_name}.attribute_name",params[:attribute_name])
    object_attributes,count = paginate(object_attributes_scope)
    respond_to do |format|
      format.json {render :json=>to_jsonp(object_attributes.to_grid_json([:name,
                                                                          :approval_page_field_flag,:filter_flag,
                                                                          :attribute_name,
                                                                          :attribute_type_name,
                                                                          :relation_bo_name,
                                                                          :relation_column,
                                                                          :data_length,:data_type,
                                                                          :relation_table_alias_name],count))}
    end
  end

  def relation_columns
    object_attributes_scope = Irm::ObjectAttribute.multilingual.table_column.query_by_business_object_code(params[:business_object_code]).order(:attribute_name)
    object_attributes_scope = object_attributes_scope.match_value("#{Irm::ObjectAttribute.view_name}.name",params[:name])

    object_attributes = object_attributes_scope.collect{|i| {:label=>i.attribute_name, :value=>i.attribute_name,:id=>i.id}}
    respond_to do |format|
      format.json {render :json=>object_attributes.to_grid_json([:label,:value], object_attributes.count)}
    end
  end

  def selectable_columns
    object_attributes_scope = Irm::ObjectAttribute.multilingual.selectable_column.query_by_business_object_code(params[:business_object_code]).order(:attribute_name)
    object_attributes_scope = object_attributes_scope.match_value("#{Irm::ObjectAttribute.view_name}.name",params[:name])

    object_attributes = object_attributes_scope.collect{|i| {:label=>i.attribute_name, :value=>i.attribute_name,:id=>i.id}}
    respond_to do |format|
      format.json {render :json=>object_attributes.to_grid_json([:label,:value], object_attributes.count)}
    end
  end

  def all_columns
    object_attributes_scope = Irm::ObjectAttribute.multilingual.query_by_business_object_code(params[:business_object_code]).order(:attribute_name)
    object_attributes_scope = object_attributes_scope.match_value("#{Irm::ObjectAttribute.view_name}.name",params[:name])

    object_attributes = object_attributes_scope.collect{|i| {:label=>i[:name],:business_object_code=>i.business_object_code, :value=>i.attribute_name,:id=>i.id}}
    respond_to do |format|
      format.json {render :json=>object_attributes.to_grid_json([:label,:value,:business_object_code], object_attributes.count)}
    end
  end

  def updateable_columns
    object_attributes_scope = Irm::ObjectAttribute.multilingual.updateable_column.query_by_business_object_code(params[:business_object_code]).order(:attribute_name)
    object_attributes_scope = object_attributes_scope.match_value("#{Irm::ObjectAttribute.view_name}.name",params[:name])

    object_attributes = object_attributes_scope.collect{|i| {:label=>i.attribute_name, :value=>i.attribute_name,:id=>i.id}}
    respond_to do |format|
      format.json {render :json=>object_attributes.to_grid_json([:label,:value], object_attributes.count)}
    end
  end

  def person_columns
    object_attributes_scope = Irm::ObjectAttribute.multilingual.person_column.query_by_business_object_code(params[:business_object_code]).order(:attribute_name)
    object_attributes_scope = object_attributes_scope.match_value("#{Irm::ObjectAttribute.view_name}.name",params[:name])

    object_attributes = object_attributes_scope.collect{|i| {:label=>i.attribute_name, :value=>i.attribute_name,:id=>i.id}}
    respond_to do |format|
      format.json {render :json=>object_attributes.to_grid_json([:label,:value], object_attributes.count)}
    end
  end

  private
  def setup_business_object
    @business_object = Irm::BusinessObject.find(params[:bo_id]) if params[:bo_id]
    @business_object||= Irm::BusinessObject.first
  end
end
