module Irm
  module Jobs
    class IcmGroupAssignmentJob < Struct.new(:incident_request_id)
      def perform
        request = Icm::IncidentRequest.find(incident_request_id)
        person = Irm::Person.find(request.requested_by)

        #按人员查找
        r1 = Icm::GroupAssignment.query_by_person(person.id)

        #按部门查找
        unless r1.any?
          r1 = Icm::GroupAssignment.query_by_department(person.department_id)
        end

        #按组织查找
        unless r1.any?
          r1 = Icm::GroupAssignment.query_by_organizations(person.organization_id)
        end

        #按公司查找
        unless r1.any?
          r1 = Icm::GroupAssignment.query_by_company(person.company_id)
        end
        
        if r1.any?
          support_group = Irm::SupportGroup.where("group_code = ?", r1.first.support_group_code).first
          request.update_attribute(:support_group_id, support_group.id)  
        end
      end
    end
  end
end