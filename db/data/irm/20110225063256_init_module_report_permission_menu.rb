class InitModuleReportPermissionMenu < ActiveRecord::Migration
  def self.up
    irm_reports_create= Irm::Permission.new(:permission_code=>'IRM_REPORTS_CREATE',:page_controller=>'irm/reports',:page_action=>'create',:not_auto_mult=>true)
    irm_reports_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_reports_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_reports_create.save
    irm_reports_edit= Irm::Permission.new(:permission_code=>'IRM_REPORTS_EDIT',:page_controller=>'irm/reports',:page_action=>'edit',:not_auto_mult=>true)
    irm_reports_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_reports_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_reports_edit.save
    irm_reports_get_data= Irm::Permission.new(:permission_code=>'IRM_REPORTS_GET_DATA',:page_controller=>'irm/reports',:page_action=>'get_data',:not_auto_mult=>true)
    irm_reports_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    irm_reports_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    irm_reports_get_data.save
    irm_reports_index= Irm::Permission.new(:permission_code=>'IRM_REPORTS_INDEX',:page_controller=>'irm/reports',:page_action=>'index',:not_auto_mult=>true)
    irm_reports_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    irm_reports_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    irm_reports_index.save
    irm_reports_mtl_edit= Irm::Permission.new(:permission_code=>'IRM_REPORTS_MTL_EDIT',:page_controller=>'irm/reports',:page_action=>'multilingual_site_edit',:not_auto_mult=>true)
    irm_reports_mtl_edit.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_reports_mtl_edit.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_reports_mtl_edit.save
    irm_reports_mtl_update= Irm::Permission.new(:permission_code=>'IRM_REPORTS_MTL_UPDATE',:page_controller=>'irm/reports',:page_action=>'multilingual_site_update',:not_auto_mult=>true)
    irm_reports_mtl_update.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_reports_mtl_update.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_reports_mtl_update.save
    irm_reports_new= Irm::Permission.new(:permission_code=>'IRM_REPORTS_NEW',:page_controller=>'irm/reports',:page_action=>'new',:not_auto_mult=>true)
    irm_reports_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_reports_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_reports_new.save
    irm_reports_show= Irm::Permission.new(:permission_code=>'IRM_REPORTS_SHOW',:page_controller=>'irm/reports',:page_action=>'show',:not_auto_mult=>true)
    irm_reports_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    irm_reports_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    irm_reports_show.save
    irm_reports_update= Irm::Permission.new(:permission_code=>'IRM_REPORTS_UPDATE',:page_controller=>'irm/reports',:page_action=>'update',:not_auto_mult=>true)
    irm_reports_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_reports_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_reports_update.save
    irm_report_groups_create= Irm::Permission.new(:permission_code=>'IRM_REPORT_GROUPS_CREATE',:page_controller=>'irm/report_groups',:page_action=>'create',:not_auto_mult=>true)
    irm_report_groups_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_report_groups_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_report_groups_create.save
    irm_report_groups_edit= Irm::Permission.new(:permission_code=>'IRM_REPORT_GROUPS_EDIT',:page_controller=>'irm/report_groups',:page_action=>'edit',:not_auto_mult=>true)
    irm_report_groups_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_report_groups_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_report_groups_edit.save
    irm_report_groups_get_data= Irm::Permission.new(:permission_code=>'IRM_REPORT_GROUPS_GET_DATA',:page_controller=>'irm/report_groups',:page_action=>'get_data',:not_auto_mult=>true)
    irm_report_groups_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    irm_report_groups_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    irm_report_groups_get_data.save
    irm_report_groups_index= Irm::Permission.new(:permission_code=>'IRM_REPORT_GROUPS_INDEX',:page_controller=>'irm/report_groups',:page_action=>'index',:not_auto_mult=>true)
    irm_report_groups_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    irm_report_groups_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    irm_report_groups_index.save
    irm_report_groups_mtl_edit= Irm::Permission.new(:permission_code=>'IRM_REPORT_GROUPS_MTL_EDIT',:page_controller=>'irm/report_groups',:page_action=>'multilingual_site_edit',:not_auto_mult=>true)
    irm_report_groups_mtl_edit.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_report_groups_mtl_edit.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_report_groups_mtl_edit.save
    irm_report_groups_mtl_update= Irm::Permission.new(:permission_code=>'IRM_REPORT_GROUPS_MTL_UPDATE',:page_controller=>'irm/report_groups',:page_action=>'multilingual_site_update',:not_auto_mult=>true)
    irm_report_groups_mtl_update.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_report_groups_mtl_update.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_report_groups_mtl_update.save
    irm_report_groups_new= Irm::Permission.new(:permission_code=>'IRM_REPORT_GROUPS_NEW',:page_controller=>'irm/report_groups',:page_action=>'new',:not_auto_mult=>true)
    irm_report_groups_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_report_groups_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_report_groups_new.save
    irm_report_groups_show= Irm::Permission.new(:permission_code=>'IRM_REPORT_GROUPS_SHOW',:page_controller=>'irm/report_groups',:page_action=>'show',:not_auto_mult=>true)
    irm_report_groups_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    irm_report_groups_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    irm_report_groups_show.save
    irm_report_groups_update= Irm::Permission.new(:permission_code=>'IRM_REPORT_GROUPS_UPDATE',:page_controller=>'irm/report_groups',:page_action=>'update',:not_auto_mult=>true)
    irm_report_groups_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_report_groups_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_report_groups_update.save
    irm_report_grp_mbrs_create= Irm::Permission.new(:permission_code=>'IRM_REPORT_GRP_MBRS_CREATE',:page_controller=>'irm/report_group_members',:page_action=>'create',:not_auto_mult=>true)
    irm_report_grp_mbrs_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_report_grp_mbrs_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_report_grp_mbrs_create.save
    irm_report_grp_mbrs_destroy= Irm::Permission.new(:permission_code=>'IRM_REPORT_GRP_MBRS_DESTROY',:page_controller=>'irm/report_group_members',:page_action=>'destroy',:not_auto_mult=>true)
    irm_report_grp_mbrs_destroy.permissions_tls.build(:language=>'zh',:name=>'删除',:description=>'删除',:source_lang=>'en')
    irm_report_grp_mbrs_destroy.permissions_tls.build(:language=>'en',:name=>'Destroy',:description=>'Destroy',:source_lang=>'en')
    irm_report_grp_mbrs_destroy.save
    irm_report_grp_mbrs_get_data= Irm::Permission.new(:permission_code=>'IRM_REPORT_GRP_MBRS_GET_DATA',:page_controller=>'irm/report_group_members',:page_action=>'get_data',:not_auto_mult=>true)
    irm_report_grp_mbrs_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    irm_report_grp_mbrs_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    irm_report_grp_mbrs_get_data.save
    irm_report_grp_mbrs_get_slt_dt= Irm::Permission.new(:permission_code=>'IRM_REPORT_GRP_MBRS_GET_SLT_DT',:page_controller=>'irm/report_group_members',:page_action=>'get_selectable_data',:not_auto_mult=>true)
    irm_report_grp_mbrs_get_slt_dt.permissions_tls.build(:language=>'zh',:name=>'取得报表数据',:description=>'取得报表数据',:source_lang=>'en')
    irm_report_grp_mbrs_get_slt_dt.permissions_tls.build(:language=>'en',:name=>'Get selectable report',:description=>'Get selectable report',:source_lang=>'en')
    irm_report_grp_mbrs_get_slt_dt.save
    irm_report_group_members_index= Irm::Permission.new(:permission_code=>'IRM_REPORT_GROUP_MEMBERS_INDEX',:page_controller=>'irm/report_group_members',:page_action=>'index',:not_auto_mult=>true)
    irm_report_group_members_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    irm_report_group_members_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    irm_report_group_members_index.save
    irm_report_group_members_new= Irm::Permission.new(:permission_code=>'IRM_REPORT_GROUP_MEMBERS_NEW',:page_controller=>'irm/report_group_members',:page_action=>'new',:not_auto_mult=>true)
    irm_report_group_members_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_report_group_members_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_report_group_members_new.save


    irm_irm_report_top_menu= Irm::Menu.new(:menu_code=>'IRM_REPORT_TOP_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_report_top_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'报表管理',:description=>'报表管理')
    irm_irm_report_top_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Report manage',:description=>'Report manage')
    irm_irm_report_top_menu.save
    irm_irm_report_group_menu= Irm::Menu.new(:menu_code=>'IRM_REPORT_GROUP_MENU',:leaf_flag=>'Y',:not_auto_mult=>true)
    irm_irm_report_group_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'报表组',:description=>'报表组')
    irm_irm_report_group_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Report group',:description=>'Report group')
    irm_irm_report_group_menu.save

    irm_menu_entiry_39= Irm::MenuEntry.new(:menu_code=>'IRM_BASE_SETTING_MENU',:sub_menu_code=>'IRM_REPORT_TOP_MENU',:permission_code=>nil,:display_sequence=>40,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_39.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'报表管理',:description=>'报表管理')
    irm_menu_entiry_39.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Report manage',:description=>'Report manage')
    irm_menu_entiry_39.save
    irm_menu_entiry_40= Irm::MenuEntry.new(:menu_code=>'IRM_REPORT_TOP_MENU',:sub_menu_code=>'IRM_REPORT_GROUP_MENU',:permission_code=>nil,:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_40.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'报表组',:description=>'报表组')
    irm_menu_entiry_40.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Report group',:description=>'Report group')
    irm_menu_entiry_40.save
    irm_menu_entiry_41= Irm::MenuEntry.new(:menu_code=>'IRM_REPORT_GROUP_MENU',:sub_menu_code=>nil,:permission_code=>'IRM_REPORT_GROUPS_INDEX',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_41.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'报表组',:description=>'报表组')
    irm_menu_entiry_41.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Report group',:description=>'Report group')
    irm_menu_entiry_41.save
    irm_menu_entiry_42= Irm::MenuEntry.new(:menu_code=>'IRM_REPORT_GROUP_MENU',:sub_menu_code=>nil,:permission_code=>'IRM_REPORT_GROUP_MEMBERS_INDEX',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_42.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'报表组成员',:description=>'报表组成员')
    irm_menu_entiry_42.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Report group member',:description=>'Report group member')
    irm_menu_entiry_42.save
    irm_menu_entiry_43= Irm::MenuEntry.new(:menu_code=>'IRM_REPORT_TOP_MENU',:sub_menu_code=>nil,:permission_code=>'IRM_REPORTS_INDEX',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_43.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'报表',:description=>'报表')
    irm_menu_entiry_43.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Report',:description=>'Report')
    irm_menu_entiry_43.save

  end

  def self.down
  end
end
