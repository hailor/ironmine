module Icm::GroupAssignmentsHelper
  def available_ass_companies
    Irm::Company.multilingual.enabled.collect{|p|[p[:name],p[:id]]}
  end

  def available_ass_sites
    Irm::Site.multilingual.enabled.collect{|p|[p[:name], p[:site_code]]}
  end

  def available_ass_site_groups
    Irm::SiteGroup.multilingual.enabled.collect{|p|[p[:name], p[:group_code]]}
  end

  def available_ass_departments
    Irm::Department.multilingual.enabled.collect{|p|[p[:name], p[:id]]}
  end

  def available_ass_people
    Irm::Person.where("1=1").collect{|p|[p.name, p.id]}
  end

  def available_ass_support_groups
    Irm::SupportGroup.multilingual.enabled.collect{|p|[p[:name], p[:group_code]]}
  end

  def available_ass_organizations
    Irm::Organization.multilingual.enabled.collect{|p|[p[:name], p[:id]]}
  end
end