class Irm::SupportGroupMembersController < ApplicationController

  def select_person
    @support_group = Irm::SupportGroup.find(params[:support_group_id])
    @support_group_member = Irm::SupportGroupMember.new(:support_group_code=>params[:support_group_code])
    @support_group_member.status_code = ""
  end

  def create
    @support_group = Irm::SupportGroup.find(params[:support_group_id])
    @support_group_member = Irm::SupportGroupMember.new(params[:irm_support_group_member])
    respond_to do |format|
      if(!@support_group_member.status_code.blank?)
        @support_group_member.status_code.split(",").delete_if{|i| i.blank?}.each do |id|
          Irm::SupportGroupMember.create(:person_id=>id,:support_group_code=>@support_group.group_code)
        end
        format.html { redirect_to({:controller => "irm/support_groups",:action=>"show",:id=>@support_group.id}, :notice => t(:successfully_created)) }
        format.xml  { render :xml => @support_group_member, :status => :created}
      else
        @support_group_member.errors.add(:status_code,"")
        format.html { render :action => "select_person" }
        format.xml  { render :xml => @person_role.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def get_data
    @support_group_members= Irm::SupportGroupMember.query_wrap_info(I18n::locale,params[:support_group_code])
    @support_group_members,count = paginate(@support_group_members)
    respond_to do |format|
      format.json {render :json=>to_jsonp(@support_group_members.to_grid_json([:person_name,:company_name,:email_address], count))}
    end
  end

  def get_person
    @people = Irm::Person.query_by_person_name(params[:person_name],I18n.locale,params[:support_group_code])
    @people,count = paginate(@people)
    respond_to do |format|
      format.json {render :json=>to_jsonp(@people.to_grid_json(['R',:person_name,:company_name,:email_address], count))}
    end
  end


  def get_options
    support_group_members_scope= Irm::SupportGroupMember.with_person.with_support_group(I18n.locale).query_by_support_group(params[:group_id])
    support_group_members = support_group_members_scope.collect{|p| {:label=>p[:person_name],:value=>p[:person_id]}}
    respond_to do |format|
      format.json {render :json=>support_group_members.to_grid_json([:label,:value],support_group_members.count)}
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
