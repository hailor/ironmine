module Irm::IdentitiesHelper
  def selectable_languages
    Irm::Language.enabled.installed.current_code_description.collect{|language|[language[:description],language[:language_code]]}      
  end
end
