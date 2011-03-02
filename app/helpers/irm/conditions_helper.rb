module Irm::ConditionsHelper
  def available_script_contexts
    Irm::ScriptContext.multilingual.enabled.collect{|i| [i[:name],i.context_code]}
  end
end
