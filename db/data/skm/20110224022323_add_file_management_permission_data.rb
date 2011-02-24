# -*- coding: utf-8 -*-
class AddFileManagementPermissionData < ActiveRecord::Migration
  def self.up
    skm_file_managements_index= Irm::Permission.new(:permission_code=>'SKM_FILE_MANAGEMENTS_INDEX',:page_controller=>'skm/file_managements',:page_action=>'index',:not_auto_mult=>true)
    skm_file_managements_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    skm_file_managements_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    skm_file_managements_index.save
    skm_file_managements_edit= Irm::Permission.new(:permission_code=>'SKM_FILE_MANAGEMENTS_EDIT',:page_controller=>'skm/file_managements',:page_action=>'edit',:not_auto_mult=>true)
    skm_file_managements_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    skm_file_managements_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    skm_file_managements_edit.save
    skm_file_managements_update= Irm::Permission.new(:permission_code=>'SKM_FILE_MANAGEMENTS_UPDATE',:page_controller=>'skm/file_managements',:page_action=>'update',:not_auto_mult=>true)
    skm_file_managements_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    skm_file_managements_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    skm_file_managements_update.save
    skm_file_managements_new= Irm::Permission.new(:permission_code=>'SKM_FILE_MANAGEMENTS_NEW',:page_controller=>'skm/file_managements',:page_action=>'new',:not_auto_mult=>true)
    skm_file_managements_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    skm_file_managements_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    skm_file_managements_new.save
    skm_file_managements_bt_new= Irm::Permission.new(:permission_code=>'SKM_FILE_MANAGEMENTS_BT_NEW',:page_controller=>'skm/file_managements',:page_action=>'batch_new',:not_auto_mult=>true)
    skm_file_managements_bt_new.permissions_tls.build(:language=>'zh',:name=>'批量创建',:description=>'批量创建',:source_lang=>'en')
    skm_file_managements_bt_new.permissions_tls.build(:language=>'en',:name=>'Batch New',:description=>'Batch New',:source_lang=>'en')
    skm_file_managements_bt_new.save
    skm_file_managements_create= Irm::Permission.new(:permission_code=>'SKM_FILE_MANAGEMENTS_CREATE',:page_controller=>'skm/file_managements',:page_action=>'create',:not_auto_mult=>true)
    skm_file_managements_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    skm_file_managements_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    skm_file_managements_create.save
    skm_file_managements_bt_create= Irm::Permission.new(:permission_code=>'SKM_FILE_MANAGEMENTS_BT_CREATE',:page_controller=>'skm/file_managements',:page_action=>'batch_create',:not_auto_mult=>true)
    skm_file_managements_bt_create.permissions_tls.build(:language=>'zh',:name=>'批量创建',:description=>'批量创建',:source_lang=>'en')
    skm_file_managements_bt_create.permissions_tls.build(:language=>'en',:name=>'Batch New',:description=>'Batch New',:source_lang=>'en')
    skm_file_managements_bt_create.save
    skm_file_managements_get_data= Irm::Permission.new(:permission_code=>'SKM_FILE_MANAGEMENTS_GET_DATA',:page_controller=>'skm/file_managements',:page_action=>'get_data',:not_auto_mult=>true)
    skm_file_managements_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    skm_file_managements_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    skm_file_managements_get_data.save
    skm_file_managements_show= Irm::Permission.new(:permission_code=>'SKM_FILE_MANAGEMENTS_SHOW',:page_controller=>'skm/file_managements',:page_action=>'show',:not_auto_mult=>true)
    skm_file_managements_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    skm_file_managements_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    skm_file_managements_show.save
    skm_file_managements_destroy= Irm::Permission.new(:permission_code=>'SKM_FILE_MANAGEMENTS_DESTROY',:page_controller=>'skm/file_managements',:page_action=>'destroy',:not_auto_mult=>true)
    skm_file_managements_destroy.permissions_tls.build(:language=>'zh',:name=>'删除',:description=>'删除',:source_lang=>'en')
    skm_file_managements_destroy.permissions_tls.build(:language=>'en',:name=>'Destroy',:description=>'Destroy',:source_lang=>'en')
    skm_file_managements_destroy.save
    skm_file_managements_get_v_files= Irm::Permission.new(:permission_code=>'SKM_FILE_MANAGEMENTS_GET_V_FILES',:page_controller=>'skm/file_managements',:page_action=>'get_version_files',:not_auto_mult=>true)
    skm_file_managements_get_v_files.permissions_tls.build(:language=>'zh',:name=>'取得文件版本数据',:description=>'取得文件版本数据',:source_lang=>'en')
    skm_file_managements_get_v_files.permissions_tls.build(:language=>'en',:name=>'Get Version Files',:description=>'Get Version Files',:source_lang=>'en')
    skm_file_managements_get_v_files.save
  end

  def self.down
  end
end
