# -*- coding: utf-8 -*-
class AddFlexValueMenuData < ActiveRecord::Migration
  def self.up
    flex_value_index_page = Irm::MenuEntry.new(:menu_code=>'IRM_COMMON_SETTING_MENU',
                                         :permission_code=>'IRM_FLEX_VALUES_INDEX',
                                         :display_sequence=>75,
                                         :not_auto_mult=>true)
    flex_value_index_page.menu_entries_tls.build(:language=>'zh',:name=>'值集的值',:description=>'值集的值',:source_lang=>'en')
    flex_value_index_page.menu_entries_tls.build(:language=>'en',:name=>'Flex Values',:description=>'Flex Values',:source_lang=>'en')
    flex_value_index_page.save    
  end

  def self.down
  end
end
