# -*- coding: utf-8 -*-
class AddFunctionGroups < ActiveRecord::Migration
  def self.up
    irm_irm_automator= Irm::FunctionGroup.new(:group_code=>'IRM_AUTOMATOR',:not_auto_mult=>true)
    irm_irm_automator.function_groups_tls.build(:language=>'zh',:source_lang=>'en',:name=>'Automator',:description=>'Automator')
    irm_irm_automator.function_groups_tls.build(:language=>'en',:source_lang=>'en',:name=>'Automator',:description=>'Automator')
    irm_irm_automator.save
    icm_icm_common_setting= Irm::FunctionGroup.new(:group_code=>'ICM_COMMON_SETTING',:not_auto_mult=>true)
    icm_icm_common_setting.function_groups_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故一般设置',:description=>'事故一般设置')
    icm_icm_common_setting.function_groups_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident Common',:description=>'Incident Common')
    icm_icm_common_setting.save
    icm_icm_setting= Irm::FunctionGroup.new(:group_code=>'ICM_SETTING',:not_auto_mult=>true)
    icm_icm_setting.function_groups_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故设置',:description=>'事故设置')
    icm_icm_setting.function_groups_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident Setting',:description=>'Incident Setting')
    icm_icm_setting.save
    skm_skm_setting= Irm::FunctionGroup.new(:group_code=>'SKM_SETTING',:not_auto_mult=>true)
    skm_skm_setting.function_groups_tls.build(:language=>'zh',:source_lang=>'en',:name=>'知识库设置',:description=>'知识库设置')
    skm_skm_setting.function_groups_tls.build(:language=>'en',:source_lang=>'en',:name=>'Knowledge Base Setting',:description=>'Knowledge Base Setting')
    skm_skm_setting.save
    irm_irm_dev_permission= Irm::FunctionGroup.new(:group_code=>'IRM_DEV_PERMISSION',:not_auto_mult=>true)
    irm_irm_dev_permission.function_groups_tls.build(:language=>'zh',:source_lang=>'en',:name=>'开发人员-权限',:description=>'开发人员-权限')
    irm_irm_dev_permission.function_groups_tls.build(:language=>'en',:source_lang=>'en',:name=>'Developer-Permission',:description=>'Developer-Permission')
    irm_irm_dev_permission.save
    irm_irm_dev_automator= Irm::FunctionGroup.new(:group_code=>'IRM_DEV_AUTOMATOR',:not_auto_mult=>true)
    irm_irm_dev_automator.function_groups_tls.build(:language=>'zh',:source_lang=>'en',:name=>'开发人员-Automator',:description=>'开发人员-Automator')
    irm_irm_dev_automator.function_groups_tls.build(:language=>'en',:source_lang=>'en',:name=>'Developer-Automator',:description=>'Developer-Automator')
    irm_irm_dev_automator.save
    irm_irm_dev_advance= Irm::FunctionGroup.new(:group_code=>'IRM_DEV_ADVANCE',:not_auto_mult=>true)
    irm_irm_dev_advance.function_groups_tls.build(:language=>'zh',:source_lang=>'en',:name=>'开发人员-高级',:description=>'开发人员-高级')
    irm_irm_dev_advance.function_groups_tls.build(:language=>'en',:source_lang=>'en',:name=>'Developer-Advance',:description=>'Developer-Advance')
    irm_irm_dev_advance.save
    
    irm_view_scripts= Irm::Function.new(:group_code=>'IRM_AUTOMATOR',:function_code=>'VIEW_SCRIPTS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_scripts.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'服务宏',:description=>'服务宏')
    irm_view_scripts.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Script',:description=>'Script')
    irm_view_scripts.save
    irm_create_scripts= Irm::Function.new(:group_code=>'IRM_AUTOMATOR',:function_code=>'CREATE_SCRIPTS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_scripts.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建服务宏',:description=>'新建服务宏')
    irm_create_scripts.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Script',:description=>'New Script')
    irm_create_scripts.save
    irm_edit_scripts= Irm::Function.new(:group_code=>'IRM_AUTOMATOR',:function_code=>'EDIT_SCRIPTS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_scripts.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑服务宏',:description=>'编辑服务宏')
    irm_edit_scripts.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Script',:description=>'Edit Script')
    irm_edit_scripts.save
    irm_view_mail_templates= Irm::Function.new(:group_code=>'IRM_AUTOMATOR',:function_code=>'VIEW_MAIL_TEMPLATES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_mail_templates.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'邮件模板',:description=>'邮件模板')
    irm_view_mail_templates.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Mail Template',:description=>'Mail Template')
    irm_view_mail_templates.save
    irm_create_mail_templates= Irm::Function.new(:group_code=>'IRM_AUTOMATOR',:function_code=>'CREATE_MAIL_TEMPLATES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_mail_templates.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建邮件模板',:description=>'新建邮件模板')
    irm_create_mail_templates.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Mail Template',:description=>'New Mail Template')
    irm_create_mail_templates.save
    irm_edit_mail_templates= Irm::Function.new(:group_code=>'IRM_AUTOMATOR',:function_code=>'EDIT_MAIL_TEMPLATES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_mail_templates.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑邮件模板',:description=>'编辑邮件模板')
    irm_edit_mail_templates.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Mail Template',:description=>'Edit Mail Template')
    irm_edit_mail_templates.save
    irm_view_menus= Irm::Function.new(:group_code=>'IRM_DEV_PERMISSION',:function_code=>'VIEW_MENUS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_menus.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'菜单',:description=>'菜单')
    irm_view_menus.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Menu',:description=>'Menu')
    irm_view_menus.save
    irm_create_menus= Irm::Function.new(:group_code=>'IRM_DEV_PERMISSION',:function_code=>'CREATE_MENUS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_menus.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建菜单',:description=>'新建菜单')
    irm_create_menus.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Menu',:description=>'New Menu')
    irm_create_menus.save
    irm_edit_menus= Irm::Function.new(:group_code=>'IRM_DEV_PERMISSION',:function_code=>'EDIT_MENUS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_menus.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑菜单',:description=>'编辑菜单')
    irm_edit_menus.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Menu',:description=>'Edit Menu')
    irm_edit_menus.save
    irm_view_function_groups= Irm::Function.new(:group_code=>'IRM_DEV_PERMISSION',:function_code=>'VIEW_FUNCTION_GROUPS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_function_groups.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'功能组',:description=>'功能组')
    irm_view_function_groups.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Function Group',:description=>'Function Group')
    irm_view_function_groups.save
    irm_create_function_groups= Irm::Function.new(:group_code=>'IRM_DEV_PERMISSION',:function_code=>'CREATE_FUNCTION_GROUPS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_function_groups.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建功能组',:description=>'新建功能组')
    irm_create_function_groups.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Function Group',:description=>'New Function Group')
    irm_create_function_groups.save
    irm_edit_function_groups= Irm::Function.new(:group_code=>'IRM_DEV_PERMISSION',:function_code=>'EDIT_FUNCTION_GROUPS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_function_groups.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑功能组',:description=>'编辑功能组')
    irm_edit_function_groups.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Function Group',:description=>'Edit Function Group')
    irm_edit_function_groups.save
    irm_view_functions= Irm::Function.new(:group_code=>'IRM_DEV_PERMISSION',:function_code=>'VIEW_FUNCTIONS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_functions.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'功能',:description=>'功能')
    irm_view_functions.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Function',:description=>'Function')
    irm_view_functions.save
    irm_create_functions= Irm::Function.new(:group_code=>'IRM_DEV_PERMISSION',:function_code=>'CREATE_FUNCTIONS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_functions.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建功能',:description=>'新建功能')
    irm_create_functions.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Function',:description=>'New Function')
    irm_create_functions.save
    irm_edit_functions= Irm::Function.new(:group_code=>'IRM_DEV_PERMISSION',:function_code=>'EDIT_FUNCTIONS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_functions.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑功能',:description=>'编辑功能')
    irm_edit_functions.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Function',:description=>'Edit Function')
    irm_edit_functions.save
    irm_view_reports= Irm::Function.new(:group_code=>'IRM_DEV_PERMISSION',:function_code=>'VIEW_REPORTS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_reports.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'报表',:description=>'报表')
    irm_view_reports.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Report',:description=>'Report')
    irm_view_reports.save
    irm_create_reports= Irm::Function.new(:group_code=>'IRM_DEV_PERMISSION',:function_code=>'CREATE_REPORTS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_reports.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建报表',:description=>'新建报表')
    irm_create_reports.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Report',:description=>'New Report')
    irm_create_reports.save
    irm_edit_reports= Irm::Function.new(:group_code=>'IRM_DEV_PERMISSION',:function_code=>'EDIT_REPORTS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_reports.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑报表',:description=>'编辑报表')
    irm_edit_reports.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Report',:description=>'Edit Report')
    irm_edit_reports.save
    irm_view_conditions= Irm::Function.new(:group_code=>'IRM_DEV_AUTOMATOR',:function_code=>'VIEW_CONDITIONS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_conditions.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'触发条件',:description=>'触发条件')
    irm_view_conditions.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Condition',:description=>'Condition')
    irm_view_conditions.save
    irm_create_conditions= Irm::Function.new(:group_code=>'IRM_DEV_AUTOMATOR',:function_code=>'CREATE_CONDITIONS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_conditions.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建触发条件',:description=>'新建触发条件')
    irm_create_conditions.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Condition',:description=>'New Condition')
    irm_create_conditions.save
    irm_edit_conditions= Irm::Function.new(:group_code=>'IRM_DEV_AUTOMATOR',:function_code=>'EDIT_CONDITIONS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_conditions.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑触发条件',:description=>'编辑触发条件')
    irm_edit_conditions.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Condition',:description=>'Edit Condition')
    irm_edit_conditions.save
    irm_view_currencies= Irm::Function.new(:group_code=>'IRM_DEV_ADVANCE',:function_code=>'VIEW_CURRENCIES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_currencies.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'货币',:description=>'货币')
    irm_view_currencies.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Currency',:description=>'Currency')
    irm_view_currencies.save
    irm_create_currencies= Irm::Function.new(:group_code=>'IRM_DEV_ADVANCE',:function_code=>'CREATE_CURRENCIES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_currencies.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建货币',:description=>'新建货币')
    irm_create_currencies.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Currency',:description=>'New Currency')
    irm_create_currencies.save
    irm_edit_currencies= Irm::Function.new(:group_code=>'IRM_DEV_ADVANCE',:function_code=>'EDIT_CURRENCIES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_currencies.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑货币',:description=>'编辑货币')
    irm_edit_currencies.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Currency',:description=>'Edit Currency')
    irm_edit_currencies.save
    irm_view_languages= Irm::Function.new(:group_code=>'IRM_DEV_ADVANCE',:function_code=>'VIEW_LANGUAGES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_languages.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'语言',:description=>'语言')
    irm_view_languages.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Language',:description=>'Language')
    irm_view_languages.save
    irm_create_languages= Irm::Function.new(:group_code=>'IRM_DEV_ADVANCE',:function_code=>'CREATE_LANGUAGES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_languages.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建语言',:description=>'新建语言')
    irm_create_languages.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Language',:description=>'New Language')
    irm_create_languages.save
    irm_edit_languages= Irm::Function.new(:group_code=>'IRM_DEV_ADVANCE',:function_code=>'EDIT_LANGUAGES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_languages.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑语言',:description=>'编辑语言')
    irm_edit_languages.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Language',:description=>'Edit Language')
    irm_edit_languages.save
    irm_view_product_modules= Irm::Function.new(:group_code=>'IRM_DEV_ADVANCE',:function_code=>'VIEW_PRODUCT_MODULES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_product_modules.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'产品模块',:description=>'产品模块')
    irm_view_product_modules.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Product Module',:description=>'Product Module')
    irm_view_product_modules.save
    irm_create_product_modules= Irm::Function.new(:group_code=>'IRM_DEV_ADVANCE',:function_code=>'CREATE_PRODUCT_MODULES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_product_modules.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建产品模块',:description=>'新建产品模块')
    irm_create_product_modules.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Product Module',:description=>'New Product Module')
    irm_create_product_modules.save
    irm_edit_product_modules= Irm::Function.new(:group_code=>'IRM_DEV_ADVANCE',:function_code=>'EDIT_PRODUCT_MODULES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_product_modules.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑产品模块',:description=>'编辑产品模块')
    irm_edit_product_modules.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Product Module',:description=>'Edit Product Module')
    irm_edit_product_modules.save
    irm_view_dev_tools= Irm::Function.new(:group_code=>'IRM_DEV_ADVANCE',:function_code=>'VIEW_DEV_TOOLS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_dev_tools.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'开发工具',:description=>'开发工具')
    irm_view_dev_tools.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Dev Tools',:description=>'Dev Tools')
    irm_view_dev_tools.save
    irm_view_rule_settings= Irm::Function.new(:group_code=>'ICM_COMMON_SETTING',:function_code=>'VIEW_RULE_SETTINGS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_rule_settings.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故规则',:description=>'事故规则')
    irm_view_rule_settings.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident Rule',:description=>'Incident Rule')
    irm_view_rule_settings.save
    irm_create_rule_settings= Irm::Function.new(:group_code=>'ICM_COMMON_SETTING',:function_code=>'CREATE_RULE_SETTINGS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_rule_settings.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建事故规则',:description=>'新建事故规则')
    irm_create_rule_settings.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Incident Rule',:description=>'New Incident Rule')
    irm_create_rule_settings.save
    irm_edit_rule_settings= Irm::Function.new(:group_code=>'ICM_COMMON_SETTING',:function_code=>'EDIT_RULE_SETTINGS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_rule_settings.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑事故规则',:description=>'编辑事故规则')
    irm_edit_rule_settings.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Incident Rule',:description=>'Edit Incident Rule')
    irm_edit_rule_settings.save
    irm_view_urgence_codes= Irm::Function.new(:group_code=>'ICM_SETTING',:function_code=>'VIEW_URGENCE_CODES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_urgence_codes.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'紧急度',:description=>'紧急度')
    irm_view_urgence_codes.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Urgence Code',:description=>'Urgence Code')
    irm_view_urgence_codes.save
    irm_create_urgence_codes= Irm::Function.new(:group_code=>'ICM_SETTING',:function_code=>'CREATE_URGENCE_CODES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_urgence_codes.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建紧急度',:description=>'新建紧急度')
    irm_create_urgence_codes.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Urgence Code',:description=>'New Urgence Code')
    irm_create_urgence_codes.save
    irm_edit_urgence_codes= Irm::Function.new(:group_code=>'ICM_SETTING',:function_code=>'EDIT_URGENCE_CODES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_urgence_codes.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑紧急度',:description=>'编辑紧急度')
    irm_edit_urgence_codes.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Urgence Code',:description=>'Edit Urgence Code')
    irm_edit_urgence_codes.save
    irm_view_impact_ranges= Irm::Function.new(:group_code=>'ICM_SETTING',:function_code=>'VIEW_IMPACT_RANGES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_impact_ranges.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'影响度',:description=>'影响度')
    irm_view_impact_ranges.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Impact Range',:description=>'Impact Range')
    irm_view_impact_ranges.save
    irm_create_impact_ranges= Irm::Function.new(:group_code=>'ICM_SETTING',:function_code=>'CREATE_IMPACT_RANGES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_impact_ranges.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建影响度',:description=>'新建影响度')
    irm_create_impact_ranges.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Impact Range',:description=>'New Impact Range')
    irm_create_impact_ranges.save
    irm_edit_impact_ranges= Irm::Function.new(:group_code=>'ICM_SETTING',:function_code=>'EDIT_IMPACT_RANGES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_impact_ranges.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑影响度',:description=>'编辑影响度')
    irm_edit_impact_ranges.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Impact Range',:description=>'Edit Impact Range')
    irm_edit_impact_ranges.save
    irm_view_priority_codes= Irm::Function.new(:group_code=>'ICM_SETTING',:function_code=>'VIEW_PRIORITY_CODES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_priority_codes.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'优先级',:description=>'优先级')
    irm_view_priority_codes.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Priority',:description=>'Priority')
    irm_view_priority_codes.save
    irm_create_priority_codes= Irm::Function.new(:group_code=>'ICM_SETTING',:function_code=>'CREATE_PRIORITY_CODES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_priority_codes.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建优先级',:description=>'新建优先级')
    irm_create_priority_codes.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Priority',:description=>'New Priority')
    irm_create_priority_codes.save
    irm_edit_priority_codes= Irm::Function.new(:group_code=>'ICM_SETTING',:function_code=>'EDIT_PRIORITY_CODES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_priority_codes.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑优先级',:description=>'编辑优先级')
    irm_edit_priority_codes.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Priority',:description=>'Edit Priority')
    irm_edit_priority_codes.save
    irm_view_group_assignments= Irm::Function.new(:group_code=>'ICM_SETTING',:function_code=>'VIEW_GROUP_ASSIGNMENTS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_group_assignments.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'组指派',:description=>'组指派')
    irm_view_group_assignments.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Group Assign',:description=>'Group Assign')
    irm_view_group_assignments.save
    irm_create_group_assignments= Irm::Function.new(:group_code=>'ICM_SETTING',:function_code=>'CREATE_GROUP_ASSIGNMENTS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_group_assignments.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建组指派',:description=>'新建组指派')
    irm_create_group_assignments.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Group Assign',:description=>'New Group Assign')
    irm_create_group_assignments.save
    irm_edit_group_assignments= Irm::Function.new(:group_code=>'ICM_SETTING',:function_code=>'EDIT_GROUP_ASSIGNMENTS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_group_assignments.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑组指派',:description=>'编辑组指派')
    irm_edit_group_assignments.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Group Assign',:description=>'Edit Group Assign')
    irm_edit_group_assignments.save
    irm_view_incident_phases= Irm::Function.new(:group_code=>'ICM_SETTING',:function_code=>'VIEW_INCIDENT_PHASES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_incident_phases.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故阶段',:description=>'事故阶段')
    irm_view_incident_phases.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Phase',:description=>'Phase')
    irm_view_incident_phases.save
    irm_create_incident_phases= Irm::Function.new(:group_code=>'ICM_SETTING',:function_code=>'CREATE_INCIDENT_PHASES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_incident_phases.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建事故阶段',:description=>'新建事故阶段')
    irm_create_incident_phases.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Phase',:description=>'New Phase')
    irm_create_incident_phases.save
    irm_edit_incident_phases= Irm::Function.new(:group_code=>'ICM_SETTING',:function_code=>'EDIT_INCIDENT_PHASES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_incident_phases.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑事故阶段',:description=>'编辑事故阶段')
    irm_edit_incident_phases.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Phase',:description=>'Edit Phase')
    irm_edit_incident_phases.save
    irm_view_entry_statuses= Irm::Function.new(:group_code=>'SKM_SETTING',:function_code=>'VIEW_ENTRY_STATUSES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_entry_statuses.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'知识库状态',:description=>'知识库状态')
    irm_view_entry_statuses.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Stauts',:description=>'Stauts')
    irm_view_entry_statuses.save
    irm_create_entry_statuses= Irm::Function.new(:group_code=>'SKM_SETTING',:function_code=>'CREATE_ENTRY_STATUSES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_entry_statuses.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建知识库状态',:description=>'新建知识库状态')
    irm_create_entry_statuses.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Stauts',:description=>'New Stauts')
    irm_create_entry_statuses.save
    irm_edit_entry_statuses= Irm::Function.new(:group_code=>'SKM_SETTING',:function_code=>'EDIT_ENTRY_STATUSES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_entry_statuses.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑知识库状态',:description=>'编辑知识库状态')
    irm_edit_entry_statuses.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Stauts',:description=>'Edit Stauts')
    irm_edit_entry_statuses.save
    irm_view_close_reasons= Irm::Function.new(:group_code=>'SKM_SETTING',:function_code=>'VIEW_CLOSE_REASONS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_close_reasons.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'关闭原因',:description=>'关闭原因')
    irm_view_close_reasons.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Close Reason',:description=>'Close Reason')
    irm_view_close_reasons.save
    irm_create_close_reasons= Irm::Function.new(:group_code=>'SKM_SETTING',:function_code=>'CREATE_CLOSE_REASONS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_close_reasons.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建关闭原因',:description=>'新建关闭原因')
    irm_create_close_reasons.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Close Reason',:description=>'New Close Reason')
    irm_create_close_reasons.save
    irm_edit_close_reasons= Irm::Function.new(:group_code=>'SKM_SETTING',:function_code=>'EDIT_CLOSE_REASONS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_close_reasons.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑关闭原因',:description=>'编辑关闭原因')
    irm_edit_close_reasons.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Close Reason',:description=>'Edit Close Reason')
    irm_edit_close_reasons.save
    irm_view_entry_templates= Irm::Function.new(:group_code=>'SKM_SETTING',:function_code=>'VIEW_ENTRY_TEMPLATES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_entry_templates.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'知识模板',:description=>'知识模板')
    irm_view_entry_templates.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Entry Template',:description=>'Entry Template')
    irm_view_entry_templates.save
    irm_create_entry_templates= Irm::Function.new(:group_code=>'SKM_SETTING',:function_code=>'CREATE_ENTRY_TEMPLATES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_entry_templates.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建知识模板',:description=>'新建知识模板')
    irm_create_entry_templates.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Entry Template',:description=>'New Entry Template')
    irm_create_entry_templates.save
    irm_edit_entry_templates= Irm::Function.new(:group_code=>'SKM_SETTING',:function_code=>'EDIT_ENTRY_TEMPLATES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_entry_templates.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑知识模板',:description=>'编辑知识模板')
    irm_edit_entry_templates.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Entry Template',:description=>'Edit Entry Template')
    irm_edit_entry_templates.save
    irm_view_entry_template_elements= Irm::Function.new(:group_code=>'SKM_SETTING',:function_code=>'VIEW_ENTRY_TEMPLATE_ELEMENTS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_entry_template_elements.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'知识模板元素',:description=>'知识模板元素')
    irm_view_entry_template_elements.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Template Element',:description=>'Template Element')
    irm_view_entry_template_elements.save
    irm_create_entry_template_elements= Irm::Function.new(:group_code=>'SKM_SETTING',:function_code=>'CREATE_ENTRY_TEMPLATE_ELEMENTS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_entry_template_elements.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建知识模板元素',:description=>'新建知识模板元素')
    irm_create_entry_template_elements.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Template Element',:description=>'New Template Element')
    irm_create_entry_template_elements.save
    irm_edit_entry_template_elements= Irm::Function.new(:group_code=>'SKM_SETTING',:function_code=>'EDIT_ENTRY_TEMPLATE_ELEMENTS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_entry_template_elements.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑知识模板元素',:description=>'编辑知识模板元素')
    irm_edit_entry_template_elements.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Template Element',:description=>'Edit Template Element')
    irm_edit_entry_template_elements.save
  end

  def self.down
  end
end
