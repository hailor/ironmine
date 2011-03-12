module Irm::IdentitiesHelper
  def selectable_languages
    Irm::Language.enabled.installed.current_code_description.collect{|language|[language[:description],language[:language_code]]}      
  end

  #关联人员有账号
  def attachable_identities(current_id=nil)
    if(current_id)
      Irm::Identity.enabled.query_all
    else
      Irm::Identity.enabled.attachable.query_all
    end
  end
end
