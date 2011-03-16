module Irm::BulletinsHelper
  def ava_access_companies
    accesses = Irm::CompanyAccess.query_by_person_id(Irm::Person.current.id).collect{|c| c.accessable_company_id}
    accessable_companies = Irm::Company.multilingual.query_by_ids(accesses)
    accessable_companies.collect{|p| [p[:name], p.id]}
  end

  def ava_access_departments
    accesses = Irm::CompanyAccess.query_by_person_id(Irm::Person.current.id).collect{|c| c.accessable_company_id}
#    accessable_companies = Irm::Company.multilingual.query_by_ids(accesses)
    departments = []
    accesses.each do |t|
      te = Irm::Department.multilingual.where("#{Irm::Department.table_name}.company_id = ?", t)
      departments = departments + te if te.size > 0
    end

    departments = departments.uniq
    departments.collect{|p| [p[:name], p.id]}
  end

  def ava_access_roles
    roles = Irm::Role.multilingual.enabled.where("#{Irm::Role.table_name}.company_id = ?", Irm::Company.current.id)
    roles.collect{|p| [p[:name], p.id]}
  end

  def show_accesses(bulletin)
    ba = Irm::BulletinAccess.list_all(bulletin.id)
    tags = ""
    line_count = 0
    ba.each do |t|
      tags = tags + content_tag(:tr,
                                content_tag(:td, t(:label_irm_bulletin_selected_companies), {:class => "labelCol"}) +
                                content_tag(:td, raw(t.name + content_tag(:a, raw("&nbsp;&nbsp;") + t(:delete), {:href => "javascript:void(0);", :onclick => "remove_line('" + line_count.to_s+ "');"})), {:class => "data2Col"}) +
                                content_tag(:input, "", {:type => "hidden", :name => "accesses[" +line_count.to_s+ "][type]", :value => t.access_type}) +
                                content_tag(:input, "", {:type => "hidden", :name => "accesses[" +line_count.to_s+ "][access_id]", :value => t.access_id}),
                                {:id => "tr_" + line_count.to_s})
    end
    raw(tags)
  end
end