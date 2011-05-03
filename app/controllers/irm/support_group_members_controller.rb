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
    people_scope = Irm::Person.query_by_person_name(params[:person_name],I18n.locale,params[:support_group_code])
    people_scope = people_scope.match_value("#{Irm::Person.table_name}.full_name",params[:person_name])
    people_scope = people_scope.match_value("#{Irm::Person.table_name}.full_name",params[:email_address])
    @people,count = paginate(people_scope)
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


  def new_from_person
    @person = Irm::Person.find(params[:person_id])
    @support_group_member = Irm::SupportGroupMember.new(:person_id=>params[:person_id])
    @support_group_member.status_code = ""
  end

  def create_from_person
    @person = Irm::Person.find(params[:person_id])
    @support_group_member = Irm::SupportGroupMember.new(params[:irm_support_group_member])
    respond_to do |format|
      if(!@support_group_member.status_code.blank?)
        @support_group_member.status_code.split(",").delete_if{|i| i.blank?}.each do |id|
          support_group = Irm::SupportGroup.find(id)
          Irm::SupportGroupMember.create(:person_id=>@person.id,:support_group_code=>support_group.group_code)
        end
        format.html { redirect_to({:controller => "irm/people",:action=>"show",:id=>@person.id}, :notice => t(:successfully_created)) }
        format.xml  { render :xml => @support_group_member, :status => :created}
      else
        @support_group_member.errors.add(:status_code,"")
        format.html { render :action => "new_from_person" }
        format.xml  { render :xml => @person_role.errors, :status => :unprocessable_entity }
      end
    end
  end

  def get_person_support_group
    support_group_code = Irm::SupportGroup.multilingual.with_company(I18n.locale).not_include_person(params[:person_id])
    support_group_code = support_group_code.match_value("#{Irm::SupportGroupsTl.table_name}.name",params[:name])
    support_group_code = support_group_code.match_value("#{Irm::Person.table_name}.group_code",params[:group_code])
    @support_groups,count = paginate(support_group_code)
    respond_to do |format|
      format.json {render :json=>to_jsonp(@support_groups.to_grid_json([:name,:group_code,:company_name], count))}
    end
  end

  def delete_from_person
    @combo = Irm::SupportGroupMember.find(params[:id])
    @combo.destroy

    respond_to do |format|
      format.html { redirect_to({:controller=>"irm/people",:action=>"show",:id=>params[:person_id]}) }
      format.xml  { head :ok }
    end
  end

end
