class Skm::EntryTemplateElementsController < ApplicationController
  def index
    @element = Skm::EntryTemplateElement.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @element }
    end
  end

  def show
    @element = Skm::EntryTemplateElement.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @element }
    end
  end

  def new
    @element = Skm::EntryTemplateElement.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @element }
    end
  end

  def edit
    @element = Skm::EntryTemplateElement.find(params[:id])
  end

  def create
    @element = Skm::EntryTemplateElement.new(params[:skm_entry_template_element])
    respond_to do |format|
      if @element.save
        format.html { redirect_to({:action=>"index"}, :notice =>t(:successfully_created)) }
        format.xml  { render :xml => @element, :status => :created, :location => @element }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @element.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @element = Skm::EntryTemplateElement.find(params[:id])

    respond_to do |format|
      if @element.update_attributes(params[:skm_entry_template_element])
        format.html { redirect_to({:action=>"index"}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @element.errors, :status => :unprocessable_entity }
      end
    end
  end

  def get_data
    elements_scope = Skm::EntryTemplateElement.where("1=1")
    elements_scope = elements_scope.match_value("#{Skm::EntryTemplateElement.table_name}.entry_template_element_code",params[:entry_template_element_code]) if params[:entry_template_element_code]
    elements_scope = elements_scope.match_value("#{Skm::EntryTemplateElement.table_name}.name",params[:name]) if params[:name]    
    elements,count = paginate(elements_scope)
    respond_to do |format|
      format.json  {render :json => to_jsonp(elements.to_grid_json(['0', :entry_template_element_code, :name,:description, :default_rows, :status_code], count)) }
    end
  end  
end