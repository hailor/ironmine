module Irm::MailTemplatesHelper
  def available_mail_template
    Irm::MailTemplate.query_by_status_code("ENABLED").multilingual
  end
end
