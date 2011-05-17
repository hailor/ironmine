module Irm::MailTemplatesHelper
  def available_script_context_fields(context_code)
    Irm::ScriptContextField.multilingual.query_by_context_code(context_code).collect{|i| [i[:name],"{{#{i.field_key}}}"]}
  end

  def available_mail_template
    Irm::MailTemplate.multilingual.enabled.collect{|i| [i[:name],i.template_code]}
  end
end
