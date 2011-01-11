# -*- coding: utf-8 -*-
class AddSettingCommonMenu < ActiveRecord::Migration
  def self.up
    setting_common = Irm::MenuEntry.new(:menu_code=>'IRM_SETTING_ENTRANCE_MENU',
                                         :permission_code=>'IRM_SETTING_COMMON',
                                         :display_flag => "N",
                                         :display_sequence=>100,
                                         :not_auto_mult=>true)
    setting_common.menu_entries_tls.build(:language=>'zh',:name=>'设置公用页面',:description=>'设置公用页面',:source_lang=>'en')
    setting_common.menu_entries_tls.build(:language=>'en',:name=>'Setting Common',:description=>'Setting Common',:source_lang=>'en')
    setting_common.save
  end

  def self.down
  end
end
