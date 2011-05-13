# -*- coding: utf-8 -*-
class InitWfFieldUpdateMenuFunction < ActiveRecord::Migration
  def self.up
    irm_menu_entiry_44= Irm::MenuEntry.new(:menu_code=>'WORKFLOW',:sub_menu_code=>nil,:page_controller=>'irm/wf_field_updates',:display_sequence=>60,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_44.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'字段更新',:description=>'字段更新')
    irm_menu_entiry_44.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Field Update',:description=>'Field Update')
    irm_menu_entiry_44.save
    irm_view_wf_field_updates= Irm::Function.new(:group_code=>'IRM_WORKFLOW',:function_code=>'VIEW_WF_FIELD_UPDATES',:default_flag=>'N',:login_flag => 'N', :public_flag=>'N',:not_auto_mult=>true)
    irm_view_wf_field_updates.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'字段更新',:description=>'字段更新')
    irm_view_wf_field_updates.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Field Update',:description=>'Field Update')
    irm_view_wf_field_updates.save
    irm_create_wf_field_updates= Irm::Function.new(:group_code=>'IRM_WORKFLOW',:function_code=>'CREATE_WF_FIELD_UPDATES',:default_flag=>'N',:login_flag => 'N', :public_flag=>'N',:not_auto_mult=>true)
    irm_create_wf_field_updates.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建字段更新',:description=>'新建字段更新')
    irm_create_wf_field_updates.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Create Field Update',:description=>'Create Field Update')
    irm_create_wf_field_updates.save
    irm_edit_wf_field_updates= Irm::Function.new(:group_code=>'IRM_WORKFLOW',:function_code=>'EDIT_WF_FIELD_UPDATES',:default_flag=>'N',:login_flag => 'N', :public_flag=>'N',:not_auto_mult=>true)
    irm_edit_wf_field_updates.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑字段更新',:description=>'编辑字段更新')
    irm_edit_wf_field_updates.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Field Update',:description=>'Edit Field Update')
    irm_edit_wf_field_updates.save
  end

  def self.down
  end
end
