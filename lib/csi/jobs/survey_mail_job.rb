module Csi
  module Jobs
    class SurveyMailJob<Struct.new(:survey_member_id)
      def perform

        sm = Csi::SurveyMember.find(survey_member_id)
        return unless sm
        Delayed::Worker.logger.debug("SurveyMailJob Detect sm #{sm.id}")

        survey = sm.survey
        Delayed::Worker.logger.debug("SurveyMailJob Detect survey #{survey.title}")

        params = {:to_person_ids=>[sm.person_id],:survey=>{:title=>survey.title,:closed_date=>sm.end_date_active}}
        Delayed::Worker.logger.debug("SurveyMailJob Detect person #{sm.person_id}")

        mail_template = Irm::MailTemplate.query_by_template_code("SURVEY_CREATE_MAIL").first
        return unless mail_template
        mail_template.deliver_to(params)
      end
    end
  end
end