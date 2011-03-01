# -*- coding: utf-8 -*-
class InitIrmLocationMenuData < ActiveRecord::Migration
  def self.up
    location_89= Irm::MenuEntry.new(:menu_code=>'IRM_ORGANIZATION_STRUCT_MENU',:sub_menu_code=>nil,
                                    :permission_code=>'IRM_LOCATIONS_INDEX',:display_sequence=>70,:display_flag=>'N',:not_auto_mult=>true)
    location_89.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'位置',:description=>'位置')
    location_89.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Location',:description=>'Location')
    location_89.save
  end

  def self.down
  end
end
