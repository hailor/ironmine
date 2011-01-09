class Irm::SupportGroupMembersController < ApplicationController

  def select_person
    @return_url=params[:return_url]||request.env['HTTP_REFERER']
    @person_name = params[:person_name]
    @support_group_member = Irm::SupportGroupMember.new
    @support_group_code = params[:support_group_code]
  end

  def create
    return_url=params[:return_url]
    support_group_code=params[:support_group_code]
    person_name = params[:person_name]
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

  def get_person
    @people = Irm::Person.query_by_person_name(params[:person_name],I18n.locale,params[:support_group_code])
    @people,count = paginate(@people)
    respond_to do |format|
      format.json {render :json=>to_jsonp(@people.to_grid_json(['R',:person_name,:company_name,:email_address], count))}
    end
  end

  def delete
    @combo = Irm::SupportGroupMember.find(params[:id])
    @combo.destroy

    respond_to do |format|
      format.html { redirect_to({:controller=>"irm/support_groups",:action=>"show",:id=>params[:support_group_id]}) }
      format.xml  { head :ok }
    end
  end

end
