# -*- coding: utf-8 -*-
class AddFileCategoriesLookupData < ActiveRecord::Migration
  def self.up
    skm_file_categories=Irm::LookupType.new(:lookup_level=>'GLOBAL',:lookup_type=>'SKM_FILE_CATEGORIES',:status_code=>'ENABLED',:not_auto_mult=>true)
    skm_file_categories.lookup_types_tls.build(:lookup_type_id=>skm_file_categories.id,:meaning=>'文件类型',:description=>'文件类型',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    skm_file_categories.lookup_types_tls.build(:lookup_type_id=>skm_file_categories.id,:meaning=>'File Categories',:description=>'File Categories',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    skm_file_categories.save

    skm_file_categoriesimage= Irm::LookupValue.new(:lookup_type=>'SKM_FILE_CATEGORIES',:lookup_code=>'IMAGE',:start_date_active=>'2010-12-10',:status_code=>'ENABLED',:not_auto_mult=>true)
    skm_file_categoriesimage.lookup_values_tls.build(:lookup_value_id=>skm_file_categoriesimage.id,:meaning=>'图片',:description=>'图片',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    skm_file_categoriesimage.lookup_values_tls.build(:lookup_value_id=>skm_file_categoriesimage.id,:meaning=>'Image',:description=>'Image',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    skm_file_categoriesimage.save
    skm_file_categoriesvoice= Irm::LookupValue.new(:lookup_type=>'SKM_FILE_CATEGORIES',:lookup_code=>'VOICE',:start_date_active=>'2010-12-10',:status_code=>'ENABLED',:not_auto_mult=>true)
    skm_file_categoriesvoice.lookup_values_tls.build(:lookup_value_id=>skm_file_categoriesvoice.id,:meaning=>'声音',:description=>'声音',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    skm_file_categoriesvoice.lookup_values_tls.build(:lookup_value_id=>skm_file_categoriesvoice.id,:meaning=>'Voice',:description=>'Voice',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    skm_file_categoriesvoice.save
    skm_file_categoriesvideo= Irm::LookupValue.new(:lookup_type=>'SKM_FILE_CATEGORIES',:lookup_code=>'VIDEO',:start_date_active=>'2010-12-10',:status_code=>'ENABLED',:not_auto_mult=>true)
    skm_file_categoriesvideo.lookup_values_tls.build(:lookup_value_id=>skm_file_categoriesvideo.id,:meaning=>'视频',:description=>'视频',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    skm_file_categoriesvideo.lookup_values_tls.build(:lookup_value_id=>skm_file_categoriesvideo.id,:meaning=>'Video',:description=>'Video',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    skm_file_categoriesvideo.save
    skm_file_categoriesdocument= Irm::LookupValue.new(:lookup_type=>'SKM_FILE_CATEGORIES',:lookup_code=>'DOCUMENT',:start_date_active=>'2010-12-10',:status_code=>'ENABLED',:not_auto_mult=>true)
    skm_file_categoriesdocument.lookup_values_tls.build(:lookup_value_id=>skm_file_categoriesdocument.id,:meaning=>'文档',:description=>'文档',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    skm_file_categoriesdocument.lookup_values_tls.build(:lookup_value_id=>skm_file_categoriesdocument.id,:meaning=>'Document',:description=>'Document',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    skm_file_categoriesdocument.save
    skm_file_categoriesother= Irm::LookupValue.new(:lookup_type=>'SKM_FILE_CATEGORIES',:lookup_code=>'OTHER',:start_date_active=>'2010-12-10',:status_code=>'ENABLED',:not_auto_mult=>true)
    skm_file_categoriesother.lookup_values_tls.build(:lookup_value_id=>skm_file_categoriesother.id,:meaning=>'其它',:description=>'其它',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    skm_file_categoriesother.lookup_values_tls.build(:lookup_value_id=>skm_file_categoriesother.id,:meaning=>'Other',:description=>'Other',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    skm_file_categoriesother.save    
  end

  def self.down
  end
end
