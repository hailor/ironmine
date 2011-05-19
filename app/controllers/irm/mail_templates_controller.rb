class Irm::MailTemplatesController < ApplicationController
  # GET /mail_templates
  # GET /mail_templates.xml
  def index
    @mail_templates = Irm::MailTemplate.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mail_templates }
    end
  end

  # GET /mail_templates/new
  # GET /mail_templates/new.xml
  def new
    @mail_template = Irm::MailTemplate.new(:template_type=>'html')

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mail_template }
    end
  end

  def show
    @mail_template = Irm::MailTemplate.list_all.find(params[:id])
  end

  # GET /mail_templates/1/edit
  def edit
    @mail_template = Irm::MailTemplate.list_all.find(params[:id])
  end

  # POST /mail_templates
  # POST /mail_templates.xml
  def create
    @mail_template = Irm::MailTemplate.new(params[:irm_mail_template])

    respond_to do |format|
      if @mail_template.save
        format.html { redirect_to({:action=>"index"},:notice => (t :successfully_created))}
        format.xml  { render :xml => @mail_template, :status => :created, :location => @mail_template }
      else
        format.html { render "new" }
        format.xml  { render :xml => @mail_template.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mail_templates/1
  # PUT /mail_templates/1.xml
  def update
    @mail_template = Irm::MailTemplate.find(params[:id])
    @mail_template.not_auto_mult=true
    respond_to do |format|
      if @mail_template.update_attributes(params[:irm_mail_template])
        format.html { redirect_to({:action=>"index"},:notice => (t :successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render "edit" }
        format.xml  { render :xml => @mail_template.errors, :status => :unprocessable_entity }
      end
    end
  end



  def get_data
    mail_templates_scope = Irm::MailTemplate.list_all
    mail_templates_scope = mail_templates_scope.match_value("#{Irm::MailTemplate.table_name}.template_code",params[:template_code])
    mail_templates_scope = mail_templates_scope.match_value("#{Irm::MailTemplatesTl.table_name}.name",params[:name])
    mail_templates,count = paginate(mail_templates_scope)
    respond_to do |format|
      format.json {render :json=>to_jsonp(mail_templates.to_grid_json([:template_code,:name,:description,:status_meaning],count))}
    end
  end


  def get_mail_templates
    mail_templates_scope = Irm::MailTemplate.multilingual.query_by_condition_code(params[:condition_code])
    mail_templates = mail_templates_scope.collect{|i| {:label=>i[:name],:value=>i.template_code,:id=>i.id}}
    respond_to do |format|
      format.json {render :json=>mail_templates.to_grid_json([:label,:value],mail_templates.count)}
    end
  end

  def get_current_language
    language_code=params[:language_code]
    @mail_template = Irm::MailTemplate.query_by_language(language_code).find(params[:id])
    respond_to do |format|
      format.js
    end
  end
end
