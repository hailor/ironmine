class AddActionsPermissions < ActiveRecord::Migration
  def self.up
    irm_actions_index = Irm::Permission.new(:permission_code=>'IRM_ACTIONS_INDEX',
                                                   :page_controller=>'irm/actions',
                                                   :page_action=>'index',
                                                   :not_auto_mult=>true)
    irm_actions_index.permissions_tls.build(:language=>'zh',:name=>'设置执行动作',:description=>'设置执行动作',:source_lang=>'en')
    irm_actions_index.permissions_tls.build(:language=>'en',:name=>'Action',:description=>'Action',:source_lang=>'en')
    irm_actions_index.save

    irm_actions_new = Irm::Permission.new(:permission_code=>'IRM_ACTIONS_NEW',
                                                   :page_controller=>'irm/actions',
                                                   :page_action=>'new',
                                                   :not_auto_mult=>true)
    irm_actions_new.permissions_tls.build(:language=>'zh',:name=>'新建执行动作',:description=>'新建执行动作',:source_lang=>'en')
    irm_actions_new.permissions_tls.build(:language=>'en',:name=>'New Action',:description=>'New Action',:source_lang=>'en')
    irm_actions_new.save

    irm_actions_edit = Irm::Permission.new(:permission_code=>'IRM_ACTIONS_EDIT',
                                                   :page_controller=>'irm/actions',
                                                   :page_action=>'edit',
                                                   :not_auto_mult=>true)
    irm_actions_edit.permissions_tls.build(:language=>'zh',:name=>'编辑执行动作',:description=>'编辑执行动作',:source_lang=>'en')
    irm_actions_edit.permissions_tls.build(:language=>'en',:name=>'Edit Action',:description=>'Edit Action',:source_lang=>'en')
    irm_actions_edit.save

    irm_actions_create = Irm::Permission.new(:permission_code=>'IRM_ACTIONS_CREATE',
                                                   :page_controller=>'irm/actions',
                                                   :page_action=>'create',
                                                   :not_auto_mult=>true)
    irm_actions_create.permissions_tls.build(:language=>'zh',:name=>'保存执行动作',:description=>'保存执行动作',:source_lang=>'en')
    irm_actions_create.permissions_tls.build(:language=>'en',:name=>'Create Action',:description=>'Create Action',:source_lang=>'en')
    irm_actions_create.save

    irm_actions_update = Irm::Permission.new(:permission_code=>'IRM_ACTIONS_UPDATE',
                                                   :page_controller=>'irm/actions',
                                                   :page_action=>'update',
                                                   :not_auto_mult=>true)
    irm_actions_update.permissions_tls.build(:language=>'zh',:name=>'更新执行动作',:description=>'更新执行动作',:source_lang=>'en')
    irm_actions_update.permissions_tls.build(:language=>'en',:name=>'Update Action',:description=>'Update Action',:source_lang=>'en')
    irm_actions_update.save

    irm_actions_lang_edit = Irm::Permission.new(:permission_code=>'IRM_ACTIONS_LANG_EDIT',
                                                   :page_controller=>'irm/actions',
                                                   :page_action=>'multilingual_edit',
                                                   :not_auto_mult=>true)
    irm_actions_lang_edit.permissions_tls.build(:language=>'zh',:name=>'编辑执行动作多语言',:description=>'编辑执行动作多语言',:source_lang=>'en')
    irm_actions_lang_edit.permissions_tls.build(:language=>'en',:name=>'Edit Action Multilingual',:description=>'Edit Action Multilingual',:source_lang=>'en')
    irm_actions_lang_edit.save


    irm_actions_lang_update = Irm::Permission.new(:permission_code=>'IRM_ACTIONS_LANG_UPDATE',
                                                   :page_controller=>'irm/actions',
                                                   :page_action=>'multilingual_update',
                                                   :not_auto_mult=>true)
    irm_actions_lang_update.permissions_tls.build(:language=>'zh',:name=>'更新执行动作多语言',:description=>'更新执行动作多语言',:source_lang=>'en')
    irm_actions_lang_update.permissions_tls.build(:language=>'en',:name=>'Update Action Multilingual',:description=>'Update Action Multilingual',:source_lang=>'en')
    irm_actions_lang_update.save

    irm_actions_get_data = Irm::Permission.new(:permission_code=>'IRM_ACTIONS_GET_DATA',
                                                   :page_controller=>'irm/actions',
                                                   :page_action=>'get_data',
                                                   :not_auto_mult=>true)
    irm_actions_get_data.permissions_tls.build(:language=>'zh',:name=>'获取执行动作',:description=>'获取执行动作',:source_lang=>'en')
    irm_actions_get_data.permissions_tls.build(:language=>'en',:name=>'Get Action',:description=>'Get Action',:source_lang=>'en')
    irm_actions_get_data.save
  end

  def self.down
    #
    lookup_types_permissions=Irm::Permission.query_by_page_controller("irm/actions")
    lookup_types_permissions.each do |permission|
       language_permissions=Irm::PermissionsTl.query_by_permission_id(permission.id)
       language_permissions.each do |language_permission|
          language_permission.delete
       end
       permission.delete
    end
  end
end
