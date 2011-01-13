class Irm::LookupValuesController < ApplicationController

  def index
    if !params[:lookup_type].blank?
      @lookup_type = Irm::LookupType.multilingual.query_wrap_info(I18n::locale).query_by_lookup_type(params[:lookup_type]).first
    else
      @lookup_type= Irm::LookupType.new
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mail_templates }
    end
  end

  def new
    @lookup_value = Irm::LookupValue.new
    @return_url=request.env['HTTP_REFERER']
    @_from=params[:_from]
    @lookup_type = params[:lookup_type]
    @current_lookup_type = Irm::LookupType.multilingual.query_by_lookup_type(@lookup_type).first
    if !@current_lookup_type.blank?
      @lookup_type_meaning = @current_lookup_type[:meaning]
    end
  end

  def show
    @lookup_value = Irm::LookupValue.multilingual.find(params[:id])
    @return_url=request.env['HTTP_REFERER']
    @_from=params[:_from]
    @lookup_type = params[:lookup_type]
    @current_lookup_type = Irm::LookupType.multilingual.query_by_lookup_type(@lookup_type).first
    if !@current_lookup_type.blank?
      @lookup_type_meaning = @current_lookup_type[:meaning]
    end
  end

  def edit
    @lookup_value = Irm::LookupValue.multilingual.find(params[:id])
    @return_url=request.env['HTTP_REFERER']
    @_from=params[:_from]
    @lookup_type = params[:lookup_type]
    @current_lookup_type = Irm::LookupType.multilingual.query_by_lookup_type(@lookup_type).first
    if !@current_lookup_type.blank?
      @lookup_type_meaning = @current_lookup_type[:meaning]
    end
  end


  def create
    @lookup_value = Irm::LookupValue.new(params[:irm_lookup_value])

    respond_to do |format|
      if @lookup_value.save
        format.html {
        if(params[:_from]=="lookup_type")
           redirect_to params[:return_url]
        else
          redirect_to({:action=>"index",:lookup_type=>@lookup_value.lookup_type},
                                      :notice => (t :successfully_created))
        end
        }
        format.xml  { render :xml => @lookup_value, :status => :created, :location => @lookup_value }
      else
        format.html { render "new" }
        format.xml  { render :xml => @lookup_value.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @lookup_value = Irm::LookupValue.find(params[:id])

    respond_to do |format|
      if @lookup_value.update_attributes(params[:irm_lookup_value])
        format.html {
        if(params[:_from]=="lookup_type")
           redirect_to params[:return_url]
        else
          redirect_to({:action=>"index",:lookup_type=>@lookup_value.lookup_type},
                                      :notice => (t :successfully_created))
        end
        }
        format.xml  { head :ok }
      else
        format.html { render "edit" }
        format.xml  { render :xml => @lookup_value.errors, :status => :unprocessable_entity }
      end
    end
  end

  def get_lookup_values
    lookup_type=params[:lookup_type]
    @lookup_values = Irm::LookupValue.query_by_lookup_type(lookup_type).query_wrap_info(I18n.locale).multilingual
    @lookup_values,count = paginate(@lookup_values)
    respond_to do |format|
      format.json  {render :json =>to_jsonp(@lookup_values.to_grid_json(['R',:lookup_code,:lookup_type,:meaning,:description,:start_date_active,:end_date_active,:status_meaning],
                                                                               count)) }
    end
  end

  def select_lookup_type
    if !params[:lookup_type].blank?
      @lookup_type = Irm::LookupType.multilingual.query_wrap_info(I18n::locale).
                          query_by_lookup_type(params[:lookup_type]).first
    else
      @lookup_type= Irm::LookupType.new
    end
    render :action => "index"
  end

end
