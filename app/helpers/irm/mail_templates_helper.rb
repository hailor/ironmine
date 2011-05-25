module Irm::MailTemplatesHelper
  def available_mail_template
    Irm::MailTemplate.multilingual.enabled.collect{|i| [i[:name],i.template_code]}
  end
  def available_mail_template_ids
    Irm::MailTemplate.multilingual.enabled.collect{|i| [i[:name],i.id]}
  end
end
