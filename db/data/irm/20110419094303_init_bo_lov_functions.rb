# -*- coding: utf-8 -*-
class InitBoLovFunctions < ActiveRecord::Migration
  def self.up
    irm_irm_dev_business_object= Irm::FunctionGroup.new(:group_code=>'IRM_DEV_BUSINESS_OBJECT',:not_auto_mult=>true)
    irm_irm_dev_business_object.function_groups_tls.build(:language=>'zh',:source_lang=>'en',:name=>'开发人员-业务对像',:description=>'开发人员-业务对像')
    irm_irm_dev_business_object.function_groups_tls.build(:language=>'en',:source_lang=>'en',:name=>'Developer-Business Object',:description=>'Developer-Business Object')
    irm_irm_dev_business_object.save
    
    irm_view_business_objects= Irm::Function.new(:group_code=>'IRM_DEV_BUSINESS_OBJECT',:function_code=>'VIEW_BUSINESS_OBJECTS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_business_objects.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'业务对像',:description=>'业务对像')
    irm_view_business_objects.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Business Object',:description=>'Business Object')
    irm_view_business_objects.save
    irm_create_business_objects= Irm::Function.new(:group_code=>'IRM_DEV_BUSINESS_OBJECT',:function_code=>'CREATE_BUSINESS_OBJECTS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_business_objects.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建业务对像',:description=>'新建业务对像')
    irm_create_business_objects.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Create Business Object',:description=>'Create Business Object')
    irm_create_business_objects.save
    irm_edit_business_objects= Irm::Function.new(:group_code=>'IRM_DEV_BUSINESS_OBJECT',:function_code=>'EDIT_BUSINESS_OBJECTS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_business_objects.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑业务对像',:description=>'编辑业务对像')
    irm_edit_business_objects.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Business Object',:description=>'Edit Business Object')
    irm_edit_business_objects.save
    irm_view_list_of_values= Irm::Function.new(:group_code=>'IRM_DEV_BUSINESS_OBJECT',:function_code=>'VIEW_LIST_OF_VALUES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_list_of_values.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'值列表',:description=>'值列表')
    irm_view_list_of_values.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'List of Value',:description=>'List of Value')
    irm_view_list_of_values.save
    irm_create_list_of_values= Irm::Function.new(:group_code=>'IRM_DEV_BUSINESS_OBJECT',:function_code=>'CREATE_LIST_OF_VALUES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_list_of_values.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建值列表',:description=>'新建值列表')
    irm_create_list_of_values.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Create List of Value',:description=>'Create List of Value')
    irm_create_list_of_values.save
    irm_edit_list_of_values= Irm::Function.new(:group_code=>'IRM_DEV_BUSINESS_OBJECT',:function_code=>'EDIT_LIST_OF_VALUES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_list_of_values.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑值列表',:description=>'编辑值列表')
    irm_edit_list_of_values.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit List of Value',:description=>'Edit List of Value')
    irm_edit_list_of_values.save
  end

  def self.down
  end
end
