class Csi::SurveysController < ApplicationController
  #layout "setting" 
  # GET /surveys
  # GET /surveys.xml
  def index
    @surveys = Csi::Survey.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @surveys }
    end
  end

  # GET /surveys/1
  # GET /surveys/1.xml
  def show
    @survey = Csi::Survey.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @survey }
    end
  end

  # GET /surveys/new
  # GET /surveys/new.xml
  def new
    @survey =Csi:: Survey.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @survey }
    end
  end

  # GET /surveys/1/edit
  def edit
    @survey = Csi::Survey.find(params[:id])
  end

  # POST /surveys
  # POST /surveys.xml
  def create
    @survey = Csi::Survey.new(params[:csi_survey])

    respond_to do |format|
      if @survey.save
        format.html { redirect_to({:action=>"index"}, :notice => t(:successfully_created)) }
        format.xml  { render :xml => @survey, :status => :created, :location => @survey }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @survey.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /surveys/1
  # PUT /surveys/1.xml
  def update
    @survey = Csi::Survey.find(params[:id])

    respond_to do |format|
      if @survey.update_attributes(params[:csi_survey])
        format.html { redirect_to(@survey, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @survey.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.xml
  def destroy
    @survey = Csi::Survey.find(params[:id])
    @survey.destroy

    respond_to do |format|
      format.html { redirect_to(surveys_url) }
      format.xml  { head :ok }
    end
  end

  def get_data
    @surveys= Csi::Survey.query_common
    @surveys,count = paginate(@surveys)
    respond_to do |format|
      format.json {render :json=>to_jsonp(@surveys.to_grid_json(['R',:title,:description,:status_meaning], count))}
    end
  end 

  def password
    @survey = Csi::Survey.find(params[:id]) rescue nil

    respond_to do |format|
      if @survey
        session[@survey.id] = params[:password] if params[:password]
        format.html {redirect_to({:action=>"reply"})}
      else
        flash[:notice] = t(:label_csi_survey_no_form)
        format.html { redirect_to({:action=>"index"})}
      end
    end
  end

  def reply
    @survey = Csi::Survey.find(params[:id]) rescue nil

    respond_to do |format|
      if @survey && !@survey.password.blank? &&
          session[@survey.id] != @survey.password
        format.html { render 'password'}
      elsif @survey
        @page = (params[:page] || 1).to_i
        @page = 1 if @page < 1 || @page > @survey.total_page + 1
        @subjects = @survey.find_subjects_by_page(@page)
        format.html {  render 'reply'}
      else
        flash[:notice] = t(:label_csi_survey_no_form)
        format.html { redirect_to({:action=>"index"})}
      end
    end
  end

  def create_result
    @survey_results = params[:result]
    @survey_id = params[:survey_id]
    @thank_message = Csi::Survey.find(@survey_id).thanks_message
    if !@survey_results.blank?
       @survey_results.each do |survey_result|
             subject_id = survey_result[0]
             results = survey_result[1]
             if results.is_a?(Array)
                if results.include?('_other')
                  results.delete('_other')
                  other_result=results.detect {|c| c.is_a?(Hash)}
                  Csi::SurveyResult.create({:subject_id=>subject_id,
                                            :subject_result=>other_result['other'],
                                            :option_type=>"other"})
                end
                results.each do |result|
                  if !result.is_a?(Hash)
                     Csi::SurveyResult.create({:subject_id=>subject_id,
                                               :subject_result=>result,
                                               :option_type=>"normal"})
                  end
                end
             else
                Csi::SurveyResult.create({:subject_id=>subject_id,
                                          :subject_result=>results})
             end
       end
    end
    flash[:notice] = @thank_message.to_s

    respond_to do |format|
        format.html { redirect_to({:action=>"index"}, :notice => @thank_message) }
        format.xml  { render :xml => @survey, :status => :created, :location => @survey }
    end
  end
end
