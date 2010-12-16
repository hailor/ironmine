class AddGlobalSettingPermissions < ActiveRecord::Migration
  def self.up
    irm_global_settings_index = Irm::Permission.new(:permission_code=>'IRM_GLOBAL_SETTINGS_INDEX',
                                             :page_controller=>'irm/global_settings',
                                             :page_action=>'index',
                                             :not_auto_mult=>true)
    irm_global_settings_index.permissions_tls.build(:language=>'zh',:name=>'全局设置',:description=>'全局设置',:source_lang=>'en')
    irm_global_settings_index.permissions_tls.build(:language=>'en',:name=>'Global Settings',:description=>'Global Settings',:source_lang=>'en')
    irm_global_settings_index.save
  end

  def self.down
  end
end
