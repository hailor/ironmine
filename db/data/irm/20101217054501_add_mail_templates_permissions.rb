# -*- coding: utf-8 -*-
class AddMailTemplatesPermissions < ActiveRecord::Migration
  def self.up
    irm_mail_templates_index = Irm::Permission.new(:permission_code=>'IRM_TEMPLATES_INDEX',
                                                   :page_controller=>'irm/mail_templates',
                                                   :page_action=>'index',
                                                   :not_auto_mult=>true)
    irm_mail_templates_index.permissions_tls.build(:language=>'zh',:name=>'设置邮件模板',:description=>'设置邮件模板',:source_lang=>'en')
    irm_mail_templates_index.permissions_tls.build(:language=>'en',:name=>'Mail Template',:description=>'Mail Template',:source_lang=>'en')
    irm_mail_templates_index.save

    irm_mail_templates_new = Irm::Permission.new(:permission_code=>'IRM_TEMPLATES_NEW',
                                                   :page_controller=>'irm/mail_templates',
                                                   :page_action=>'new',
                                                   :not_auto_mult=>true)
    irm_mail_templates_new.permissions_tls.build(:language=>'zh',:name=>'新建邮件模板',:description=>'新建邮件模板',:source_lang=>'en')
    irm_mail_templates_new.permissions_tls.build(:language=>'en',:name=>'New Mail Template',:description=>'New Mail Template',:source_lang=>'en')
    irm_mail_templates_new.save

    irm_mail_templates_edit = Irm::Permission.new(:permission_code=>'IRM_TEMPLATES_EDIT',
                                                   :page_controller=>'irm/mail_templates',
                                                   :page_action=>'edit',
                                                   :not_auto_mult=>true)
    irm_mail_templates_edit.permissions_tls.build(:language=>'zh',:name=>'编辑邮件模板',:description=>'编辑邮件模板',:source_lang=>'en')
    irm_mail_templates_edit.permissions_tls.build(:language=>'en',:name=>'Edit Mail Template',:description=>'Edit Mail Template',:source_lang=>'en')
    irm_mail_templates_edit.save

    irm_mail_templates_create = Irm::Permission.new(:permission_code=>'IRM_TEMPLATES_CREATE',
                                                   :page_controller=>'irm/mail_templates',
                                                   :page_action=>'create',
                                                   :not_auto_mult=>true)
    irm_mail_templates_create.permissions_tls.build(:language=>'zh',:name=>'保存邮件模板',:description=>'保存邮件模板',:source_lang=>'en')
    irm_mail_templates_create.permissions_tls.build(:language=>'en',:name=>'Create Mail Template',:description=>'Create Mail Template',:source_lang=>'en')
    irm_mail_templates_create.save

    irm_mail_templates_update = Irm::Permission.new(:permission_code=>'IRM_TEMPLATES_UPDATE',
                                                   :page_controller=>'irm/mail_templates',
                                                   :page_action=>'update',
                                                   :not_auto_mult=>true)
    irm_mail_templates_update.permissions_tls.build(:language=>'zh',:name=>'更新邮件模板',:description=>'更新邮件模板',:source_lang=>'en')
    irm_mail_templates_update.permissions_tls.build(:language=>'en',:name=>'Update Mail Template',:description=>'Update Mail Template',:source_lang=>'en')
    irm_mail_templates_update.save

    irm_mail_templates_lang_edit = Irm::Permission.new(:permission_code=>'IRM_TEMPLATES_LANG_EDIT',
                                                   :page_controller=>'irm/mail_templates',
                                                   :page_action=>'multilingual_edit',
                                                   :not_auto_mult=>true)
    irm_mail_templates_lang_edit.permissions_tls.build(:language=>'zh',:name=>'编辑邮件模板多语言',:description=>'编辑邮件模板多语言',:source_lang=>'en')
    irm_mail_templates_lang_edit.permissions_tls.build(:language=>'en',:name=>'Edit Mail Template Lang',:description=>'Edit Mail Template Lang',:source_lang=>'en')
    irm_mail_templates_lang_edit.save


    irm_mail_templates_lang_update = Irm::Permission.new(:permission_code=>'IRM_TEMPLATES_LANG_UPDATE',
                                                   :page_controller=>'irm/mail_templates',
                                                   :page_action=>'multilingual_update',
                                                   :not_auto_mult=>true)
    irm_mail_templates_lang_update.permissions_tls.build(:language=>'zh',:name=>'更新邮件模板多语言',:description=>'更新邮件模板多语言',:source_lang=>'en')
    irm_mail_templates_lang_update.permissions_tls.build(:language=>'en',:name=>'Update Mail Template Lang',:description=>'Update Mail Template Lang',:source_lang=>'en')
    irm_mail_templates_lang_update.save

    irm_mail_templates_get_data = Irm::Permission.new(:permission_code=>'IRM_TEMPLATES_GET_DATA',
                                                   :page_controller=>'irm/mail_templates',
                                                   :page_action=>'get_data',
                                                   :not_auto_mult=>true)
    irm_mail_templates_get_data.permissions_tls.build(:language=>'zh',:name=>'获取邮件模板',:description=>'获取邮件模板',:source_lang=>'en')
    irm_mail_templates_get_data.permissions_tls.build(:language=>'en',:name=>'Get Mail Template',:description=>'Get Mail Template',:source_lang=>'en')
    irm_mail_templates_get_data.save
  end

  def self.down
    #
    lookup_types_permissions=Irm::Permission.query_by_page_controller("irm/mail_templates")
    lookup_types_permissions.each do |permission|
       language_permissions=Irm::PermissionsTl.query_by_permission_id(permission.id)
       language_permissions.each do |language_permission|
          language_permission.delete
       end
       permission.delete
    end
  end
end
