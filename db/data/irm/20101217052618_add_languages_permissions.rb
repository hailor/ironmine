# -*- coding: utf-8 -*-
class AddLanguagesPermissions < ActiveRecord::Migration
  def self.up
    irm_languages_index = Irm::Permission.new(:permission_code=>'IRM_LANGUAGES_INDEX',
                                                   :page_controller=>'irm/languages',
                                                   :page_action=>'index',
                                                   :not_auto_mult=>true)
    irm_languages_index.permissions_tls.build(:language=>'zh',:name=>'设置语言信息',:description=>'设置语言信息',:source_lang=>'en')
    irm_languages_index.permissions_tls.build(:language=>'en',:name=>'Language',:description=>'Language',:source_lang=>'en')
    irm_languages_index.save

    irm_languages_new = Irm::Permission.new(:permission_code=>'IRM_LANGUAGES_NEW',
                                                   :page_controller=>'irm/languages',
                                                   :page_action=>'new',
                                                   :not_auto_mult=>true)
    irm_languages_new.permissions_tls.build(:language=>'zh',:name=>'新建语言信息',:description=>'新建语言信息',:source_lang=>'en')
    irm_languages_new.permissions_tls.build(:language=>'en',:name=>'New Language',:description=>'New Language',:source_lang=>'en')
    irm_languages_new.save

    irm_languages_edit = Irm::Permission.new(:permission_code=>'IRM_LANGUAGES_EDIT',
                                                   :page_controller=>'irm/languages',
                                                   :page_action=>'edit',
                                                   :not_auto_mult=>true)
    irm_languages_edit.permissions_tls.build(:language=>'zh',:name=>'编辑语言信息',:description=>'编辑语言信息',:source_lang=>'en')
    irm_languages_edit.permissions_tls.build(:language=>'en',:name=>'Edit Language',:description=>'Edit Language',:source_lang=>'en')
    irm_languages_edit.save

    irm_languages_create = Irm::Permission.new(:permission_code=>'IRM_LANGUAGES_CREATE',
                                                   :page_controller=>'irm/languages',
                                                   :page_action=>'create',
                                                   :not_auto_mult=>true)
    irm_languages_create.permissions_tls.build(:language=>'zh',:name=>'保存语言信息',:description=>'保存语言信息',:source_lang=>'en')
    irm_languages_create.permissions_tls.build(:language=>'en',:name=>'Create Language',:description=>'Create Language',:source_lang=>'en')
    irm_languages_create.save

    irm_languages_update = Irm::Permission.new(:permission_code=>'IRM_LANGUAGES_UPDATE',
                                                   :page_controller=>'irm/languages',
                                                   :page_action=>'update',
                                                   :not_auto_mult=>true)
    irm_languages_update.permissions_tls.build(:language=>'zh',:name=>'更新语言信息',:description=>'更新语言信息',:source_lang=>'en')
    irm_languages_update.permissions_tls.build(:language=>'en',:name=>'Update Language',:description=>'Update Language',:source_lang=>'en')
    irm_languages_update.save

    irm_languages_lang_edit = Irm::Permission.new(:permission_code=>'IRM_LANGUAGES_LANG_EDIT',
                                                   :page_controller=>'irm/languages',
                                                   :page_action=>'multilingual_edit',
                                                   :not_auto_mult=>true)
    irm_languages_lang_edit.permissions_tls.build(:language=>'zh',:name=>'编辑语言信息多语言',:description=>'编辑语言信息多语言',:source_lang=>'en')
    irm_languages_lang_edit.permissions_tls.build(:language=>'en',:name=>'Edit Language Multilingual',:description=>'Edit Language Multilingual',:source_lang=>'en')
    irm_languages_lang_edit.save


    irm_languages_lang_update = Irm::Permission.new(:permission_code=>'IRM_LANGUAGES_LANG_UPDATE',
                                                   :page_controller=>'irm/languages',
                                                   :page_action=>'multilingual_update',
                                                   :not_auto_mult=>true)
    irm_languages_lang_update.permissions_tls.build(:language=>'zh',:name=>'更新语言信息多语言',:description=>'更新语言信息多语言',:source_lang=>'en')
    irm_languages_lang_update.permissions_tls.build(:language=>'en',:name=>'Update Language Multilingual',:description=>'Update Language Multilingual',:source_lang=>'en')
    irm_languages_lang_update.save

    irm_languages_get_data = Irm::Permission.new(:permission_code=>'IRM_LANGUAGES_GET_DATA',
                                                   :page_controller=>'irm/languages',
                                                   :page_action=>'get_data',
                                                   :not_auto_mult=>true)
    irm_languages_get_data.permissions_tls.build(:language=>'zh',:name=>'获取语言信息',:description=>'获取语言信息',:source_lang=>'en')
    irm_languages_get_data.permissions_tls.build(:language=>'en',:name=>'Get Language',:description=>'Get Language',:source_lang=>'en')
    irm_languages_get_data.save
  end

  def self.down
    #
    lookup_types_permissions=Irm::Permission.query_by_page_controller("irm/languages")
    lookup_types_permissions.each do |permission|
       language_permissions=Irm::PermissionsTl.query_by_permission_id(permission.id)
       language_permissions.each do |language_permission|
          language_permission.delete
       end
       permission.delete
    end
  end
end
