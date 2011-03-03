module Irm
  module Jobs
    class IcmGroupAssignmentJob < Struct.new(:incident_request_id)
      def perform
        request = Icm::IncidentRequest.find(incident_request_id)
        person = Irm::Person.find(request.requested_by)
        site_groups = Irm::Location.where("company_id = ? AND site_group_code is not null AND LENGTH(site_group_code) > 0", person.company_id)
        sites = Irm::Location.where("company_id = ? AND site_group is not null AND LENGTH(site_group) > 0", person.company_id)
        #按公司查找
        r1 = Icm::GroupAssignment.query_by_company(person.company_id)
        r2 = r1
        #按地点组查找
        if r1.any?
          r2 = r1
          r1 = r1.query_by_site_groups(site_groups)
        end
        #按地点查找
        if r1.any?
          r2 = r1
          r1 = r1.query_by_sites(sites)
        end
        #按组织查找
        if r1.any?
          r2 = r1
          r1 = r1.query_by_organizations(person.organization_id)
        end
        #按部门查找
        if r1.any?
          r2 = r1
          r1 = r1.query_by_department(person.department_id)
        end
        #按人员查找
        if r1.any?
          r2 = r1
          r1 = r1.query_by_person(person.id)
        end

        if r1.any?
          r2 = r1
        end
        
        if r2.any?
          support_group = Irm::SupportGroup.where("group_code = ?", r2.first.support_group_code).first
          request.update_attribute(:support_group_id, support_group.id)  
        end
      end
    end
  end
end