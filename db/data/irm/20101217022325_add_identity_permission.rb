# -*- coding: utf-8 -*-
class AddIdentityPermission < ActiveRecord::Migration
  def self.up
    irm_identities_index = Irm::Permission.new(:permission_code=>'IRM_IDENTITIES_INDEX',
                                             :page_controller=>'irm/identities',
                                             :page_action=>'index',
                                             :not_auto_mult=>true)
    irm_identities_index.permissions_tls.build(:language=>'zh',:name=>'帐号首页',:description=>'帐号首页',:source_lang=>'en')
    irm_identities_index.permissions_tls.build(:language=>'en',:name=>'Identity index',:description=>'Identity index',:source_lang=>'en')
    irm_identities_index.save

    irm_identities_show = Irm::Permission.new(:permission_code=>'IRM_IDENTITIES_SHOW',
                                             :page_controller=>'irm/identities',
                                             :page_action=>'show',
                                             :not_auto_mult=>true)
    irm_identities_show.permissions_tls.build(:language=>'zh',:name=>'查看帐号',:description=>'系统页面入口',:source_lang=>'en')
    irm_identities_show.permissions_tls.build(:language=>'en',:name=>'View identity',:description=>'View identity',:source_lang=>'en')
    irm_identities_show.save

    irm_identities_new = Irm::Permission.new(:permission_code=>'IRM_IDENTITIES_NEW',
                                             :page_controller=>'irm/identities',
                                             :page_action=>'new',
                                             :not_auto_mult=>true)
    irm_identities_new.permissions_tls.build(:language=>'zh',:name=>'新建帐号',:description=>'新建帐号',:source_lang=>'en')
    irm_identities_new.permissions_tls.build(:language=>'en',:name=>'New identity',:description=>'New identity',:source_lang=>'en')
    irm_identities_new.save

    irm_identities_edit = Irm::Permission.new(:permission_code=>'IRM_IDENTITIES_EDIT',
                                             :page_controller=>'irm/identities',
                                             :page_action=>'edit',
                                             :not_auto_mult=>true)
    irm_identities_edit.permissions_tls.build(:language=>'zh',:name=>'编辑帐号',:description=>'编辑帐号',:source_lang=>'en')
    irm_identities_edit.permissions_tls.build(:language=>'en',:name=>'Edit identity',:description=>'Edit identity',:source_lang=>'en')
    irm_identities_edit.save

    irm_identities_create = Irm::Permission.new(:permission_code=>'IRM_IDENTITIES_CREATE',
                                             :page_controller=>'irm/identities',
                                             :page_action=>'create',
                                             :status_code=>'OFFLINE',
                                             :not_auto_mult=>true)
    irm_identities_create.permissions_tls.build(:language=>'zh',:name=>'创建帐号',:description=>'创建帐号',:source_lang=>'en')
    irm_identities_create.permissions_tls.build(:language=>'en',:name=>'Create identity',:description=>'Create identity',:source_lang=>'en')
    irm_identities_create.save

    irm_identities_update = Irm::Permission.new(:permission_code=>'IRM_IDENTITIES_UPDATE',
                                             :page_controller=>'irm/identities',
                                             :page_action=>'update',
                                             :status_code=>'OFFLINE',
                                             :not_auto_mult=>true)
    irm_identities_update.permissions_tls.build(:language=>'zh',:name=>'更新帐号',:description=>'更新帐号',:source_lang=>'en')
    irm_identities_update.permissions_tls.build(:language=>'en',:name=>'Update identity',:description=>'Update identity',:source_lang=>'en')
    irm_identities_update.save

    irm_identities_destroy = Irm::Permission.new(:permission_code=>'IRM_IDENTITIES_DESTROY',
                                             :page_controller=>'irm/identities',
                                             :page_action=>'destroy',
                                             :not_auto_mult=>true)
    irm_identities_destroy.permissions_tls.build(:language=>'zh',:name=>'删除帐号',:description=>'删除帐号',:source_lang=>'en')
    irm_identities_destroy.permissions_tls.build(:language=>'en',:name=>'Destroy identity',:description=>'Destroy identity',:source_lang=>'en')
    irm_identities_destroy.save

    irm_identities_get_data = Irm::Permission.new(:permission_code=>'IRM_IDENTITIES_GET_DATA',
                                             :page_controller=>'irm/identities',
                                             :page_action=>'get_data',
                                             :status_code=>'OFFLINE',
                                             :not_auto_mult=>true)
    irm_identities_get_data.permissions_tls.build(:language=>'zh',:name=>'取得Identity数据',:description=>'取得Identity数据',:source_lang=>'en')
    irm_identities_get_data.permissions_tls.build(:language=>'en',:name=>'Get identity data',:description=>'Get identity data',:source_lang=>'en')
    irm_identities_get_data.save

    irm_identities_my_info = Irm::Permission.new(:permission_code=>'IRM_IDENTITIES_MY_INFO',
                                             :page_controller=>'irm/identities',
                                             :page_action=>'my_info',
                                             :status_code=>'OFFLINE',
                                             :not_auto_mult=>true)
    irm_identities_my_info.permissions_tls.build(:language=>'zh',:name=>'查看个人信息',:description=>'查看个人信息',:source_lang=>'en')
    irm_identities_my_info.permissions_tls.build(:language=>'en',:name=>'Personal information',:description=>'Personal information',:source_lang=>'en')
    irm_identities_my_info.save

    irm_identities_edit_info = Irm::Permission.new(:permission_code=>'IRM_IDENTITIES_EDIT_INFO',
                                             :page_controller=>'irm/identities',
                                             :page_action=>'edit_info',
                                             :status_code=>'OFFLINE',
                                             :not_auto_mult=>true)
    irm_identities_edit_info.permissions_tls.build(:language=>'zh',:name=>'编辑个人信息',:description=>'编辑个人信息',:source_lang=>'en')
    irm_identities_edit_info.permissions_tls.build(:language=>'en',:name=>'Edit personal info',:description=>'Edit personal info',:source_lang=>'en')
    irm_identities_edit_info.save

    irm_identities_update_info = Irm::Permission.new(:permission_code=>'IRM_IDENTITIES_UPDATE_INFO',
                                             :page_controller=>'irm/identities',
                                             :page_action=>'update_info',
                                             :status_code=>'OFFLINE',
                                             :not_auto_mult=>true)
    irm_identities_update_info.permissions_tls.build(:language=>'zh',:name=>'更新个人信息',:description=>'更新个人信息',:source_lang=>'en')
    irm_identities_update_info.permissions_tls.build(:language=>'en',:name=>'Update personal info',:description=>'Update personal info',:source_lang=>'en')
    irm_identities_update_info.save 

    irm_identities_edit_password = Irm::Permission.new(:permission_code=>'IRM_IDENTITIES_EDIT_PASSWORD',
                                             :page_controller=>'irm/identities',
                                             :page_action=>'edit_password',
                                             :status_code=>'OFFLINE',
                                             :not_auto_mult=>true)
    irm_identities_edit_password.permissions_tls.build(:language=>'zh',:name=>'编辑个人密码',:description=>'编辑个人密码',:source_lang=>'en')
    irm_identities_edit_password.permissions_tls.build(:language=>'en',:name=>'Edit password',:description=>'Edit password',:source_lang=>'en')
    irm_identities_edit_password.save

    irm_identities_update_password = Irm::Permission.new(:permission_code=>'IRM_IDENTITIES_UPDATE_PASSWORD',
                                             :page_controller=>'irm/identities',
                                             :page_action=>'update_password',
                                             :status_code=>'OFFLINE',
                                             :not_auto_mult=>true)
    irm_identities_update_password.permissions_tls.build(:language=>'zh',:name=>'更新个人密码',:description=>'更新个人密码',:source_lang=>'en')
    irm_identities_update_password.permissions_tls.build(:language=>'en',:name=>'Update password',:description=>'Update password',:source_lang=>'en')
    irm_identities_update_password.save
   

  end

  def self.down
  end
end
