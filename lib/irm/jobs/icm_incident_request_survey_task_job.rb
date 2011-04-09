module Irm
  module Jobs
    class IcmIncidentRequestSurveyTaskJob < Struct.new(:incident_request_id)
      def perform
        request = Icm::IncidentRequest.find(incident_request_id)
        surveys = Csi::Survey.where("with_incident_request_from < ?", Time.now).
            where("with_incident_request_to IS NULL OR with_incident_request_to > ?", Time.now).
            where("with_incident_request = ?", Irm::Constant::SYS_YES).enabled

        surveys.each do |sv|
          person = Irm::Person.find(request.requested_by)
          task = Irm::CalendarTask.new(:name => "[" + I18n.t(:label_csi_survey, :locale => person.language_code) + "]" + sv.title,
                                :description => sv.description,
                                :color => "345e77",
                                :start_at => Time.now,
                                :end_at => Time.now,
                                :owner_id => request.requested_by,
                                :url => {:controller=> "csi/survey", :action=>"reply", :id=>sv.id})
          task.save
        end

      end
    end
  end
end