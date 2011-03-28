class InitSkmSettingMenu < ActiveRecord::Migration
  def self.up
    skm_menu_entiry_101= Irm::MenuEntry.new(:menu_code=>'SKM_ADMIN_GENERAL_MENU',:sub_menu_code=>nil,:page_controller=>'skm/settings',:display_sequence=>40,:display_flag=>'Y',:not_auto_mult=>true)
    skm_menu_entiry_101.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'知识库设置',:description=>'知识库设置')
    skm_menu_entiry_101.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'SKM Settings',:description=>'SKM Settings')
    skm_menu_entiry_101.save
  end

  def self.down
  end
end
