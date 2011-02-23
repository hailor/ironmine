class InitIrmBaseMenus < ActiveRecord::Migration
  def self.up
    Irm::Menu.delete_all
    Irm::MenusTl.delete_all
    Irm::MenuEntry.delete_all
    Irm::MenuEntriesTl.delete_all
    irm_irm_advance_menu= Irm::Menu.new(:menu_code=>'IRM_ADVANCE_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_advance_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'高级',:description=>'高级')
    irm_irm_advance_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Advance',:description=>'Advance')
    irm_irm_advance_menu.save
    irm_irm_advance_setting_menu= Irm::Menu.new(:menu_code=>'IRM_ADVANCE_SETTING_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_advance_setting_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'高级设置',:description=>'高级设置')
    irm_irm_advance_setting_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Advance setting',:description=>'Advance setting')
    irm_irm_advance_setting_menu.save
    irm_irm_base_setting_menu= Irm::Menu.new(:menu_code=>'IRM_BASE_SETTING_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_base_setting_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'基础设置',:description=>'基础设置菜单')
    irm_irm_base_setting_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Base setting',:description=>'Base setting')
    irm_irm_base_setting_menu.save
    irm_irm_common_flex_segment_menu= Irm::Menu.new(:menu_code=>'IRM_COMMON_FLEX_SEGMENT_MENU',:leaf_flag=>'Y',:not_auto_mult=>true)
    irm_irm_common_flex_segment_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'弹性域段值',:description=>'弹性域段值菜单')
    irm_irm_common_flex_segment_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Flex segments',:description=>'Flex segments')
    irm_irm_common_flex_segment_menu.save
    irm_irm_common_lookup_menu= Irm::Menu.new(:menu_code=>'IRM_COMMON_LOOKUP_MENU',:leaf_flag=>'Y',:not_auto_mult=>true)
    irm_irm_common_lookup_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'快速编码',:description=>'快速编码菜单')
    irm_irm_common_lookup_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Lookup code',:description=>'Lookup code')
    irm_irm_common_lookup_menu.save
    irm_irm_common_menus_menu= Irm::Menu.new(:menu_code=>'IRM_COMMON_MENUS_MENU',:leaf_flag=>'Y',:not_auto_mult=>true)
    irm_irm_common_menus_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'菜单设置',:description=>'菜单设置菜单')
    irm_irm_common_menus_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Menu setting',:description=>'Menu setting')
    irm_irm_common_menus_menu.save
    irm_irm_common_setting_menu= Irm::Menu.new(:menu_code=>'IRM_COMMON_SETTING_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_common_setting_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'常用设置',:description=>'常用设置菜单')
    irm_irm_common_setting_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Common setting',:description=>'Common setting')
    irm_irm_common_setting_menu.save
    irm_irm_common_value_set_menu= Irm::Menu.new(:menu_code=>'IRM_COMMON_VALUE_SET_MENU',:leaf_flag=>'Y',:not_auto_mult=>true)
    irm_irm_common_value_set_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'值集定义',:description=>'值集定义菜单')
    irm_irm_common_value_set_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Flex value set',:description=>'Flex value set')
    irm_irm_common_value_set_menu.save
    irm_irm_dev_hepler_menu= Irm::Menu.new(:menu_code=>'IRM_DEV_HEPLER_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_dev_hepler_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'开发小工具',:description=>'开发小工具')
    irm_irm_dev_hepler_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Developer tools',:description=>'Developer tools')
    irm_irm_dev_hepler_menu.save
    irm_irm_developer_tools_menu= Irm::Menu.new(:menu_code=>'IRM_DEVELOPER_TOOLS_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_developer_tools_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'开发工具',:description=>'开发工具')
    irm_irm_developer_tools_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Developer tools',:description=>'Developer tools')
    irm_irm_developer_tools_menu.save
    irm_irm_ebp_home_menu= Irm::Menu.new(:menu_code=>'IRM_EBP_HOME_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_ebp_home_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'EBP主页',:description=>'EBP主页')
    irm_irm_ebp_home_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'EBP home page',:description=>'EBP home page')
    irm_irm_ebp_home_menu.save
    irm_irm_login_entrance_menu= Irm::Menu.new(:menu_code=>'IRM_LOGIN_ENTRANCE_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_login_entrance_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'最顶层登录可访问最顶层登录可访问',:description=>'')
    irm_irm_login_entrance_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Top login visitable',:description=>'Top login visitable')
    irm_irm_login_entrance_menu.save
    irm_irm_mail_menu= Irm::Menu.new(:menu_code=>'IRM_MAIL_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_mail_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'邮件',:description=>'邮件')
    irm_irm_mail_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Mail',:description=>'Mail')
    irm_irm_mail_menu.save
    irm_irm_org_support_group_menu= Irm::Menu.new(:menu_code=>'IRM_ORG_SUPPORT_GROUP_MENU',:leaf_flag=>'Y',:not_auto_mult=>true)
    irm_irm_org_support_group_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'支持组',:description=>'支持组')
    irm_irm_org_support_group_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Support group',:description=>'Support group')
    irm_irm_org_support_group_menu.save
    irm_irm_organization_struct_menu= Irm::Menu.new(:menu_code=>'IRM_ORGANIZATION_STRUCT_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_organization_struct_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'组织结构',:description=>'组织结构菜单')
    irm_irm_organization_struct_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Organization structure',:description=>'Organization structure')
    irm_irm_organization_struct_menu.save
    irm_irm_permission_menu= Irm::Menu.new(:menu_code=>'IRM_PERMISSION_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_permission_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'权限',:description=>'权限')
    irm_irm_permission_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Permission',:description=>'Permission')
    irm_irm_permission_menu.save
    irm_irm_permission_people_menu= Irm::Menu.new(:menu_code=>'IRM_PERMISSION_PEOPLE_MENU',:leaf_flag=>'Y',:not_auto_mult=>true)
    irm_irm_permission_people_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'人员管理',:description=>'人员管理')
    irm_irm_permission_people_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'People menu',:description=>'People menu')
    irm_irm_permission_people_menu.save
    irm_irm_personal_info_menu= Irm::Menu.new(:menu_code=>'IRM_PERSONAL_INFO_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_personal_info_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'我的个人信息',:description=>'我的个人信息菜单')
    irm_irm_personal_info_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Personal information',:description=>'Personal info menu')
    irm_irm_personal_info_menu.save
    irm_irm_personal_setting_menu= Irm::Menu.new(:menu_code=>'IRM_PERSONAL_SETTING_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_personal_setting_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'个人设置',:description=>'个人设置菜单')
    irm_irm_personal_setting_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Personal setting',:description=>'Personal setting menu')
    irm_irm_personal_setting_menu.save
    irm_irm_public_entrance_menu= Irm::Menu.new(:menu_code=>'IRM_PUBLIC_ENTRANCE_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_public_entrance_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'最顶层无需验证可访问',:description=>'最顶层无需验证可访问')
    irm_irm_public_entrance_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Top public visitable',:description=>'Top public visitable')
    irm_irm_public_entrance_menu.save
    irm_irm_service_operation_menu= Irm::Menu.new(:menu_code=>'IRM_SERVICE_OPERATION_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_service_operation_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'服务运营中心',:description=>'服务运营中心')
    irm_irm_service_operation_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Service operation center',:description=>'Service operation center')
    irm_irm_service_operation_menu.save
    irm_irm_soc_home_menu= Irm::Menu.new(:menu_code=>'IRM_SOC_HOME_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_soc_home_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'服务运营中心服务运营中心首页',:description=>'')
    irm_irm_soc_home_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'SOC home page',:description=>'SOC home page')
    irm_irm_soc_home_menu.save
    irm_irm_soc_incident_menu= Irm::Menu.new(:menu_code=>'IRM_SOC_INCIDENT_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_soc_incident_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'SOC事故单',:description=>'SOC事故单')
    irm_irm_soc_incident_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'SOC incident',:description=>'SOC incident')
    irm_irm_soc_incident_menu.save
    irm_irm_soc_problem_menu= Irm::Menu.new(:menu_code=>'IRM_SOC_PROBLEM_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_soc_problem_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'SOC问题',:description=>'SOC问题')
    irm_irm_soc_problem_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'SOC problem',:description=>'SOC problem')
    irm_irm_soc_problem_menu.save
    irm_irm_system_setting_menu= Irm::Menu.new(:menu_code=>'IRM_SYSTEM_SETTING_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_system_setting_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'系统设置',:description=>'系统设置菜单')
    irm_irm_system_setting_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Systme setting',:description=>'Systme setting')
    irm_irm_system_setting_menu.save

    irm_menu_entiry_10= Irm::MenuEntry.new(:menu_code=>'IRM_COMMON_MENUS_MENU',:sub_menu_code=>nil,:permission_code=>'IRM_MENU_ENTRIES_INDEX',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_10.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'菜单子项',:description=>'菜单子项')
    irm_menu_entiry_10.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Menu entry',:description=>'Menu entry')
    irm_menu_entiry_10.save
    irm_menu_entiry_11= Irm::MenuEntry.new(:menu_code=>'IRM_COMMON_SETTING_MENU',:sub_menu_code=>'IRM_COMMON_LOOKUP_MENU',:permission_code=>nil,:display_sequence=>40,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_11.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'快速编码',:description=>'快速编码')
    irm_menu_entiry_11.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Lookup code',:description=>'Lookup code')
    irm_menu_entiry_11.save
    irm_menu_entiry_12= Irm::MenuEntry.new(:menu_code=>'IRM_COMMON_LOOKUP_MENU',:sub_menu_code=>nil,:permission_code=>'IRM_LOOKUP_TYPES_INDEX',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_12.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'快速编码类型',:description=>'快速编码类型')
    irm_menu_entiry_12.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Lookup type',:description=>'Lookup type')
    irm_menu_entiry_12.save
    irm_menu_entiry_13= Irm::MenuEntry.new(:menu_code=>'IRM_COMMON_LOOKUP_MENU',:sub_menu_code=>nil,:permission_code=>'IRM_LOOKUP_VALUES_INDEX',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_13.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'快速编码值',:description=>'快速编码值')
    irm_menu_entiry_13.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Lookup value',:description=>'Lookup value')
    irm_menu_entiry_13.save
    irm_menu_entiry_14= Irm::MenuEntry.new(:menu_code=>'IRM_COMMON_SETTING_MENU',:sub_menu_code=>nil,:permission_code=>'IRM_GENERAL_CATEGORIES_INDEX',:display_sequence=>45,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_14.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'公共公类',:description=>'公共公类')
    irm_menu_entiry_14.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'General category',:description=>'General category')
    irm_menu_entiry_14.save
    irm_menu_entiry_15= Irm::MenuEntry.new(:menu_code=>'IRM_COMMON_SETTING_MENU',:sub_menu_code=>'IRM_COMMON_VALUE_SET_MENU',:permission_code=>nil,:display_sequence=>50,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_15.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'值集定义',:description=>'值集定义')
    irm_menu_entiry_15.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Flex value set',:description=>'Flex value set')
    irm_menu_entiry_15.save
    irm_menu_entiry_16= Irm::MenuEntry.new(:menu_code=>'IRM_COMMON_VALUE_SET_MENU',:sub_menu_code=>nil,:permission_code=>'IRM_FLEX_VALUE_SETS_INDEX',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_16.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'值集',:description=>'值集')
    irm_menu_entiry_16.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Value set',:description=>'Value set')
    irm_menu_entiry_16.save
    irm_menu_entiry_17= Irm::MenuEntry.new(:menu_code=>'IRM_COMMON_VALUE_SET_MENU',:sub_menu_code=>nil,:permission_code=>'IRM_FLEX_VALUES_INDEX',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_17.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'值集值',:description=>'值集值')
    irm_menu_entiry_17.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Value set value',:description=>'Value set value')
    irm_menu_entiry_17.save
    irm_menu_entiry_18= Irm::MenuEntry.new(:menu_code=>'IRM_COMMON_SETTING_MENU',:sub_menu_code=>nil,:permission_code=>'IRM_ID_FLEXES_INDEX',:display_sequence=>60,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_18.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'弹性域结构',:description=>'弹性域结构')
    irm_menu_entiry_18.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Flex struct',:description=>'Flex struct')
    irm_menu_entiry_18.save
    irm_menu_entiry_19= Irm::MenuEntry.new(:menu_code=>'IRM_COMMON_SETTING_MENU',:sub_menu_code=>'IRM_COMMON_FLEX_SEGMENT_MENU',:permission_code=>nil,:display_sequence=>70,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_19.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'弹性域段',:description=>'弹性域段')
    irm_menu_entiry_19.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Flex segments',:description=>'Flex segments')
    irm_menu_entiry_19.save
    irm_menu_entiry_2= Irm::MenuEntry.new(:menu_code=>'IRM_PERSONAL_SETTING_MENU',:sub_menu_code=>'IRM_PERSONAL_INFO_MENU',:permission_code=>nil,:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_2.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'我的个人信息',:description=>'设置个人信息，修改密码')
    irm_menu_entiry_2.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Personal infomation',:description=>'Personal information')
    irm_menu_entiry_2.save
    irm_menu_entiry_20= Irm::MenuEntry.new(:menu_code=>'IRM_COMMON_FLEX_SEGMENT_MENU',:sub_menu_code=>nil,:permission_code=>'IRM_ID_FLEX_STRUCTURES_INDEX',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_20.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'弹性域段结构',:description=>'弹性域段结构')
    irm_menu_entiry_20.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Flex segments struct',:description=>'Flex segments struct')
    irm_menu_entiry_20.save
    irm_menu_entiry_21= Irm::MenuEntry.new(:menu_code=>'IRM_COMMON_FLEX_SEGMENT_MENU',:sub_menu_code=>nil,:permission_code=>'IRM_ID_FLEX_SEGMENTS_INDEX',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_21.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'弹性域段值',:description=>'弹性域段值')
    irm_menu_entiry_21.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Flex segments value',:description=>'Flex segments value')
    irm_menu_entiry_21.save
    irm_menu_entiry_22= Irm::MenuEntry.new(:menu_code=>'IRM_BASE_SETTING_MENU',:sub_menu_code=>'IRM_ORGANIZATION_STRUCT_MENU',:permission_code=>nil,:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_22.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'组织结构',:description=>'组织结构')
    irm_menu_entiry_22.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Organization structure',:description=>'Organization structure')
    irm_menu_entiry_22.save
    irm_menu_entiry_23= Irm::MenuEntry.new(:menu_code=>'IRM_ORGANIZATION_STRUCT_MENU',:sub_menu_code=>nil,:permission_code=>'IRM_COMPANIES_INDEX',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_23.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'公司',:description=>'公司')
    irm_menu_entiry_23.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Company',:description=>'Company')
    irm_menu_entiry_23.save
    irm_menu_entiry_24= Irm::MenuEntry.new(:menu_code=>'IRM_ORGANIZATION_STRUCT_MENU',:sub_menu_code=>nil,:permission_code=>'IRM_ORGANIZATIONS_INDEX',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_24.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'组织',:description=>'组织')
    irm_menu_entiry_24.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Organization',:description=>'Organization')
    irm_menu_entiry_24.save
    irm_menu_entiry_25= Irm::MenuEntry.new(:menu_code=>'IRM_ORGANIZATION_STRUCT_MENU',:sub_menu_code=>nil,:permission_code=>'IRM_DEPARTMENTS_INDEX',:display_sequence=>30,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_25.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'部门',:description=>'部门')
    irm_menu_entiry_25.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Department',:description=>'Department')
    irm_menu_entiry_25.save
    irm_menu_entiry_26= Irm::MenuEntry.new(:menu_code=>'IRM_ORGANIZATION_STRUCT_MENU',:sub_menu_code=>nil,:permission_code=>'IRM_REGIONS_INDEX',:display_sequence=>40,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_26.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'区域',:description=>'区域')
    irm_menu_entiry_26.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Region',:description=>'Region')
    irm_menu_entiry_26.save
    irm_menu_entiry_27= Irm::MenuEntry.new(:menu_code=>'IRM_ORGANIZATION_STRUCT_MENU',:sub_menu_code=>nil,:permission_code=>'IRM_SITE_GROUPS_INDEX',:display_sequence=>50,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_27.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'地点组',:description=>'地点组')
    irm_menu_entiry_27.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Site group',:description=>'Site group')
    irm_menu_entiry_27.save
    irm_menu_entiry_28= Irm::MenuEntry.new(:menu_code=>'IRM_ORGANIZATION_STRUCT_MENU',:sub_menu_code=>nil,:permission_code=>'IRM_SITES_INDEX',:display_sequence=>60,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_28.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'地点',:description=>'地点')
    irm_menu_entiry_28.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Site',:description=>'Site')
    irm_menu_entiry_28.save
    irm_menu_entiry_29= Irm::MenuEntry.new(:menu_code=>'IRM_ORGANIZATION_STRUCT_MENU',:sub_menu_code=>'IRM_ORG_SUPPORT_GROUP_MENU',:permission_code=>nil,:display_sequence=>70,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_29.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'支持组',:description=>'支持组')
    irm_menu_entiry_29.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Support group',:description=>'Support group')
    irm_menu_entiry_29.save
    irm_menu_entiry_3= Irm::MenuEntry.new(:menu_code=>'IRM_PERSONAL_INFO_MENU',:sub_menu_code=>nil,:permission_code=>'IRM_MY_INFO_INDEX',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_3.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'我的账号',:description=>'个人账号')
    irm_menu_entiry_3.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'My identity',:description=>'My identity')
    irm_menu_entiry_3.save
    irm_menu_entiry_30= Irm::MenuEntry.new(:menu_code=>'IRM_ORG_SUPPORT_GROUP_MENU',:sub_menu_code=>nil,:permission_code=>'IRM_SUPPORT_GROUPS_INDEX',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_30.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'支持组',:description=>'支持组')
    irm_menu_entiry_30.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Support group',:description=>'Support group')
    irm_menu_entiry_30.save
    irm_menu_entiry_31= Irm::MenuEntry.new(:menu_code=>'IRM_ORG_SUPPORT_GROUP_MENU',:sub_menu_code=>nil,:permission_code=>'IRM_SUPPORT_GROUP_MEM_INDEX',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_31.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'支持组成员',:description=>'支持组成员')
    irm_menu_entiry_31.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Support group member',:description=>'Support group member')
    irm_menu_entiry_31.save
    irm_menu_entiry_32= Irm::MenuEntry.new(:menu_code=>'IRM_BASE_SETTING_MENU',:sub_menu_code=>'IRM_PERMISSION_MENU',:permission_code=>nil,:display_sequence=>30,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_32.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'权限',:description=>'权限')
    irm_menu_entiry_32.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Permission',:description=>'Permission')
    irm_menu_entiry_32.save
    irm_menu_entiry_33= Irm::MenuEntry.new(:menu_code=>'IRM_PERMISSION_MENU',:sub_menu_code=>nil,:permission_code=>'IRM_IDENTITIES_INDEX',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_33.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'账号',:description=>'账号')
    irm_menu_entiry_33.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Identity',:description=>'Identity')
    irm_menu_entiry_33.save
    irm_menu_entiry_34= Irm::MenuEntry.new(:menu_code=>'IRM_PERMISSION_MENU',:sub_menu_code=>'IRM_PERMISSION_PEOPLE_MENU',:permission_code=>nil,:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_34.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'人员',:description=>'人员')
    irm_menu_entiry_34.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'People',:description=>'People')
    irm_menu_entiry_34.save
    irm_menu_entiry_35= Irm::MenuEntry.new(:menu_code=>'IRM_PERMISSION_PEOPLE_MENU',:sub_menu_code=>nil,:permission_code=>'IRM_PEOPLE_INDEX',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_35.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'人员',:description=>'人员')
    irm_menu_entiry_35.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'People',:description=>'People')
    irm_menu_entiry_35.save
    irm_menu_entiry_36= Irm::MenuEntry.new(:menu_code=>'IRM_PERMISSION_PEOPLE_MENU',:sub_menu_code=>nil,:permission_code=>'IRM_COMPANY_ACCESSES_INDEX',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_36.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'人员访问公司限制',:description=>'人员访问公司限制')
    irm_menu_entiry_36.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Company access',:description=>'Company access')
    irm_menu_entiry_36.save
    irm_menu_entiry_37= Irm::MenuEntry.new(:menu_code=>'IRM_PERMISSION_MENU',:sub_menu_code=>nil,:permission_code=>'IRM_ROLES_INDEX',:display_sequence=>30,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_37.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'角色',:description=>'角色')
    irm_menu_entiry_37.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Role',:description=>'Role')
    irm_menu_entiry_37.save
    irm_menu_entiry_38= Irm::MenuEntry.new(:menu_code=>'IRM_PERMISSION_MENU',:sub_menu_code=>nil,:permission_code=>'IRM_PERMISSIONS_INDEX',:display_sequence=>40,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_38.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'权限',:description=>'权限')
    irm_menu_entiry_38.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Permission',:description=>'Permission')
    irm_menu_entiry_38.save
    irm_menu_entiry_4= Irm::MenuEntry.new(:menu_code=>'IRM_SYSTEM_SETTING_MENU',:sub_menu_code=>'IRM_BASE_SETTING_MENU',:permission_code=>nil,:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_4.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'基础设置',:description=>'基础设置')
    irm_menu_entiry_4.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Base setting',:description=>'Base setting')
    irm_menu_entiry_4.save
    irm_menu_entiry_5= Irm::MenuEntry.new(:menu_code=>'IRM_BASE_SETTING_MENU',:sub_menu_code=>'IRM_COMMON_SETTING_MENU',:permission_code=>nil,:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_5.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'常用设置',:description=>'常用设置')
    irm_menu_entiry_5.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Common setting',:description=>'Common setting')
    irm_menu_entiry_5.save
    irm_menu_entiry_54= Irm::MenuEntry.new(:menu_code=>'IRM_SYSTEM_SETTING_MENU',:sub_menu_code=>'IRM_ADVANCE_SETTING_MENU',:permission_code=>nil,:display_sequence=>50,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_54.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'高级设置',:description=>'高级设置')
    irm_menu_entiry_54.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Advance setting',:description=>'Advance setting')
    irm_menu_entiry_54.save
    irm_menu_entiry_55= Irm::MenuEntry.new(:menu_code=>'IRM_ADVANCE_SETTING_MENU',:sub_menu_code=>'IRM_ADVANCE_MENU',:permission_code=>nil,:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_55.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'高级',:description=>'高级')
    irm_menu_entiry_55.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Advance',:description=>'Advance')
    irm_menu_entiry_55.save
    irm_menu_entiry_56= Irm::MenuEntry.new(:menu_code=>'IRM_ADVANCE_MENU',:sub_menu_code=>nil,:permission_code=>'IRM_CURRENCIES_INDEX',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_56.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'币种',:description=>'币种')
    irm_menu_entiry_56.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Currency',:description=>'Currency')
    irm_menu_entiry_56.save
    irm_menu_entiry_57= Irm::MenuEntry.new(:menu_code=>'IRM_ADVANCE_MENU',:sub_menu_code=>nil,:permission_code=>'IRM_LANGUAGES_INDEX',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_57.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'语言',:description=>'语言')
    irm_menu_entiry_57.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Language',:description=>'Language')
    irm_menu_entiry_57.save
    irm_menu_entiry_58= Irm::MenuEntry.new(:menu_code=>'IRM_ADVANCE_MENU',:sub_menu_code=>nil,:permission_code=>'IRM_PRODUCT_MODULES_INDEX',:display_sequence=>30,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_58.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'产品模块',:description=>'产品模块')
    irm_menu_entiry_58.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Product module',:description=>'Product module')
    irm_menu_entiry_58.save
    irm_menu_entiry_59= Irm::MenuEntry.new(:menu_code=>'IRM_ADVANCE_SETTING_MENU',:sub_menu_code=>'IRM_MAIL_MENU',:permission_code=>nil,:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_59.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'邮件',:description=>'邮件')
    irm_menu_entiry_59.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Mail',:description=>'Mail')
    irm_menu_entiry_59.save
    irm_menu_entiry_6= Irm::MenuEntry.new(:menu_code=>'IRM_COMMON_SETTING_MENU',:sub_menu_code=>nil,:permission_code=>'IRM_GLOBAL_SETTINGS_INDEX',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_6.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'全局设置',:description=>'全局设置')
    irm_menu_entiry_6.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Global setting',:description=>'Global setting')
    irm_menu_entiry_6.save
    irm_menu_entiry_60= Irm::MenuEntry.new(:menu_code=>'IRM_MAIL_MENU',:sub_menu_code=>nil,:permission_code=>'IRM_CONDITIONS_INDEX',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_60.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'Condition',:description=>'Condition')
    irm_menu_entiry_60.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Condition',:description=>'Condition')
    irm_menu_entiry_60.save
    irm_menu_entiry_61= Irm::MenuEntry.new(:menu_code=>'IRM_MAIL_MENU',:sub_menu_code=>nil,:permission_code=>'IRM_ACTIONS_INDEX',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_61.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'Action',:description=>'Action')
    irm_menu_entiry_61.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Action',:description=>'Action')
    irm_menu_entiry_61.save
    irm_menu_entiry_62= Irm::MenuEntry.new(:menu_code=>'IRM_MAIL_MENU',:sub_menu_code=>nil,:permission_code=>'IRM_SCRIPTS_INDEX',:display_sequence=>30,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_62.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'Script',:description=>'Script')
    irm_menu_entiry_62.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Script',:description=>'Script')
    irm_menu_entiry_62.save
    irm_menu_entiry_63= Irm::MenuEntry.new(:menu_code=>'IRM_MAIL_MENU',:sub_menu_code=>nil,:permission_code=>'IRM_MAIL_TEMPLATES_INDEX',:display_sequence=>40,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_63.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'邮件模板',:description=>'邮件模板')
    irm_menu_entiry_63.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Mail template',:description=>'Mail template')
    irm_menu_entiry_63.save
    irm_menu_entiry_64= Irm::MenuEntry.new(:menu_code=>'IRM_SERVICE_OPERATION_MENU',:sub_menu_code=>'IRM_SOC_HOME_MENU',:permission_code=>nil,:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_64.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'主页',:description=>'主页')
    irm_menu_entiry_64.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Home',:description=>'Home')
    irm_menu_entiry_64.save
    irm_menu_entiry_65= Irm::MenuEntry.new(:menu_code=>'IRM_SOC_HOME_MENU',:sub_menu_code=>nil,:permission_code=>'IRM_HOME_INDEX',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_65.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'主页',:description=>'主页')
    irm_menu_entiry_65.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Home page',:description=>'Home page')
    irm_menu_entiry_65.save
    irm_menu_entiry_69= Irm::MenuEntry.new(:menu_code=>'IRM_SERVICE_OPERATION_MENU',:sub_menu_code=>'IRM_SOC_PROBLEM_MENU',:permission_code=>nil,:display_sequence=>30,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_69.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'问题',:description=>'问题')
    irm_menu_entiry_69.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Problem',:description=>'Problem')
    irm_menu_entiry_69.save
    irm_menu_entiry_7= Irm::MenuEntry.new(:menu_code=>'IRM_COMMON_SETTING_MENU',:sub_menu_code=>nil,:permission_code=>'IRM_AUTH_SOURCES_INDEX',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_7.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'LDAP认证',:description=>'LDAP认证')
    irm_menu_entiry_7.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'LDAP authsource',:description=>'LDAP authsource')
    irm_menu_entiry_7.save
    irm_menu_entiry_78= Irm::MenuEntry.new(:menu_code=>'IRM_EBP_HOME_MENU',:sub_menu_code=>nil,:permission_code=>'EBS_HOME_INDEX',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_78.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'主页',:description=>'主页')
    irm_menu_entiry_78.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Home page',:description=>'Home page')
    irm_menu_entiry_78.save
    irm_menu_entiry_79= Irm::MenuEntry.new(:menu_code=>'IRM_LOGIN_ENTRANCE_MENU',:sub_menu_code=>nil,:permission_code=>'IRM_SETTING_INDEX',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_79.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'设置公共页面',:description=>'设置公共页面')
    irm_menu_entiry_79.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Setting common',:description=>'Setting common')
    irm_menu_entiry_79.save
    irm_menu_entiry_8= Irm::MenuEntry.new(:menu_code=>'IRM_PERMISSION_MENU',:sub_menu_code=>'IRM_COMMON_MENUS_MENU',:permission_code=>nil,:display_sequence=>35,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_8.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'菜单',:description=>'菜单')
    irm_menu_entiry_8.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Menu',:description=>'Menu')
    irm_menu_entiry_8.save
    irm_menu_entiry_80= Irm::MenuEntry.new(:menu_code=>'IRM_LOGIN_ENTRANCE_MENU',:sub_menu_code=>nil,:permission_code=>'IRM_NAVIGATIONS_INDEX',:display_sequence=>30,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_80.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'系统入口页面',:description=>'系统入口页面')
    irm_menu_entiry_80.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'System entrance page',:description=>'System entrance page')
    irm_menu_entiry_80.save
    irm_menu_entiry_81= Irm::MenuEntry.new(:menu_code=>'IRM_DEVELOPER_TOOLS_MENU',:sub_menu_code=>'IRM_DEV_HEPLER_MENU',:permission_code=>nil,:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_81.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'开发工具',:description=>'开发工具')
    irm_menu_entiry_81.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Developer tools',:description=>'Developer tools')
    irm_menu_entiry_81.save
    irm_menu_entiry_82= Irm::MenuEntry.new(:menu_code=>'IRM_DEV_HEPLER_MENU',:sub_menu_code=>nil,:permission_code=>'IRM_DEV_TOOLS_INDEX',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_82.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'工具列表',:description=>'工具列表')
    irm_menu_entiry_82.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Tool list',:description=>'Tool list')
    irm_menu_entiry_82.save
    irm_menu_entiry_83= Irm::MenuEntry.new(:menu_code=>'IRM_LOGIN_ENTRANCE_MENU',:sub_menu_code=>nil,:permission_code=>'IRM_FILTERS_INDEX',:display_sequence=>40,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_83.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'视图',:description=>'视图')
    irm_menu_entiry_83.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'View',:description=>'View')
    irm_menu_entiry_83.save
    irm_menu_entiry_9= Irm::MenuEntry.new(:menu_code=>'IRM_COMMON_MENUS_MENU',:sub_menu_code=>nil,:permission_code=>'IRM_MENUS_INDEX',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_9.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'菜单',:description=>'菜单')
    irm_menu_entiry_9.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Menu',:description=>'Menu')
    irm_menu_entiry_9.save
  end

  def self.down
  end
end
