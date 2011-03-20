class Irm::FunctionGroupsController < ApplicationController
  def index
    @function_group = Irm::FunctionGroup.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @function_group }
    end
  end

  def show
    @function_group = Irm::FunctionGroup.multilingual.where(:id => params[:id]).status_meaning.first()

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @function_group }
    end
  end

  def new
    @function_group = Irm::FunctionGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @function_group }
    end
  end

  def edit
    @function_group = Irm::FunctionGroup.multilingual.find(params[:id])
  end

  def create
    @function_group = Irm::FunctionGroup.new(params[:irm_function_group])
    respond_to do |format|
      if @function_group.save
        format.html { redirect_to({:action=>"index"}, :notice =>t(:successfully_created)) }
        format.xml  { render :xml => @function_group, :status => :created, :location => @function_group }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @function_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @function_group = Irm::FunctionGroup.find(params[:id])

    respond_to do |format|
      if @function_group.update_attributes(params[:irm_function_group])
        format.html { redirect_to({:action=>"index"}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @function_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @function_group = Irm::FunctionGroup.find(params[:id])
    @function_group.destroy

    respond_to do |format|
      format.html { redirect_to(function_groups_url) }
      format.xml  { head :ok }
    end
  end

  def get_data
    function_groups_scope = Irm::FunctionGroup.multilingual.status_meaning
    function_groups,count = paginate(function_groups_scope)
    respond_to do |format|
      format.json  {render :json => to_jsonp(function_groups.to_grid_json([:group_code,:name,:description,:status_meaning, :status_code], count)) }
    end    
  end


end
