# -*- coding: utf-8 -*-
class InitIrmLanguage < ActiveRecord::Migration
  def self.up
    en_language=Irm::Language.new(:language_code=>'zh',
                                     :installed_flag=>'Y',
                                     :source_code=>'ENABLED',
                                     :not_auto_mult=>true);
    en_language.languages_tls.build(:language_id=>en_language.id,
                                    :description=>"Chinese",
                                    :language=>"en",
                                    :source_code=>'ENABLED',
                                    :source_lang=>"en");
    en_language.languages_tls.build(:language_id=>en_language.id,
                            :description=>"中文",
                            :language=>"zh",
                            :source_code=>'ENABLED',
                            :source_lang=>"en");
    zh_language=Irm::Language.new(:language_code=>'en',
                                     :installed_flag=>'Y',
                                     :source_code=>'ENABLED',
                                     :not_auto_mult=>true);
    zh_language.languages_tls.build(:language_id=>zh_language.id,
                            :description=>"English",
                            :language=>"en",
                            :source_code=>'ENABLED',
                            :source_lang=>"en");
    zh_language.languages_tls.build(:language_id=>zh_language.id,
                            :description=>"英文",
                            :language=>"zh",
                            :source_code=>'ENABLED',
                            :source_lang=>"en");
    jp_language=Irm::Language.new(:language_code=>'jp',
                                     :installed_flag=>'N',
                                     :source_code=>'ENABLED',
                                     :not_auto_mult=>true);
    jp_language.languages_tls.build(:language_id=>zh_language.id,
                            :description=>"Japanese",
                            :language=>"en",
                            :source_code=>'ENABLED',
                            :source_lang=>"en");
    jp_language.languages_tls.build(:language_id=>zh_language.id,
                            :description=>"日语",
                            :language=>"zh",
                            :source_code=>'ENABLED',
                            :source_lang=>"en");

    en_language.save
    zh_language.save
    jp_language.save
  end

  def self.down
    en_language = Irm::Language.query_code('en').first
    Irm::LanguagesTl.query_by_language_id(en_language.id).each do |t|
      t.delete
    end
    en_language.delete
    zh_language = Irm::Language.query_code('zh').first
    Irm::LanguagesTl.query_by_language_id(zh_language.id).each do |t|
      t.delete
    end
    zh_language.delete
    jp_language = Irm::Language.query_code('jp').first
    Irm::LanguagesTl.query_by_language_id(jp_language.id).each do |t|
      t.delete
    end
    jp_language.delete
  end
end
