# -*- coding: utf-8 -*-
module Irm::LanguagesHelper
  def available_languages
    Irm::Language.enabled.installed.current_code_description.order("language_code")
  end
end
