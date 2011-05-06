module Irm
  module Jobs
    class IcmIncidentRequestSurveyTaskJob < Struct.new(:incident_request_id)
      def perform
        request = Icm::IncidentRequest.find(incident_request_id)
        surveys = Csi::Survey.where("closed_datetime IS NULL OR closed_datetime > ?", Time.now).
            where("with_incident_request = ?", Irm::Constant::SYS_YES).enabled


        Delayed::Worker.logger.debug("IcmIncidentRequestSurveyTaskJob Find  surveys #{surveys.size}")

        #cc = Irm::Calendar.current_calendar(request.requested_by)
        person = Irm::Person.find(request.requested_by)
        surveys.each do |sv|
          Delayed::Worker.logger.debug("IcmIncidentRequestSurveyTaskJob Detect #{sv.id}")
          next if Csi::SurveyMember.where(:survey_id=>sv.id,:person_id=>person.id,:source_id=>request.id,:source_type=>request.class.name).first
          Delayed::Worker.logger.debug("IcmIncidentRequestSurveyTaskJob Execute #{sv.id}")
          sv.survey_ranges.sort_by{|i| i.required_flag}.each do |sr|
            person_ids = sr.person_ids
            Delayed::Worker.logger.debug("IcmIncidentRequestSurveyTaskJob Find survey rang:#{sr.id} person ids:#{person_ids} current person #{person.id} ====#{person_ids.include?(person.id)}")
            next unless person_ids.include?(person.id)
            sm = Csi::SurveyMember.where(:survey_id=>sv.id,:person_id=>person.id,:source_id=>request.id,:source_type=>request.class.name).first
            if sm
              Delayed::Worker.logger.debug("IcmIncidentRequestSurveyTaskJob update survey member #{sm.id}")
              sm.update_attributes(:required_flag=>sr.required_flag,:end_date_active=>(sv.due_dates||24).hours.from_now) if sm
            else
              sm=Csi::SurveyMember.create(:survey_id=>sv.id,:person_id=>person.id,:required_flag=>sr.required_flag,:response_flag=>Irm::Constant::SYS_NO,:end_date_active=>(sv.due_dates||24).hours.from_now,:source_id=>request.id,:source_type=>request.class.name)
              Delayed::Worker.logger.debug("IcmIncidentRequestSurveyTaskJob create survey member #{sm.id}")
            end
          end

          #task = Irm::TodoEvent.new(:name => "[" + I18n.t(:label_csi_survey, :locale => person.language_code) + "]" + sv.title,
          #                      :calendar_id => cc.id,
          #                      :description => sv.description,
          #                      :color => "345e77",
          #                      :start_at => Time.now,
          #                      :end_at => Time.now,
          #                      :url => {:controller=> "csi/surveys", :action=>"reply", :id=>sv.id},
          #                      :source_id => sv.id, :source_type => sv.class)
          #task.save
        end
      end
    end
  end
end