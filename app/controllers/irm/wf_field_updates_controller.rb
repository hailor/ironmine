class Irm::WfFieldUpdatesController < Irm::WfActionController
  # GET /wf_field_updates
  # GET /wf_field_updates.xml
  def index

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @wf_field_updates }
    end
  end

  # GET /wf_field_updates/1
  # GET /wf_field_updates/1.xml
  def show
    @wf_field_update = Irm::WfFieldUpdate.list_all.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @wf_field_update }
    end
  end

  # GET /wf_field_updates/new
  # GET /wf_field_updates/new.xml
  def new
    @wf_field_update = Irm::WfFieldUpdate.new(:bo_code=>get_bo_code_from_source_str(params[:source_str]))

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @wf_field_update }
    end
  end

  # GET /wf_field_updates/1/edit
  def edit
    @wf_field_update = Irm::WfFieldUpdate.list_all.find(params[:id])
  end

  # POST /wf_field_updates
  # POST /wf_field_updates.xml
  def create
    @wf_field_update = Irm::WfFieldUpdate.new(params[:irm_wf_field_update])

    respond_to do |format|
      if @wf_field_update.save
        create_for_source(params[:source_str],@wf_field_update)
        format.html {
          if(params[:save_and_new])
            redirect_to(({:action => "new"}).merge(get_default_url_options([:back_url,:source_str])), :notice => t(:successfully_created))
          else
            redirect_back_or_default({:action=>"index"})
          end

        }
        format.xml  { render :xml => @wf_field_update, :status => :created, :location => @wf_field_update }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @wf_field_update.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /wf_field_updates/1
  # PUT /wf_field_updates/1.xml
  def update
    @wf_field_update = Irm::WfFieldUpdate.find(params[:id])

    respond_to do |format|
      if @wf_field_update.update_attributes(params[:irm_wf_field_update])
        format.html {
          if(params[:save_and_new])
            redirect_to(({:action => "new"}).merge(get_default_url_options([:back_url,:source_str])), :notice => t(:successfully_updated))
          else
            redirect_back_or_default({:action=>"index"})
          end
        }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @wf_field_update.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /wf_field_updates/1
  # DELETE /wf_field_updates/1.xml
  def destroy
    @wf_field_update = Irm::WfFieldUpdate.find(params[:id])
    @wf_field_update.destroy

    respond_to do |format|
      format.html { redirect_to({:action=>"index"}) }
      format.xml  { head :ok }
    end
  end

  def set_value
    @object_attribute = Irm::ObjectAttribute.where(:business_object_code=>params[:bo_code],:attribute_name=>params[:object_attribute]).first
    @wf_field_update = Irm::WfFieldUpdate.new
  end

  def get_data
    wf_field_updates_scope = Irm::WfFieldUpdate.list_all
    wf_field_updates_scope = wf_field_updates_scope.match_value("wf_field_updates.name",params[:name])
    wf_field_updates,count = paginate(wf_field_updates_scope)
    respond_to do |format|
      format.json {render :json=>to_jsonp(wf_field_updates.to_grid_json([:name,:description,:field_update_code,:object_attribute_name,:bo_name,:value_type_name],count))}
    end
  end


end
