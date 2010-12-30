class Irm::CompanyAccessesController < ApplicationController
  def create
    company_list = params[:company_choose_list].split(',')
    person_id = params[:person_id]
    flag = true
    if ((!company_list.blank?) && !(person_id .blank?))
      company_list.each do |company_id|
        if Irm::CompanyAccess.check_company_exists?(company_id,person_id)
            @company_access = Irm::CompanyAccess.new(:person_id => person_id,
                                           :accessable_company_id =>company_id )
            if !@company_access.save
              flag=false
            end
        end
      end
    end
    if flag
      respond_to do |format|
         flash[:successful_message] = (t :successfully_created)
         format.html { render "irm/common/_successful_message" }
      end
    else
      respond_to do |format|
         format.html { render "irm/common/_successful_message" }
      end
    end
  end

  def get_data
    @access_companies= Irm::CompanyAccess.query_wrap_info(I18n::locale)
    respond_to do |format|
      format.json {render :json=>@access_companies.to_dhtmlxgrid_json(['R',:company_name,:status_meaning], @access_companies.size)}
    end
  end
end
