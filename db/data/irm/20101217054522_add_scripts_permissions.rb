class AddScriptsPermissions < ActiveRecord::Migration
  def self.up
    irm_scripts_index = Irm::Permission.new(:permission_code=>'IRM_SCRIPTS_INDEX',
                                                   :page_controller=>'irm/scripts',
                                                   :page_action=>'index',
                                                   :not_auto_mult=>true)
    irm_scripts_index.permissions_tls.build(:language=>'zh',:name=>'设置服务宏',:description=>'设置服务宏',:source_lang=>'en')
    irm_scripts_index.permissions_tls.build(:language=>'en',:name=>'Script',:description=>'Script',:source_lang=>'en')
    irm_scripts_index.save

    irm_scripts_new = Irm::Permission.new(:permission_code=>'IRM_SCRIPTS_NEW',
                                                   :page_controller=>'irm/scripts',
                                                   :page_action=>'new',
                                                   :not_auto_mult=>true)
    irm_scripts_new.permissions_tls.build(:language=>'zh',:name=>'新建服务宏',:description=>'新建服务宏',:source_lang=>'en')
    irm_scripts_new.permissions_tls.build(:language=>'en',:name=>'New Script',:description=>'New Script',:source_lang=>'en')
    irm_scripts_new.save

    irm_scripts_edit = Irm::Permission.new(:permission_code=>'IRM_SCRIPTS_EDIT',
                                                   :page_controller=>'irm/scripts',
                                                   :page_action=>'edit',
                                                   :not_auto_mult=>true)
    irm_scripts_edit.permissions_tls.build(:language=>'zh',:name=>'编辑服务宏',:description=>'编辑服务宏',:source_lang=>'en')
    irm_scripts_edit.permissions_tls.build(:language=>'en',:name=>'Edit Script',:description=>'Edit Script',:source_lang=>'en')
    irm_scripts_edit.save

    irm_scripts_create = Irm::Permission.new(:permission_code=>'IRM_SCRIPTS_CREATE',
                                                   :page_controller=>'irm/scripts',
                                                   :page_action=>'create',
                                                   :not_auto_mult=>true)
    irm_scripts_create.permissions_tls.build(:language=>'zh',:name=>'保存服务宏',:description=>'保存服务宏',:source_lang=>'en')
    irm_scripts_create.permissions_tls.build(:language=>'en',:name=>'Create Script',:description=>'Create Script',:source_lang=>'en')
    irm_scripts_create.save

    irm_scripts_update = Irm::Permission.new(:permission_code=>'IRM_SCRIPTS_UPDATE',
                                                   :page_controller=>'irm/scripts',
                                                   :page_action=>'update',
                                                   :not_auto_mult=>true)
    irm_scripts_update.permissions_tls.build(:language=>'zh',:name=>'更新服务宏',:description=>'更新服务宏',:source_lang=>'en')
    irm_scripts_update.permissions_tls.build(:language=>'en',:name=>'Update Script',:description=>'Update Script',:source_lang=>'en')
    irm_scripts_update.save

    irm_scripts_lang_edit = Irm::Permission.new(:permission_code=>'IRM_SCRIPTS_LANG_EDIT',
                                                   :page_controller=>'irm/scripts',
                                                   :page_action=>'multilingual_edit',
                                                   :not_auto_mult=>true)
    irm_scripts_lang_edit.permissions_tls.build(:language=>'zh',:name=>'编辑服务宏多语言',:description=>'编辑服务宏多语言',:source_lang=>'en')
    irm_scripts_lang_edit.permissions_tls.build(:language=>'en',:name=>'Edit Script Multilingual',:description=>'Edit Script Multilingual',:source_lang=>'en')
    irm_scripts_lang_edit.save


    irm_scripts_lang_update = Irm::Permission.new(:permission_code=>'IRM_SCRIPTS_LANG_UPDATE',
                                                   :page_controller=>'irm/scripts',
                                                   :page_action=>'multilingual_update',
                                                   :not_auto_mult=>true)
    irm_scripts_lang_update.permissions_tls.build(:language=>'zh',:name=>'更新服务宏多语言',:description=>'更新服务宏多语言',:source_lang=>'en')
    irm_scripts_lang_update.permissions_tls.build(:language=>'en',:name=>'Update Script Multilingual',:description=>'Update Script Multilingual',:source_lang=>'en')
    irm_scripts_lang_update.save

    irm_scripts_get_data = Irm::Permission.new(:permission_code=>'IRM_SCRIPTS_GET_DATA',
                                                   :page_controller=>'irm/scripts',
                                                   :page_action=>'get_data',
                                                   :not_auto_mult=>true)
    irm_scripts_get_data.permissions_tls.build(:language=>'zh',:name=>'获取服务宏',:description=>'获取服务宏',:source_lang=>'en')
    irm_scripts_get_data.permissions_tls.build(:language=>'en',:name=>'Get Script',:description=>'Get Script',:source_lang=>'en')
    irm_scripts_get_data.save
  end

  def self.down
    #
    lookup_types_permissions=Irm::Permission.query_by_page_controller("irm/scripts")
    lookup_types_permissions.each do |permission|
       language_permissions=Irm::PermissionsTl.query_by_permission_id(permission.id)
       language_permissions.each do |language_permission|
          language_permission.delete
       end
       permission.delete
    end
  end
end
