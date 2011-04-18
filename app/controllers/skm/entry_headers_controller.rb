class Skm::EntryHeadersController < ApplicationController
  def index
      session[:skm_entry_header] = nil
      session[:skm_entry_details] = nil
      session[:skm_entry_attachments] = nil
    @entry_header = Skm::EntryHeader.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @entry_header }
    end
  end

  def show
    @entry_header = Skm::EntryHeader.find(params[:id])
    @return_url=request.env['HTTP_REFERER']

    @history = Skm::EntryOperateHistory.new({:operate_code=>"SKM_SHOW",
                                             :entry_id=>params[:id],
                                             :version_number => @entry_header.version_number})
    @history.save

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @entry_header }
    end
  end

  def new
    session[:skm_entry_header] = params[:skm_entry_header] if params[:skm_entry_header]
    session[:skm_entry_details] = params[:skm_entry_details] if params[:skm_entry_details]
    if !params[:step]
      session[:skm_entry_header] = nil
      session[:skm_entry_details] = nil
      session[:skm_entry_attachments] = nil
    end
    if !params[:step] || params[:step] == "1"
      respond_to do |format|
        format.html { redirect_to({:action=>"new_step_1"}) }
      end    
    elsif params[:step] == "2"
      respond_to do |format|
        format.html { redirect_to({:action=>"new_step_2"}) }
      end
    elsif params[:step] == "3"
    #获取所有附件
      respond_to do |format|
        format.html { redirect_to({:action=>"new_step_3"}) }
      end
    elsif params[:step] == "4"

      files = params[:file]
      #调用方法创建附件
      attached = Irm::AttachmentVersion.create_verison_files(files, "Skm::EntryHeader", -1)
      t = session[:skm_entry_attachments]
      (session[:skm_entry_attachments] = (t ? t : []) + attached.collect(&:id)) if attached
      respond_to do |format|
        format.html { redirect_to({:action=>"new_step_4"}) }
      end
    end
  end

  def new_step_1
    @entry_header = Skm::EntryHeader.new
    if session[:skm_entry_header]
      session[:skm_entry_header].each do |k, v|
        @entry_header[k.to_sym] = v
      end
    end
    @templates = Skm::EntryTemplate.enabled
  end
  
  def new_step_2
    @entry_header = Skm::EntryHeader.new
    if !session[:skm_entry_header] || !session[:skm_entry_header][:entry_template_id]
      @templates = Skm::EntryTemplate.enabled
      @entry_header.errors.add(:entry_template_id, t(:error_choice_template))
      respond_to do |format|
        format.html { render :action => "new_step_1" }
        format.xml  { render :xml => @entry_header.errors, :status => :unprocessable_entity }
      end
    else
      session[:skm_entry_header].each do |k, v|
        @entry_header[k.to_sym] = v
      end
      @elements = Skm::EntryTemplateDetail.owned_elements(@entry_header.entry_template_id)
    end
  end  

  def new_step_3
    @entry_header = Skm::EntryHeader.new
    session[:skm_entry_header].each do |k, v|
      @entry_header[k.to_sym] = v
    end
    @entry_details = []
    session[:skm_entry_details].each do |k, v|
      t = Skm::EntryDetail.new(v)
      @entry_details << t
    end

    #验证上一步的输入正确性
    content_validate_flag = true
    @entry_details.each do |ed|
      (content_validate_flag = false ) if !ed.valid?
    end
    if !@entry_header.valid? || !content_validate_flag
      @elements = Skm::EntryTemplateDetail.owned_elements(@entry_header.entry_template_id)
      respond_to do |format|
        format.html { render :action => "new_step_2" }
        format.xml  { render :xml => @entry_header.errors, :status => :unprocessable_entity }
      end
    end

    if session[:skm_entry_attachments] && session[:skm_entry_attachments].size > 0
      @attachments = Irm::Attachment.list_all.where("latest_version_id IN (?)", session[:skm_entry_attachments])
    end
#    3.times { @entry_header.entry_subjects.build }
  end

  def new_step_4
#    @entry_header = Skm::EntryHeader.new
#    session[:skm_entry_header].each do |k, v|
#      @entry_header[k.to_sym] = v
#    end
#    @entry_subject = Skm::EntrySubject.new

    @entry_header = Skm::EntryHeader.new
    session[:skm_entry_header].each do |k, v|
      @entry_header[k.to_sym] = v
    end
    @entry_details = []
    session[:skm_entry_details].each do |k, v|
      t = Skm::EntryDetail.new(v)
      @entry_details << t
    end

    content_validate_flag = true
    @entry_details.each do |ed|
      (content_validate_flag = false ) if !ed.valid?
    end

    if !@entry_header.valid? || !content_validate_flag
      @elements = Skm::EntryTemplateDetail.owned_elements(@entry_header.entry_template_id)
      respond_to do |format|
        format.html { render :action => "new_step_2" }
        format.xml  { render :xml => @entry_header.errors, :status => :unprocessable_entity }
      end
    end
#    3.times { @entry_header.entry_subjects.build }
#    @entry_subject = Skm::EntrySubject.new
  end

  def edit
    @entry_header = Skm::EntryHeader.find(params[:id])
    @return_url=request.env['HTTP_REFERER'] if @return_url
  end

  def create
    @entry_header = Skm::EntryHeader.new
    session[:skm_entry_header].each do |k, v|
      @entry_header[k.to_sym] = v
    end
    session[:skm_entry_details].each do |k, v|
      t = Skm::EntryDetail.new(v)
      @entry_header.entry_details << t
    end
    @entry_header.entry_status_code = "PUBLISHED" if params[:status] && params[:status] == "PUBLISHED"
    @entry_header.entry_status_code = "DRAFT" if params[:status] && params[:status] == "DRAFT"
    @entry_header.published_date = Time.now
    @entry_header.doc_number = Skm::EntryHeader.generate_doc_number
    @entry_header.version_number = @entry_header.next_version_number
    @entry_header.author_id = Irm::Person.current.id
    respond_to do |format|
      if @entry_header.save
        #关联创建过程中关联的文件
        if session[:skm_entry_attachments] && session[:skm_entry_attachments].size > 0
          attachments = Irm::AttachmentVersion.where("id IN (?)", session[:skm_entry_attachments])
          attachments.each do |at|
            at.update_attribute(:source_id, @entry_header.id)
          end
        end
        session[:skm_entry_header] = nil
        session[:skm_entry_details] = nil
        session[:skm_entry_attachments] = nil
        if params[:status] == "DRAFT"
          format.html { redirect_to({:action=>"my_drafts"}, :notice =>t(:successfully_created)) }
        else
          format.html { redirect_to({:action=>"index"}, :notice =>t(:successfully_created)) }
        end

        format.xml  { render :xml => @entry_header, :status => :created, :location => @entry_header }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @entry_header.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    return_url = params[:return_url]
    if params[:new]
      old_header = Skm::EntryHeader.find(params[:id])
      @entry_header = Skm::EntryHeader.new(old_header.attributes)
      old_header.history_flag = "Y"
      @entry_header.history_flag = "N"
      @entry_header.entry_status_code = "PUBLISHED" if params[:status] && params[:status] == "PUBLISHED"
      @entry_header.entry_status_code = "DRAFT" if params[:status] && params[:status] == "DRAFT"
      @entry_header.version_number = old_header.next_version_number.to_s
      @entry_header.published_date = Time.now
      respond_to do |format|
        if @entry_header.save && old_header.save && @entry_header.update_attributes(params[:skm_entry_header])
          params[:skm_entry_details].each do |k, v|
            old_detail = Skm::EntryDetail.find(k)
            detail = Skm::EntryDetail.new(old_detail.attributes)
            detail.update_attributes(v)
            @entry_header.entry_details << detail
          end
          if return_url.blank?
            format.html { redirect_to({:action=>"index"}, :notice =>t(:successfully_created)) }
            format.xml  { render :xml => @entry_header, :status => :created, :location => @entry_header }
          else
            format.html { redirect_to(return_url, :notice =>t(:successfully_created)) }
            format.xml  { render :xml => @entry_header, :status => :created, :location => @entry_header }
          end
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @entry_header.errors, :status => :unprocessable_entity }
        end
      end
    else
      @entry_header = Skm::EntryHeader.find(params[:id])
#      @entry_header.entry_status_code = "PUBLISHED" if params[:status] && params[:status] == "PUBLISHED"
#      @entry_header.entry_status_code = "DRAFT" if params[:status] && params[:status] == "DRAFT"
      respond_to do |format|
        if @entry_header.update_attributes(params[:skm_entry_header]) &&
            @entry_header.update_attribute( :entry_status_code, params[:status])
          params[:skm_entry_details].each do |k, v|
            detail = Skm::EntryDetail.find(k)
            detail.update_attributes(v)
          end
          if return_url.blank?
            format.html { redirect_to({:action=>"index"}, :notice => t(:successfully_updated)) }
            format.xml  { head :ok }
          else
            format.html { redirect_to(return_url, :notice =>t(:successfully_created)) }
            format.xml  { render :xml => @entry_header, :status => :created, :location => @entry_header }
          end
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @entry_header.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  def get_data
    entry_headers_scope = Skm::EntryHeader.list_all.published.current_entry
    entry_headers_scope = entry_headers_scope.match_value("#{Skm::EntryHeader.table_name}.doc_number",params[:doc_number]) if params[:doc_number]
    entry_headers_scope = entry_headers_scope.match_value("#{Skm::EntryHeader.table_name}.keyword_tags",params[:keyword_tags]) if params[:keyword_tags]
    entry_headers_scope = entry_headers_scope.match_value("#{Skm::EntryHeader.table_name}.entry_title",params[:entry_title]) if params[:entry_title]
    entry_headers,count = paginate(entry_headers_scope)
    respond_to do |format|
      format.json  {render :json => to_jsonp(entry_headers.to_grid_json(['0',:entry_status_code, :full_title, :entry_title, :keyword_tags,:doc_number,:version_number, :published_date_f], count)) }
    end
  end

  def get_history_entries_data
    entry_histories_scope = Skm::EntryHeader.list_all.history_entry.where(:doc_number => params[:doc_number])
    entry_histories,count = paginate(entry_histories_scope)
    respond_to do |format|
      format.json  {render :json => to_jsonp(entry_histories.to_grid_json(['0',:entry_status_code, :full_title, :entry_title, :keyword_tags,:doc_number,:version_number, :published_date_f], count)) }
    end    
  end

  def index_search
    @search_value = params[:search_value]
  end

  def index_search_get_data
    entry_headers_scope = Skm::EntryHeader.list_all.published.current_entry
    entry_headers_scope = entry_headers_scope.match_value("#{Skm::EntryHeader.table_name}.entry_title",params[:search_value]) if params[:search_value]
    entry_headers,count = paginate(entry_headers_scope)

    if  !params[:search_value].nil? then
         @history = Skm::EntryOperateHistory.new({:operate_code=>"SKM_SEARCH",
                                                  :incident_id=>@incident_request.id ,
                                                  :search_key=>params[:search_value],
                                                  :result_count=>count});
         @history.save;
    end

    respond_to do |format|
      format.json  {render :json => to_jsonp(entry_headers.to_grid_json(['0',:entry_status_code, :full_title, :entry_title, :keyword_tags,:doc_number,:version_number, :published_date], count)) }
    end
  end

  def my_favorites_data
    entry_headers_scope = Skm::EntryHeader.list_all.my_favorites(params[:person_id]).published
    entry_headers,count = paginate(entry_headers_scope)
    respond_to do |format|
      format.json  {render :json => to_jsonp(entry_headers.to_grid_json(['0',:entry_status_code, :full_title, :entry_title, :keyword_tags,:doc_number,:version_number, :published_date_f], count)) }
    end    
  end

  def my_favorites

  end

  def add_favorites
    favorite = Skm::EntryFavorite.new({:person_id => params[:person_id], :entry_header_id => params[:id]})
    respond_to do |format|
      if favorite.save
        format.html { redirect_to(:action => "my_favorites") }
        format.xml  { head :ok }
      else
        format.html { redirect_to(:action => "index") }
      end
    end
  end

  def data_grid
    render :layout => nil
  end

  def remove_favorite
    favorite = Skm::EntryFavorite.where(:person_id => params[:person_id], :entry_header_id => params[:entry_header_id]).first
    favorite.destroy
    respond_to do |format|
      format.html { redirect_to(:action => "my_favorites") }
      format.xml  { head :ok }
    end
  end

  def my_drafts

  end

  def my_drafts_data
    entry_headers_scope = Skm::EntryHeader.list_all.my_drafts(params[:person_id])
    entry_headers,count = paginate(entry_headers_scope)
    respond_to do |format|
      format.json  {render :json => to_jsonp(entry_headers.to_grid_json(['0',:entry_status_code, :full_title, :entry_title, :keyword_tags,:doc_number,:version_number, :published_date], count)) }
    end        
  end


  def new_from_icm_request
    incident_request = Icm::IncidentRequest.list_all.where("#{Icm::IncidentRequest.table_name}.id = ?", params[:request_id]).first()
    template = Skm::EntryTemplate.where(:entry_template_code => "ENTRY_FROM_ICM_REQUEST_" + I18n.locale.to_s.upcase).first()
    elements = Skm::EntryTemplateDetail.owned_elements(template.id)
    entry_header = Skm::EntryHeader.new(:entry_title => incident_request.title,
                                        :doc_number => Skm::EntryHeader.generate_doc_number,
                                        :entry_template_id => template.id,
                                        :history_flag => "N",
                                        :entry_status_code => "DRAFT",
                                        :published_date => Time.now,
                                        :author_id => Irm::Person.current.id,
                                        :version_number => 1,
                                        :source_type=>"INCIDENT_REQUEST",
                                        :source_id => incident_request.id)
    elements.each do |e|
      if e.entry_template_element_code.include?("INCIDENT_REQUEST_INFO_")
        t = Skm::EntryDetail.new(:entry_content => incident_request.summary,
                                 :default_rows => e.default_rows,
                                 :entry_template_element_id => e.id,
                                 :element_name => e.element_name,
                                 :required_flag=> e.required_flag,
                                 :line_num=>e.line_num,
                                 :status_code=>"ENABLED")
        entry_header.entry_details << t
      elsif e.entry_template_element_code.include?("INCIDENT_REQUEST_INSTANCE_")
        t = Skm::EntryDetail.new(:entry_content => I18n::t(:label_incident_request) + ": " + incident_request.request_number + " ; " + I18n::t(:label_icm_incident_request_title) + ": " + incident_request.title,
                                 :default_rows => e.default_rows,
                                 :entry_template_element_id => e.id,
                                 :element_name => e.element_name,
                                 :required_flag=> e.required_flag,
                                 :line_num=>e.line_num,
                                 :status_code=>"ENABLED")
        entry_header.entry_details << t
      elsif e.entry_template_element_code.include?("INCIDENT_REQUEST_SOLUTION_")
        t = Skm::EntryDetail.new(:entry_content => incident_request.concat_journals,
                                 :default_rows => e.default_rows,
                                 :entry_template_element_id => e.id,
                                 :element_name => e.element_name,
                                 :required_flag=> e.required_flag,
                                 :line_num=>e.line_num,
                                 :status_code=>"ENABLED")
        entry_header.entry_details << t
      end
    end
    respond_to do |format|
      if entry_header.save
        format.html { redirect_to(:controller => "skm/entry_headers", :action => "edit", :id => entry_header.id)}
        format.xml  { head :ok }
      end
    end
  end

  def remove_exits_attachment_during_create
    @file = Irm::Attachment.where(:latest_version_id => params[:att_id]).first
    session[:skm_entry_attachments].delete_if{|i| i==params[:att_id]}
    @attachments = Irm::Attachment.list_all.where("latest_version_id IN (?)", session[:skm_entry_attachments])
    respond_to do |format|
      if @file.destroy
          format.js { render :remove_exits_attachment_during_create }
      end
    end
  end
end