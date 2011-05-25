# -*- coding: utf-8 -*-
class InitWfProcessEditabilityLookup < ActiveRecord::Migration
  def self.up
    wf_process_record_editability=Irm::LookupType.new(:lookup_level=>'GLOBAL',:lookup_type=>'WF_PROCESS_RECORD_EDITABILITY',:status_code=>'ENABLED',:not_auto_mult=>true)
    wf_process_record_editability.lookup_types_tls.build(:lookup_type_id=>wf_process_record_editability.id,:meaning=>'审批流程记录编辑性',:description=>'审批流程记录编辑性',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    wf_process_record_editability.lookup_types_tls.build(:lookup_type_id=>wf_process_record_editability.id,:meaning=>'Process record editability',:description=>'Process record editability',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    wf_process_record_editability.save

    wf_process_record_editabilityonly_admin= Irm::LookupValue.new(:lookup_type=>'WF_PROCESS_RECORD_EDITABILITY',:lookup_code=>'ONLY_ADMIN',:start_date_active=>'2011-05-11',:status_code=>'ENABLED',:not_auto_mult=>true)
    wf_process_record_editabilityonly_admin.lookup_values_tls.build(:lookup_value_id=>wf_process_record_editabilityonly_admin.id,:meaning=>'只管理员可在批准过程中编辑记录。',:description=>'只管理员可在批准过程中编辑记录。',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    wf_process_record_editabilityonly_admin.lookup_values_tls.build(:lookup_value_id=>wf_process_record_editabilityonly_admin.id,:meaning=>'Only admin can edit the record',:description=>'Only admin can edit the record',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    wf_process_record_editabilityonly_admin.save
    wf_process_record_editabilityadmin_approver= Irm::LookupValue.new(:lookup_type=>'WF_PROCESS_RECORD_EDITABILITY',:lookup_code=>'ADMIN_APPROVER',:start_date_active=>'2011-05-11',:status_code=>'ENABLED',:not_auto_mult=>true)
    wf_process_record_editabilityadmin_approver.lookup_values_tls.build(:lookup_value_id=>wf_process_record_editabilityadmin_approver.id,:meaning=>'管理员或当前分配的批准人可在批准过程中编辑记录。',:description=>'管理员或当前分配的批准人可在批准过程中编辑记录。',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    wf_process_record_editabilityadmin_approver.lookup_values_tls.build(:lookup_value_id=>wf_process_record_editabilityadmin_approver.id,:meaning=>'Admin and approver can edit the record',:description=>'Admin and approver can edit the record',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    wf_process_record_editabilityadmin_approver.save
  end

  def self.down
  end
end
