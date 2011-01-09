class Irm::SupportGroupMembersController < ApplicationController

  def select_person
    @return_url=params[:return_url]||request.env['HTTP_REFERER']
    @person_name = params[:person_name]
    if params[:person_name]
      @people = Irm::Person.query_by_person_name(params[:person_name],I18n.locale)
    end
    @support_group_member = Irm::SupportGroupMember.new
    @support_group_code = params[:support_group_code]
    @support_group = Irm::SupportGroup.query_by_group_code(@support_group_code).
                                       query_wrap_info(I18n::locale).multilingual.first
  end

  def create
    return_url=params[:return_url]
    support_group_code=params[:support_group_code]
    person_name = params[:person_name]
    Irm::SupportGroupMember.delete_support_group_member(support_group_code)
    (params[:irm_support_group_member][:person_id] || []).each {|person_id|
       Irm::SupportGroupMember.create({:person_id=>person_id,
                                       :support_group_code=>support_group_code})
    }
    flash[:notice] = t(:successfully_updated)
    if return_url.blank?
      redirect_to({:action=>"select_person",:support_group_code=>support_group_code,
                   :person_name=>person_name})
    else
      redirect_to(return_url)
    end
  end
  
  def get_data
    @support_group_members= Irm::SupportGroupMember.query_wrap_info(I18n::locale,params[:support_group_code])
    @support_group_members,count = paginate(@support_group_members)
    respond_to do |format|
      format.json {render :json=>to_jsonp(@support_group_members.to_grid_json(['R',:person_name,:company_name,:email_address], count))}
    end
  end

end
