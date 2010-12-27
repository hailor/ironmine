# -*- coding: utf-8 -*-
class AddPeoplePermission < ActiveRecord::Migration
  def self.up
    irm_people_index = Irm::Permission.new(:permission_code=>'IRM_PEOPLE_INDEX',
                                                   :page_controller=>'irm/people',
                                                   :page_action=>'index',
                                                   :not_auto_mult=>true)
    irm_people_index.permissions_tls.build(:language=>'zh',:name=>'人员',:description=>'设置人员',:source_lang=>'en')
    irm_people_index.permissions_tls.build(:language=>'en',:name=>'Person',:description=>'Person',:source_lang=>'en')
    irm_people_index.save

    irm_people_new = Irm::Permission.new(:permission_code=>'IRM_PEOPLE_NEW',
                                                   :page_controller=>'irm/people',
                                                   :page_action=>'new',
                                                   :not_auto_mult=>true)
    irm_people_new.permissions_tls.build(:language=>'zh',:name=>'新建人员',:description=>'新建人员',:source_lang=>'en')
    irm_people_new.permissions_tls.build(:language=>'en',:name=>'New Person',:description=>'New Person',:source_lang=>'en')
    irm_people_new.save

    irm_people_edit = Irm::Permission.new(:permission_code=>'IRM_PEOPLE_EDIT',
                                                   :page_controller=>'irm/people',
                                                   :page_action=>'edit',
                                                   :not_auto_mult=>true)
    irm_people_edit.permissions_tls.build(:language=>'zh',:name=>'编辑人员',:description=>'编辑人员',:source_lang=>'en')
    irm_people_edit.permissions_tls.build(:language=>'en',:name=>'Edit Person',:description=>'Edit Person',:source_lang=>'en')
    irm_people_edit.save

    irm_people_create = Irm::Permission.new(:permission_code=>'IRM_PEOPLE_CREATE',
                                                   :page_controller=>'irm/people',
                                                   :page_action=>'create',
                                                   :not_auto_mult=>true)
    irm_people_create.permissions_tls.build(:language=>'zh',:name=>'保存人员',:description=>'保存人员',:source_lang=>'en')
    irm_people_create.permissions_tls.build(:language=>'en',:name=>'Create Person',:description=>'Create Person',:source_lang=>'en')
    irm_people_create.save

    irm_people_update = Irm::Permission.new(:permission_code=>'IRM_PEOPLE_UPDATE',
                                                   :page_controller=>'irm/people',
                                                   :page_action=>'update',
                                                   :not_auto_mult=>true)
    irm_people_update.permissions_tls.build(:language=>'zh',:name=>'更新人员',:description=>'更新人员',:source_lang=>'en')
    irm_people_update.permissions_tls.build(:language=>'en',:name=>'Update Person',:description=>'Update Person',:source_lang=>'en')
    irm_people_update.save

    irm_people_lang_edit = Irm::Permission.new(:permission_code=>'IRM_PEOPLE_LANG_EDIT',
                                                   :page_controller=>'irm/people',
                                                   :page_action=>'multilingual_edit',
                                                   :not_auto_mult=>true)
    irm_people_lang_edit.permissions_tls.build(:language=>'zh',:name=>'编辑人员多语言',:description=>'编辑人员多语言',:source_lang=>'en')
    irm_people_lang_edit.permissions_tls.build(:language=>'en',:name=>'Edit Person Multilingual',:description=>'Edit Person Multilingual',:source_lang=>'en')
    irm_people_lang_edit.save


    irm_people_lang_update = Irm::Permission.new(:permission_code=>'IRM_PEOPLE_LANG_UPDATE',
                                                   :page_controller=>'irm/people',
                                                   :page_action=>'multilingual_update',
                                                   :not_auto_mult=>true)
    irm_people_lang_update.permissions_tls.build(:language=>'zh',:name=>'更新人员多语言',:description=>'更新人员多语言',:source_lang=>'en')
    irm_people_lang_update.permissions_tls.build(:language=>'en',:name=>'Update Person Multilingual',:description=>'Update Person Multilingual',:source_lang=>'en')
    irm_people_lang_update.save

    irm_people_get_data = Irm::Permission.new(:permission_code=>'IRM_PEOPLE_GET_DATA',
                                                   :page_controller=>'irm/people',
                                                   :page_action=>'get_data',
                                                   :not_auto_mult=>true)
    irm_people_get_data.permissions_tls.build(:language=>'zh',:name=>'获取人员',:description=>'获取人员',:source_lang=>'en')
    irm_people_get_data.permissions_tls.build(:language=>'en',:name=>'Get Person',:description=>'Get Person',:source_lang=>'en')
    irm_people_get_data.save
  end

  def self.down
  end
end
