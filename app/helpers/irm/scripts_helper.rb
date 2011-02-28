module Irm::ScriptsHelper
  def available_conditions
    Irm::Condition.multilingual.enabled.collect{|i|[i[:name],i.condition_code]}
  end

  def available_actions
    Irm::Action.multilingual.enabled.collect{|i|[i[:name],i.action_code]}
  end

  def available_mail_templates
    Irm::MailTemplate.multilingual.enabled.collect{|i|[i[:name],i.action_code]}
  end
end
