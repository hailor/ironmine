class Irm::CompanyAccessesController < ApplicationController
  def create
    @person_id = params[:person_id]
    @company_id = params["c1"]
    @status_code   = params["c2"]

    @mode = params["!nativeeditor_status"]

    @id = params["gr_id"]
    case @mode
      when "inserted"
            @company_access = Irm::CompanyAccess.new({:person_id => @person_id,
                                                      :accessable_company_id=>@company_id})
            @company_access.save!

            @tid = @company_access.id
        when "deleted"
            @company_access=Irm::CompanyAccess.find(@id)
            @company_access.destroy

            @tid = @id
        when "updated"
            @company_access=Irm::CompanyAccess.find(@id)
            @company_access.accessable_company_id = @company_id
            @company_access.status_code = @status_code
            @company_access.save!

            @tid = @id
    end
  end

  def get_data
    @access_companies= Irm::CompanyAccess.query_wrap_info(I18n::locale)
    respond_to do |format|
      format.json {render :json=>@access_companies.to_dhtmlxgrid_json(['R',:company_name,:status_meaning], @access_companies.size)}
    end
  end
end
