class Uid::LoginMappingsController < ApplicationController
  def index
    
  end
  
  # GET /login_mappings/1
  # GET /login_mappings/1.xml
  def show
    @login_mapping = Uid::LoginMapping.query_by_system(::I18n.locale).query_by_person.status_meaning.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @login_mapping }
    end
  end

  # GET /login_mappings/1/edit
  def edit
    @login_mapping = Uid::LoginMapping.find(params[:id])
  end

  # PUT /login_mappings/1
  # PUT /login_mappings/1.xml
  def update
    @login_mapping = Uid::LoginMapping.find(params[:id])

    respond_to do |format|
      if @login_mapping.update_attributes(params[:uid_login_mapping])
        format.html { redirect_to({:action=>"index"}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @login_mapping.errors, :status => :unprocessable_entity }
      end
    end
  end

  def get_data
    login_mappings_scope = Uid::LoginMapping.query_by_system(::I18n.locale).query_by_person.status_meaning
    login_mappings_scope = login_mappings_scope.match_value("v1.system_name",params[:system_name])
    login_mappings_scope = login_mappings_scope.match_value("#{Uid::ExternalLogin.table_name}.external_login_name",
                                                              params[:external_login_name])
    login_mappings_,count = paginate(login_mappings_scope)
    respond_to do |format|
      format.json {render :json=>to_jsonp(login_mappings_.to_grid_json([:person_name,:system_name,:external_login_name,:active_start_date,
                                                                        :active_end_date,:status_meaning],count))}
    end
  end

end