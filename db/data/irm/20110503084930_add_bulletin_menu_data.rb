# -*- coding: utf-8 -*-
class AddBulletinMenuData < ActiveRecord::Migration
  def self.up
    irm_menu_entiry_111= Irm::MenuEntry.new(:menu_code=>'HOME',:sub_menu_code=>nil,:page_controller=>'irm/bulletins',:display_sequence=>50,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_111.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'公告',:description=>'公告')
    irm_menu_entiry_111.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Bulletin',:description=>'Bulletin')
    irm_menu_entiry_111.save
  end

  def self.down
  end
end
