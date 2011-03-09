class Csi::SurveyRangesController < ApplicationController
  # GET /survey_ranges
  # GET /survey_ranges.xml
  def index
    @return_url= request.env['HTTP_REFERER']
  end

  # GET /survey_ranges/1
  # GET /survey_ranges/1.xml
  def show
    @survey_range = Csi::SurveyRange.query_status_meaning(I18n::locale).query_range_meaning(I18n::locale).
                  query_all_info.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @survey_range }
    end
  end

  # GET /survey_ranges/new
  # GET /survey_ranges/new.xml
  def new
    @survey_range = Csi::SurveyRange.new
    @survey_id = params[:survey_id]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @survey_range }
    end
  end

  # GET /survey_ranges/1/edit
  def edit
    @survey_range = Csi::SurveyRange.find(params[:id])
  end

  # POST /survey_ranges
  # POST /survey_ranges.xml
  def create
    attributes=delete_unnecessary_attribute(params[:csi_survey_range])
    @survey_range = Csi::SurveyRange.new(attributes)    

    respond_to do |format|
      if @survey_range.save
        format.html { redirect_to({:action=>"index"}, :notice => t(:successfully_created)) }
        format.xml  { render :xml => @survey_range, :status => :created, :location => @survey_range }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @survey_range.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /survey_ranges/1
  # PUT /survey_ranges/1.xml
  def update
    @survey_range = Csi::SurveyRange.find(params[:id])
    attributes=delete_unnecessary_attribute(params[:csi_survey_range])

    respond_to do |format|
      if @survey_range.update_attributes(attributes)
        format.html { redirect_to({:action=>"index"}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @survey_range.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /survey_ranges/1
  # DELETE /survey_ranges/1.xml
  def destroy
    @survey_range = Csi::SurveyRange.find(params[:id])
    @survey_range.destroy

    respond_to do |format|
      format.html { redirect_to({:action=>"index"}) }
      format.xml  { head :ok }
    end
  end

  def multilingual_edit
    @survey_range = Csi::SurveyRange.find(params[:id])
  end

  def multilingual_update
    @survey_range = Csi::SurveyRange.find(params[:id])
    @survey_range.not_auto_mult=true
    respond_to do |format|
      if @survey_range.update_attributes(params[:survey_range])
        format.html { redirect_to(@survey_range, :notice => 'Survey range was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @survey_range.errors, :status => :unprocessable_entity }
      end
    end
  end

  def get_data
    survey_ranges_scope = Csi::SurveyRange.query_wrap_info(::I18n.locale).match_value("survey_range.name",params[:name])
    survey_ranges,count = paginate(survey_ranges_scope)
    respond_to do |format|
      format.json {render :json=>to_jsonp(survey_ranges.to_grid_json([:range_code,:required_flag,:range_type,:range_type_meaning,:status_meaning],count))}
    end
  end

  private
    def delete_unnecessary_attribute(params)
       if params.is_a?(Hash)
          if params[:range_type] == "ORGANIZATION"
            params.merge!({:role_id=>""})
            params.merge!({:site_id=>""})
          elsif params[:range_type] == "ROLE"
            params.merge!({:range_company_id=>""})
            params.merge!({:range_organization_id=>""})
            params.merge!({:range_department_id=>""})
          elsif params[:range_type] == "SITE"
            params.merge!({:range_company_id=>""})
            params.merge!({:range_organization_id=>""})
            params.merge!({:range_department_id=>""})
            params.merge!({:role_id=>""})
          end
       end
      params
    end
end
