module MultilingualHelper
  # 取得当前语言的code
  def local_language_code
    ::I18n.locale
  end
  # 取得语言code对应的含义 //TODO query from database
  def language_code_meaning(code)
    t("language_code_#{code}")
  end
end