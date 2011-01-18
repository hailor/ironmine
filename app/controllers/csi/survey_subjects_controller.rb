class Csi::SurveySubjectsController < ApplicationController
  # GET /survey_subjects
  # GET /survey_subjects.xml
  def index
    @survey_subjects = Csi::SurveySubject.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @survey_subjects }
    end
  end

  # GET /survey_subjects/1
  # GET /survey_subjects/1.xml
  def show
    @survey_subject = Csi::SurveySubject.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @survey_subject }
    end
  end

  # GET /survey_subjects/new
  # GET /survey_subjects/new.xml
  def new
    @survey_subject = Csi::SurveySubject.new(:input_type=>'string')
    @survey_id = params[:survey_id]
    @survey = Csi::Survey.find(params[:survey_id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @survey_subject }
    end
  end

  # GET /survey_subjects/1/edit
  def edit
    @survey_subject = Csi::SurveySubject.find(params[:id])
    @survey_id = params[:survey_id]
    @survey = Csi::Survey.find(params[:survey_id])
  end

  # POST /survey_subjects
  # POST /survey_subjects.xml
  def create
    @survey_subject = Csi::SurveySubject.new(params[:csi_survey_subject])
    @subject_options= params[:options]
    @commit = params[:commit]

    respond_to do |format|
      if @survey_subject.save
        if !@subject_options.blank?
           @subject_options.each do |option|
              @survey_subject.subject_options.create({:value=>option})
           end
        end        
        if @commit == t(:save_and_new)
          format.html { redirect_to({:action=>"new",:survey_id=>@survey_subject.survey_id},
                                    :notice => t(:successfully_created)) }
        else
          format.html { redirect_to({:action=>"index"}, :notice => t(:successfully_created)) }
        end
        format.xml  { render :xml => @survey_subject, :status => :created, :location => @survey_subject }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @survey_subject.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /survey_subjects/1
  # PUT /survey_subjects/1.xml
  def update
    @survey_subject = Csi::SurveySubject.find(params[:id])
    @subject_options= params[:options]

    respond_to do |format|
      if @survey_subject.update_attributes(params[:csi_survey_subject])
        #删除原来的数据，替换现在的数据
        Csi::SubjectOption.delete_by_subject(@survey_subject.id)
        @subject_options.each do |option|
           @survey_subject.subject_options.create({:value=>option})
        end
        format.html { redirect_to({:action=>"index"}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @survey_subject.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /survey_subjects/1
  # DELETE /survey_subjects/1.xml
  def destroy
    @survey_subject = Csi::SurveySubject.find(params[:id])
    @survey_subject.destroy

    respond_to do |format|
      format.html { redirect_to(survey_subjects_url) }
      format.xml  { head :ok }
    end
  end
end
