class Irm::IdFlexesController < ApplicationController
  def index
    @id_flex = Irm::IdFlex.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @id_flex }
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
        flash[:successful_message] = (t :successfully_created)
        format.html { render "successful_info" }        
      else
         @error = @permission
         format.html { render "error_message" }
      end
    end
  end

  def update
    @id_flex = Irm::IdFlex.find(params[:id])

    respond_to do |format|
      if @id_flex.update_attributes(params[:irm_id_flex])
        flash[:successful_message] = (t :successfully_updated)
        format.html { render "successful_info" }
      else
        @error = @id_flex
        format.html { render "error_message" }
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
    @id_flexes = Irm::IdFlex.all
    respond_to do |format|
      format.json  {render :json => @id_flexes.to_dhtmlxgrid_json(['0',:id_flex_code,:id_flex_name,:description,:status_code], @id_flexes.size) }
    end
  end
end
