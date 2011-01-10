class Irm::CompanyAccessesController < ApplicationController

  def new
   @person_id = params[:person_id] if params[:person_id]
   @company_access = Irm::CompanyAccess.new
   @return_url=request.env['HTTP_REFERER']
   @companies= Irm::Company.query_by_status_code("ENABLED").multilingual

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @company_access }
    end
  end

  def create
    person_id = params[:person_id]
    return_url = params[:return_url]

    Irm::CompanyAccess.delete_all(person_id)
    (params[:irm_company_access] || []).each {|company_id,company_access|
       if company_access.has_key?("accessable_company_id")
         @accessable_company_id = company_access[:accessable_company_id]
       end
       if company_access.has_key?("company_access_flag")
         @company_access_flag = company_access[:company_access_flag]
       end
       if company_access.has_key?("support_stuff_flag")
         @support_stuff_flag = company_access[:support_stuff_flag]
       end
       Irm::CompanyAccess.create({:person_id=>person_id,
                                  :accessable_company_id=>@accessable_company_id,
                                  :company_access_flag=>@company_access_flag,
                                  :support_stuff_flag=>@support_stuff_flag})
    }
    flash[:notice] = t(:successfully_updated)
    if return_url.blank?
      redirect_to({:action=>"new",:person_id=>person_id})
    else
      redirect_to(return_url)
    end
  end

  def get_data
    @access_companies= Irm::CompanyAccess.query_by_person_id(params[:person_id]).query_wrap_info(I18n::locale)
    @access_companies,count = paginate(@access_companies)
    respond_to do |format|
      format.json {render :json=>to_jsonp(@access_companies.to_grid_json(['R',:company_name,:status_meaning,:company_access_flag,:support_stuff_flag], count))}
    end
  end

  def get_company
    @all_companies= Irm::Company.query_by_status_code("ENABLED").multilingual
    @all_companies,count = paginate(@all_companies)
    respond_to do |format|
      format.json {render :json=>to_jsonp(@all_companies.to_grid_json(['R',:id,:name], count))}
    end
  end
end
