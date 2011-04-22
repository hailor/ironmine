class Irm::ListOfValuesController < ApplicationController
  # GET /list_of_values
  # GET /list_of_values.xml
  def index
    @list_of_values = Irm::ListOfValue.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @list_of_values }
    end
  end

  # GET /list_of_values/1
  # GET /list_of_values/1.xml
  def show
    @list_of_value = Irm::ListOfValue.with_bo(I18n.locale).multilingual.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @list_of_value }
    end
  end

  # GET /list_of_values/new
  # GET /list_of_values/new.xml
  def new
    @list_of_value = Irm::ListOfValue.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @list_of_value }
    end
  end

  # GET /list_of_values/1/edit
  def edit
    @list_of_value = Irm::ListOfValue.multilingual.find(params[:id])
  end

  # POST /list_of_values
  # POST /list_of_values.xml
  def create
    @list_of_value = Irm::ListOfValue.new(params[:irm_list_of_value])

    respond_to do |format|
      if @list_of_value.save
        format.html { redirect_to({:action => "index"}, :notice => t(:successfully_created)) }
        format.xml  { render :xml => @list_of_value, :status => :created, :location => @list_of_value }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @list_of_value.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /list_of_values/1
  # PUT /list_of_values/1.xml
  def update
    @list_of_value = Irm::ListOfValue.find(params[:id])

    respond_to do |format|
      if @list_of_value.update_attributes(params[:irm_list_of_value])
        format.html { redirect_to({:action => "index"}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @list_of_value.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /list_of_values/1
  # DELETE /list_of_values/1.xml
  def destroy
    @list_of_value = Irm::ListOfValue.find(params[:id])
    @list_of_value.destroy

    respond_to do |format|
      format.html { redirect_to(list_of_values_url) }
      format.xml  { head :ok }
    end
  end


  def execute_test
    @list_of_value = Irm::ListOfValue.find(params[:id])
    @rows = 10
    @result_message = ""
    @show_test_lov = true
    begin
      query_params = {}
      if @list_of_value.listable_flag.eql?(Irm::Constant::SYS_NO)&&!@list_of_value.query_clause.nil?&&!@list_of_value.query_clause.strip.blank?
        query_params = {:show_value=>"test"}
      end
      @result_message << "====================Generate model scope:====================\n"
      model_query = @list_of_value.generate_scope(query_params)
      @result_message << model_query
      @result_message << "\n"
      @result_message << "====================Execute  query:====================\n"
      result_scope = eval(model_query)
      @result_message << "#{result_scope.to_sql}\n"
      @result_message << "==================Result  count======================\n"
      @result_message << "#{result_scope.length}\n"

    rescue =>text
      @show_test_lov = false
      @rows = 20
      @result_message << "====================Error  message:====================\n"
      @result_message << text.message
      puts("=====Execute error=========")
    end
    render :layout=>nil
  end


  def get_lov_data
    list_of_value = Irm::ListOfValue.find(params[:id])
    query_params = {}
    list_of_value.lov_columns.each do |k|
      query_params[k] = params[k] if params[k]
    end
    values_scope =  eval(list_of_value.generate_scope(query_params))
    values,count = paginate(values_scope)
    columns = [:id_value,:show_value,:desc_value]
    unless list_of_value.addition_column.strip.blank?||list_of_value.addition_column.nil?
      list_of_value.addition_column.split("#").each do |ac|
        columns << ac.to_sym
      end
    end
    respond_to do |format|
      format.json {render :json=>to_jsonp(values.to_grid_json(columns,count))}
    end
  end

  def multilingual_edit
    @list_of_value = Irm::ListOfValue.find(params[:id])
  end

  def multilingual_update
    @list_of_value = Irm::ListOfValue.find(params[:id])
    @list_of_value.not_auto_mult=true
    respond_to do |format|
      if @list_of_value.update_attributes(params[:irm_list_of_value])
        format.html { redirect_to({:action => "show"}, :notice => 'List of value was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @list_of_value.errors, :status => :unprocessable_entity }
      end
    end
  end

  def get_data
    list_of_values_scope = Irm::ListOfValue.with_bo(I18n.locale).multilingual
    list_of_values_scope = list_of_values_scope.match_value("#{Irm::ListOfValuesTl.table_name}.name",params[:name])
    list_of_values_scope = list_of_values_scope.match_value("#{Irm::ListOfValue.table_name}.lov_code",params[:lov_code])
    list_of_values,count = paginate(list_of_values_scope)
    respond_to do |format|
      format.json {render :json=>to_jsonp(list_of_values.to_grid_json([:lov_code,:name,:bo_name,:id_column,:value_column,:desc_column,:value_title,:desc_column,:desc_title,:listable_flag],count))}
    end
  end
end
