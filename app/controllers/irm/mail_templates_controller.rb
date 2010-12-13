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

  # GET /mail_templates/1/edit
  def edit
    @mail_template = Irm::MailTemplate.multilingual.find(params[:id])
  end

  # POST /mail_templates
  # POST /mail_templates.xml
  def create
    @mail_template = Irm::MailTemplate.new(params[:irm_mail_template])

    respond_to do |format|
      if @mail_template.save
        flash[:successful_message] = (t :successfully_created)
        format.html { render "return" }
        format.xml  { render :xml => @mail_template, :status => :created, :location => @mail_template }
      else
        @error = @mail_template
        format.html { render "irm/common/error_message" }
        format.xml  { render :xml => @mail_template.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mail_templates/1
  # PUT /mail_templates/1.xml
  def update
    @mail_template = Irm::MailTemplate.find(params[:id])

    respond_to do |format|
      if @mail_template.update_attributes(params[:irm_mail_template])
        flash[:successful_message] = (t :successfully_updated)
        format.html { render "return" }
        format.xml  { head :ok }
      else
        @error = @mail_template
        format.html { render "irm/common/error_message" }
        format.xml  { render :xml => @mail_template.errors, :status => :unprocessable_entity }
      end
    end
  end

  def multilingual_edit
    @local_language_code=::I18n.locale
    @template_id = params[:id]
    @mail_template = Irm::MailTemplate.multilingual.find(params[:id])
  end

  def multilingual_update
    @mail_template = Irm::MailTemplate.find(params[:id])
    @mail_templates_tl= Irm::MailTemplatesTl.query_by_language(params[:language_code]).query_by_template_id(params[:id]).first
    @mail_template.not_auto_mult=true
    params[:irm_mail_template].delete(:template_code)
    params[:irm_mail_template].delete(:from)

    respond_to do |format|
      if @mail_templates_tl.update_attributes(params[:irm_mail_template])
        flash[:successful_message] = (t :successfully_updated)
        format.html { render "return" }
        format.xml  { head :ok }
      else
        @error = @mail_templates_tl
        format.html { render "irm/common/error_message" }
        format.xml  { render :xml => @mail_template.errors, :status => :unprocessable_entity }
      end
    end
  end

  def get_data
    @mail_template= Irm::MailTemplate.multilingual.query_wrap_info(I18n::locale)
    respond_to do |format|
      format.json {render :json=>@mail_template.to_dhtmlxgrid_json(['R',:entity_meaning,:template_code,:name,:description,:status_meaning,
                                                             {:value => 'M', :controller => 'irm/mail_templates',:action =>  'multilingual_edit', :id => 'id', :action_type => 'ajaxLink',:view_port=>'id_mail_template_list', :script => '/replace(id_mail_template_list,id_mail_template_multilingual);/'}],@mail_template.size)}
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