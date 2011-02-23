class AddGeneralCategoryMenu < ActiveRecord::Migration
  def self.up
    irm_menu_entiry_91= Irm::MenuEntry.new(:menu_code=>'IRM_COMMON_SETTING_MENU',:sub_menu_code=>nil,:permission_code=>'IRM_GENERAL_CATEGORIES_INDEX',:display_sequence=>7,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_91.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'公用分类',:description=>'公用分类')
    irm_menu_entiry_91.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'General category',:description=>'General category')
    irm_menu_entiry_91.save
  end

  def self.down
  end
end
