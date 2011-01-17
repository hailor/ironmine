class Csi::SurveysController < ApplicationController
  layout "setting" 
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
        flash[:notice] = "对不起，您访问的表单不存在"
        format.html { redirect_to root_path}
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
        flash[:notice] = t(:form_no_exist)
        format.html { redirect_to root_path}
      end
    end
  end
end
