# -*- coding: utf-8 -*-
class AddLooupValueMenu < ActiveRecord::Migration
  def self.up
    delete_entry = Irm::MenuEntry.where(:menu_code =>"IRM_COMMON_SETTING_MENU",:permission_code=>'IRM_LOOKUP_TYPES_INDEX').first
    delete_entry.destroy

    lookup_setting_menu = Irm::Menu.new(:menu_code=>'IRM_LOOKUP_SETTING_MENU',:leaf_flag=>"Y",:not_auto_mult=>true)
    lookup_setting_menu.menus_tls.build(:language=>'zh',:name=>'快速编码菜单',:description=>'快速编码菜单',:source_lang=>'en')
    lookup_setting_menu.menus_tls.build(:language=>'en',:name=>'Lookup code Menu',:description=>'Lookup code Menu',:source_lang=>'en')
    lookup_setting_menu.save

    common_setting_lookup = Irm::MenuEntry.new(:menu_code=>'IRM_COMMON_SETTING_MENU',
                                         :sub_menu_code=>'IRM_LOOKUP_SETTING_MENU',
                                         :display_sequence=>50,
                                         :not_auto_mult=>true)
    common_setting_lookup.menu_entries_tls.build(:language=>'zh',:name=>'快速编码',:description=>'快速编码',:source_lang=>'en')
    common_setting_lookup.menu_entries_tls.build(:language=>'en',:name=>'Lookup',:description=>'Lookup code',:source_lang=>'en')
    common_setting_lookup.save

    lookup_lookup_type = Irm::MenuEntry.new(:menu_code=>'IRM_LOOKUP_SETTING_MENU',
                                         :permission_code=>'IRM_LOOKUP_TYPES_INDEX',
                                         :display_sequence=>10,
                                         :not_auto_mult=>true)
    lookup_lookup_type.menu_entries_tls.build(:language=>'zh',:name=>'快速编码类型',:description=>'快速编码类型',:source_lang=>'en')
    lookup_lookup_type.menu_entries_tls.build(:language=>'en',:name=>'Lookup Type',:description=>'Lookup Code',:source_lang=>'en')
    lookup_lookup_type.save

    lookup_lookup_value = Irm::MenuEntry.new(:menu_code=>'IRM_LOOKUP_SETTING_MENU',
                                         :permission_code=>'IRM_LOOKUP_VALUES_INDEX',
                                         :display_sequence=>20,
                                         :not_auto_mult=>true)
    lookup_lookup_value.menu_entries_tls.build(:language=>'zh',:name=>'快速编码值',:description=>'快速编码值',:source_lang=>'en')
    lookup_lookup_value.menu_entries_tls.build(:language=>'en',:name=>'Lookup Value',:description=>'Lookup Value',:source_lang=>'en')
    lookup_lookup_value.save
  end

  def self.down
  end
end
