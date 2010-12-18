# -*- coding: utf-8 -*-
class AddLoginRecordsPermission < ActiveRecord::Migration
  def self.up
    irm_login_records_index = Irm::Permission.new(:permission_code=>'IRM_LOGIN_RECORDS_INDEX',
                                             :page_controller=>'irm/login_records',
                                             :page_action=>'index',
                                             :not_auto_mult=>true)
    irm_login_records_index.permissions_tls.build(:language=>'zh',:name=>'用户登录历史',:description=>'用户登录历史',:source_lang=>'en')
    irm_login_records_index.permissions_tls.build(:language=>'en',:name=>'User login records',:description=>'User login records',:source_lang=>'en')
    irm_login_records_index.save

    irm_identities_get_data = Irm::Permission.new(:permission_code=>'IRM_LOGIN_RECORDS_GET_DATA',
                                             :page_controller=>'irm/login_records',
                                             :page_action=>'get_data',
                                             :status_code=>'OFFLINE',
                                             :not_auto_mult=>true)
    irm_identities_get_data.permissions_tls.build(:language=>'zh',:name=>'用户登录数据',:description=>'用户登录数据',:source_lang=>'en')
    irm_identities_get_data.permissions_tls.build(:language=>'en',:name=>'Login record data',:description=>'Login record data',:source_lang=>'en')
    irm_identities_get_data.save

    public_login_record = Irm::MenuEntry.new(:menu_code=>'IRM_PUBLIC_MENU',
                                         :permission_code=>'IRM_LOGIN_RECORDS_INDEX',
                                         :display_sequence=>30,
                                         :not_auto_mult=>true)
    public_login_record.menu_entries_tls.build(:language=>'zh',:name=>'用户登录历史',:description=>'用户登录历史',:source_lang=>'en')
    public_login_record.menu_entries_tls.build(:language=>'en',:name=>'User login records',:description=>'User login records',:source_lang=>'en')
    public_login_record.save
  end

  def self.down
  end
end
