class Irm::OpCatalogAccessesController < ApplicationController
  def index
    @op_catalog_access = Irm::OpCatalogAccess.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @op_catalog_access }
    end    
  end

  def get_data
    @op_catalog_accesses = Irm::OpCatalogAccess.list_all(params[:operational_catalog_id])
    respond_to do |format|
      format.json  {render :json => @op_catalog_accesses.to_dhtmlxgrid_json(['0',:company_name,:status_code, :icm_flag, :csi_flag, :skm_flag], @op_catalog_accesses.size) }
    end   
  end
end