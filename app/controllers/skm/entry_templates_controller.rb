class Skm::EntryTemplatesController < ApplicationController
  def index
    @entry_template = Skm::EntryTemplate.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @entry_status }
    end
  end

  def show
    @entry_template = Skm::EntryTemplate.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @entry_template }
    end
  end

  def new
    @entry_template = Skm::EntryTemplate.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @entry_template }
    end
  end

  def edit
    @entry_template = Skm::EntryTemplate.find(params[:id])
  end

  def create
    @entry_template = Skm::EntryTemplate.new(params[:skm_entry_template])
    respond_to do |format|
      if @entry_template.save
        format.html { redirect_to({:action=>"index"}, :notice =>t(:successfully_created)) }
        format.xml  { render :xml => @entry_template, :status => :created, :location => @entry_template }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @entry_template.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @entry_template = Skm::EntryTemplate.find(params[:id])

    respond_to do |format|
      if @entry_template.update_attributes(params[:skm_entry_template])
        format.html { redirect_to({:action=>"index"}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @entry_template.errors, :status => :unprocessable_entity }
      end
    end
  end

  def get_data
    entry_templates_scope = Skm::EntryTemplate.where("1=1")
    entry_templates_scope = entry_templates_scope.match_value("#{Skm::EntryTemplate.table_name}.entry_template_code",params[:entry_template_code]) if params[:entry_template_code]
    entry_templates_scope = entry_templates_scope.match_value("#{Skm::EntryTemplate.table_name}.name",params[:name]) if params[:name]
    
    entry_templates,count = paginate(entry_templates_scope)
    respond_to do |format|
      format.json  {render :json => to_jsonp(entry_templates.to_grid_json(['0',:entry_template_code, :name,:description,:status_code], count)) }
    end
  end

  def add_elements
    return_url=params[:return_url]
    params[:skm_entry_template_elements][:ids].each do |p|
      element = Skm::EntryTemplateElement.find(p)
      Skm::EntryTemplateDetail.create({:entry_template_id => params[:template_id],
                                       :entry_template_element_id => p,
                                       :default_rows => element.default_rows,
                                       :line_num => Skm::EntryTemplateDetail.max_line_num(params[:template_id]) + 1})
    end

    flash[:notice] = t(:successfully_updated)
    if return_url.blank?
      redirect_to({:action=>"select_elements", :template_id=> params[:template_id]})
    else
      redirect_to(return_url)
    end    
  end

  def get_available_elements
    entry_elements_scope = Skm::EntryTemplateElement.without_template(params[:template_id])
    entry_elements_scope = entry_elements_scope.match_value("#{Skm::EntryTemplateElement.table_name}.entry_template_element_code",params[:entry_template_element_code]) if params[:entry_template_element_code]
    entry_elements_scope = entry_elements_scope.match_value("#{Skm::EntryTemplateElement.table_name}.name",params[:name]) if params[:name]
    entry_elements,count = paginate(entry_elements_scope)
    respond_to do |format|
      format.json  {render :json => to_jsonp(entry_elements.to_grid_json(['0',:entry_template_element_code, :name,:description, :default_rows], count)) }
    end    
  end
  
  def remove_element
    return_url=params[:return_url]
    detail = Skm::EntryTemplateDetail.where(:entry_template_id => params[:template_id], :entry_template_element_id => params[:element_id]).first
    detail.destroy
    if return_url.blank?
      redirect_to({:action=>"show", :id=> params[:template_id]})
    else
      redirect_to(return_url)
    end    
  end

  def get_owned_elements_data
    entry_elements_scope = Skm::EntryTemplateElement.with_template(params[:template_id_t] || params[:template_id])
    entry_elements,count = paginate(entry_elements_scope)
    respond_to do |format|
      format.json  {render :json => to_jsonp(entry_elements.to_grid_json(['0',:required_flag, :entry_template_element_code, :name,:description, :default_rows], count)) }
    end    
  end

  def select_elements
    @return_url= params[:return_url] || request.env['HTTP_REFERER']
    @template = Skm::EntryTemplate.find(params[:template_id])  
  end

  def up_element
    return_url=params[:return_url]        
    detail = Skm::EntryTemplateDetail.where(:entry_template_id => params[:template_id], :entry_template_element_id => params[:element_id]).first
    pre_detail = detail.pre_detail
    pre_line_num = pre_detail.line_num
    cur_line_num = detail.line_num
    detail.update_attribute(:line_num, pre_line_num)
    pre_detail.update_attribute(:line_num, cur_line_num)
    if return_url.blank?
      redirect_to({:action=>"show", :id=> params[:template_id]})
    else
      redirect_to(return_url)
    end        
  end

  def down_element
    return_url=params[:return_url]    
    detail = Skm::EntryTemplateDetail.where(:entry_template_id => params[:template_id], :entry_template_element_id => params[:element_id]).first
    next_detail = detail.next_detail
    next_line_num = next_detail.line_num
    cur_line_num = detail.line_num
    detail.update_attribute(:line_num, next_line_num)
    next_detail.update_attribute(:line_num, cur_line_num)
    if return_url.blank?
      redirect_to({:action=>"show", :id=> params[:template_id]})
    else
      redirect_to(return_url)
    end        
  end
end