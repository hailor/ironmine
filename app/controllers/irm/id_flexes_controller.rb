class Irm::IdFlexesController < ApplicationController
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @id_flex = Irm::IdFlex.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @id_flex }
    end
  end

  def new
    @id_flex = Irm::IdFlex.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @id_flex }
    end
  end

  def edit
    @id_flex = Irm::IdFlex.find(params[:id])
  end

  def create
    @id_flex = Irm::IdFlex.new(params[:irm_id_flex])
    respond_to do |format|
      if @id_flex.save
        format.html { redirect_to({:action=>"index"}, :notice =>t(:successfully_created)) }
        format.xml  { render :xml => @id_flex, :status => :created, :location => @id_flex }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @id_flex.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @id_flex = Irm::IdFlex.find(params[:id])

    respond_to do |format|
      if @id_flex.update_attributes(params[:irm_id_flex])
        format.html { redirect_to({:action=>"index"}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @id_flex.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @id_flex = Irm::IdFlex.find(params[:id])
    @id_flex.destroy

    respond_to do |format|
      format.html { redirect_to(id_flexes_url) }
      format.xml  { head :ok }
    end
  end

  def get_data
    id_flexes_scope = Irm::IdFlex.where("1=1")
    id_flexes_scope = id_flexes_scope.match_value("#{Irm::IdFlex.table_name}.id_flex_code",params[:id_flex_code])
    id_flexes_scope = id_flexes_scope.match_value("#{Irm::IdFlex.table_name}.id_flex_name",params[:id_flex_name])
    id_flexes,count = paginate(id_flexes_scope)
    respond_to do |format|
      format.json  {render :json => to_jsonp(id_flexes.to_grid_json([:id_flex_code,:id_flex_name,:description,:status_code], count)) }
    end        
  end
end