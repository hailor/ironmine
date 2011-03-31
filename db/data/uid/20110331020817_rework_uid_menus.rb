# -*- coding: utf-8 -*-
class ReworkUidMenus < ActiveRecord::Migration
  def self.up
    deleteable_menus = Irm::Menu.where("#{Irm::Menu.table_name}.menu_code IN (?)",["UID_GLOBAL_MANAGEMENT_MENU","UID_ORG_STRUCTURE_MENU","UID_PEOPLE_MENU","IRM_USER_MANAGE_MENU"])
    deleteable_menus.each do |dm|
      dm.delete
    end


    deleteable_menuentries = Irm::MenuEntry.where("#{Irm::MenuEntry.table_name}.menu_code IN (?) OR #{Irm::MenuEntry.table_name}.sub_menu_code IN (?)",["UID_GLOBAL_MANAGEMENT_MENU","UID_ORG_STRUCTURE_MENU","UID_PEOPLE_MENU","IRM_USER_MANAGE_MENU"],["UID_GLOBAL_MANAGEMENT_MENU","UID_ORG_STRUCTURE_MENU","UID_PEOPLE_MENU","IRM_USER_MANAGE_MENU"])

    deleteable_menuentries.each do |dm|
      dm.delete
    end

    uid_uid_global_management_menu= Irm::Menu.new(:menu_code=>'UID_GLOBAL_MANAGEMENT_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    uid_uid_global_management_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'统一用户管理',:description=>'统一用户管理菜单')
    uid_uid_global_management_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Global User Management',:description=>'Global User Management Menu')
    uid_uid_global_management_menu.save
    uid_uid_org_structure_menu= Irm::Menu.new(:menu_code=>'UID_ORG_STRUCTURE_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    uid_uid_org_structure_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'统一用户',:description=>'统一用户')
    uid_uid_org_structure_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Global User',:description=>'Global User')
    uid_uid_org_structure_menu.save
    uid_uid_external_user_menu= Irm::Menu.new(:menu_code=>'UID_EXTERNAL_USER_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    uid_uid_external_user_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'外部登录用户',:description=>'外部登录用户')
    uid_uid_external_user_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'External Login User',:description=>'External Login User')
    uid_uid_external_user_menu.save


     uid_menu_entiry_100= Irm::MenuEntry.new(:menu_code=>'UID_GLOBAL_MANAGEMENT_MENU',:sub_menu_code=>'UID_ORG_STRUCTURE_MENU',:page_controller=>nil,:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
     uid_menu_entiry_100.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'统一用户',:description=>'统一用户')
     uid_menu_entiry_100.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Global User',:description=>'Global User')
     uid_menu_entiry_100.save
     uid_menu_entiry_101= Irm::MenuEntry.new(:menu_code=>'UID_ORG_STRUCTURE_MENU',:sub_menu_code=>nil,:page_controller=>'uid/system_user_home',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
     uid_menu_entiry_101.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'统一用户',:description=>'统一用户')
     uid_menu_entiry_101.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Global User',:description=>'Global User')
     uid_menu_entiry_101.save
     uid_menu_entiry_102= Irm::MenuEntry.new(:menu_code=>'UID_ORG_STRUCTURE_MENU',:sub_menu_code=>nil,:page_controller=>'irm/people',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
     uid_menu_entiry_102.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'人员',:description=>'人员')
     uid_menu_entiry_102.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'People',:description=>'People')
     uid_menu_entiry_102.save
     uid_menu_entiry_103= Irm::MenuEntry.new(:menu_code=>'UID_ORG_STRUCTURE_MENU',:sub_menu_code=>nil,:page_controller=>'irm/companies',:display_sequence=>30,:display_flag=>'Y',:not_auto_mult=>true)
     uid_menu_entiry_103.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'公司',:description=>'公司')
     uid_menu_entiry_103.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Company',:description=>'Company')
     uid_menu_entiry_103.save
     uid_menu_entiry_104= Irm::MenuEntry.new(:menu_code=>'UID_ORG_STRUCTURE_MENU',:sub_menu_code=>nil,:page_controller=>'irm/organizations',:display_sequence=>40,:display_flag=>'Y',:not_auto_mult=>true)
     uid_menu_entiry_104.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'组织',:description=>'组织')
     uid_menu_entiry_104.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Organization',:description=>'Organization')
     uid_menu_entiry_104.save
     uid_menu_entiry_105= Irm::MenuEntry.new(:menu_code=>'UID_ORG_STRUCTURE_MENU',:sub_menu_code=>nil,:page_controller=>'irm/departments',:display_sequence=>50,:display_flag=>'Y',:not_auto_mult=>true)
     uid_menu_entiry_105.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'部门',:description=>'部门')
     uid_menu_entiry_105.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Department',:description=>'Department')
     uid_menu_entiry_105.save
     uid_menu_entiry_106= Irm::MenuEntry.new(:menu_code=>'UID_ORG_STRUCTURE_MENU',:sub_menu_code=>nil,:page_controller=>'uid/login_mappings',:display_sequence=>45,:display_flag=>'Y',:not_auto_mult=>true)
     uid_menu_entiry_106.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'匹配用户',:description=>'匹配用户')
     uid_menu_entiry_106.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Mapping User',:description=>'Mapping User')
     uid_menu_entiry_106.save
     uid_menu_entiry_107= Irm::MenuEntry.new(:menu_code=>'UID_ORG_STRUCTURE_MENU',:sub_menu_code=>nil,:page_controller=>'irm/company_accesses',:display_sequence=>50,:display_flag=>'N',:not_auto_mult=>true)
     uid_menu_entiry_107.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'人员访问公司限制',:description=>'人员访问公司限制')
     uid_menu_entiry_107.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Company Access',:description=>'Company Access')
     uid_menu_entiry_107.save
     uid_menu_entiry_108= Irm::MenuEntry.new(:menu_code=>'UID_GLOBAL_MANAGEMENT_MENU',:sub_menu_code=>'UID_EXTERNAL_USER_MENU',:page_controller=>nil,:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
     uid_menu_entiry_108.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'外部登录用户',:description=>'外部登录用户')
     uid_menu_entiry_108.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'External System User',:description=>'External System User')
     uid_menu_entiry_108.save
     uid_menu_entiry_109= Irm::MenuEntry.new(:menu_code=>'UID_EXTERNAL_USER_MENU',:sub_menu_code=>nil,:page_controller=>'uid/external_user_home',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
     uid_menu_entiry_109.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'外部登录用户',:description=>'外部登录用户')
     uid_menu_entiry_109.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'External System User',:description=>'External System User')
     uid_menu_entiry_109.save
     uid_menu_entiry_110= Irm::MenuEntry.new(:menu_code=>'UID_EXTERNAL_USER_MENU',:sub_menu_code=>nil,:page_controller=>'uid/external_systems',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
     uid_menu_entiry_110.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'外部系统',:description=>'外部系统')
     uid_menu_entiry_110.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'External System',:description=>'External System')
     uid_menu_entiry_110.save
     uid_menu_entiry_111= Irm::MenuEntry.new(:menu_code=>'UID_EXTERNAL_USER_MENU',:sub_menu_code=>nil,:page_controller=>'uid/external_logins',:display_sequence=>30,:display_flag=>'Y',:not_auto_mult=>true)
     uid_menu_entiry_111.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'外部 Login ID',:description=>'外部 Login ID')
     uid_menu_entiry_111.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'External Login ID',:description=>'External Login ID')
     uid_menu_entiry_111.save
     uid_menu_entiry_112= Irm::MenuEntry.new(:menu_code=>'UID_EXTERNAL_USER_MENU',:sub_menu_code=>nil,:page_controller=>'uid/auto_mappings',:display_sequence=>40,:display_flag=>'Y',:not_auto_mult=>true)
     uid_menu_entiry_112.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'自动匹配',:description=>'自动匹配')
     uid_menu_entiry_112.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Auto Mapping',:description=>'Auto Mapping')
     uid_menu_entiry_112.save
     uid_menu_entiry_113= Irm::MenuEntry.new(:menu_code=>'UID_EXTERNAL_USER_MENU',:sub_menu_code=>nil,:page_controller=>'uid/import_files',:display_sequence=>50,:display_flag=>'Y',:not_auto_mult=>true)
     uid_menu_entiry_113.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'导入文件',:description=>'导入文件')
     uid_menu_entiry_113.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Import Files',:description=>'Import Files')
     uid_menu_entiry_113.save    

  end

  def self.down
  end
end
