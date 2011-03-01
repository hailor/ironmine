class Irm::Actions::SendMail
  def perform(event,script)
    params = event.params
    mail_template = Irm::MailTemplate.query_by_template_code(script.template_code).first
    mail_template.deliver_to(params)
  end
end