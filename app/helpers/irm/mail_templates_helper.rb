module Irm::MailTemplatesHelper
  def available_mail_template
    Irm::MailTemplate.multilingual.enabled.collect{|i| [i[:name],i.template_code]}
  end
end
