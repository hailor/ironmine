module Irm
  module Jobs
    class IcmGroupAssignmentJob < Struct.new(:incident_request_id)
      include ActionController::UrlWriter
      def perform
        request = Icm::IncidentRequest.find(incident_request_id)
        person = Irm::Person.find(request.requested_by)

        #按人员查找
        r1 = Icm::GroupAssignment.where("1=1").query_by_person(person.id)

        #按部门查找
        unless r1.any?
          r1 = Icm::GroupAssignment.query_by_department(person.department_id)
        end

        #按组织查找
        unless r1.any?
          r1 = Icm::GroupAssignment.query_by_organization(person.organization_id)
        end

        #按公司查找
        unless r1.any?
          r1 = Icm::GroupAssignment.query_by_company(person.company_id)
        end

        assign_result = {}
        
        if r1.any?
          support_group = Irm::SupportGroup.where("group_code = ?", r1.first.support_group_code).first
          assign_result.merge!({:support_group_id=>support_group.id})
          assign_result.merge!(setup_support_person(support_group,request))
        else
          assign_result.merge!(setup_default_person(request))
        end
        ActiveRecord::Base.transaction do
          generate_journal(request,assign_result)
        end
      end

      def setup_support_person(support_group,request)
        assign_result ={}
        rule_setting = Icm::RuleSetting.list_all.where(:company_id=>request.company_id).first
        if rule_setting
          if "LONGEST_TIME_NOT_ASSIGN".eql?(rule_setting.assign_process_type)
            assigner = Irm::SupportGroupMember.query_by_support_group_code(support_group.group_code).with_person.order("#{Irm::Person.table_name}.last_assign").first
          else
            assigner = Irm::SupportGroupMember.query_by_support_group_code(support_group.group_code).with_person.order("#{Irm::Person.table_name}.open_tasks").first
          end
          if assigner
            assign_result.merge!({:support_person_id=>assigner.id})
            return
          end
        end
        assign_result.merge!(setup_default_person(request))
        assign_result
      end

      def setup_default_person(request)
        assign_result ={}
        company = Irm::Company.find(request.company_id)
        if company&&company.support_manager&&Irm::Person.query(company.support_manager).first
          assign_result.merge!(:support_person_id=>company.support_manager,:support_group_id=>nil)
        else
          assign_result.merge!(:support_person_id=>Irm::Person.admin.id,:support_group_id=>nil)
        end
        assign_result
      end

      def generate_journal(request,assign_result)
        person = Irm::Person.find(assign_result[:support_person_id])
        language_code = person.language_code
        incident_journal = request.incident_journals.build({:replied_by=>assign_result[:support_person_id],:message_body=>I18n.t(:label_icm_incident_auto_assign,{:locale=>language_code})})
        request.update_attributes(assign_result)
        person.update_attribute(:last_assigned_date,Time.now)
        publish_pass_incident_request(incident_journal)
      end

      def publish_pass_incident_request(incident_journal)
        incident_journal.reload
        incident_journal = Icm::IncidentJournal.select_all.with_replied_by.find(incident_journal.id)
        incident_request = Icm::IncidentRequest.list_all.find(incident_journal.incident_request_id)
        person_ids = [incident_request.submitted_by,incident_request.requested_by,incident_journal.replied_by,incident_request.support_person_id]+incident_request.person_watchers.collect{|i| i.id}
        person_ids.uniq!
        journal_url = url_for({:host=>Irm::Constant::DEFAULT_HOST,
                 :controller=>"icm/incident_journals",
                 :action =>"new",
                 :request_id=>incident_request.id,
                 :anchor=>"journal_#{incident_journal.id}"})
        Irm::EventManager.publish(:event_code=>"INCIDENT_REQUEST_PASS",
                                  :params=>{:to_person_ids=>person_ids,
                                            :journal=>incident_journal.attributes.merge(:url=>journal_url,:change_message=>"not change"),
                                            :request=>incident_request.attributes})
      end
    end
  end
end