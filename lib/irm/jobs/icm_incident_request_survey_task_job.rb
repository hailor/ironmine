module Irm
  module Jobs
    class IcmIncidentRequestSurveyTaskJob < Struct.new(:incident_request_id)
      def perform
        request = Icm::IncidentRequest.find(incident_request_id)
        surveys = Csi::Survey.where("with_incident_request_from IS NULL OR with_incident_request_from < ?", Time.now).
            where("with_incident_request_to IS NULL OR with_incident_request_to > ?", Time.now).
            where("with_incident_request = ?", Irm::Constant::SYS_YES).enabled

        cc = Irm::Calendar.current_calendar(request.requested_by)
        person = Irm::Person.find(request.requested_by)
        surveys.each do |sv|
          task = Irm::TodoEvent.new(:name => "[" + I18n.t(:label_csi_survey, :locale => person.language_code) + "]" + sv.title,
                                :calendar_id => cc.id,
                                :description => sv.description,
                                :color => "345e77",
                                :start_at => Time.now,
                                :end_at => Time.now,
                                :url => {:controller=> "csi/surveys", :action=>"reply", :id=>sv.id},
                                :source_id => sv.id, :source_type => sv.class)
          task.save
        end
      end
    end
  end
end