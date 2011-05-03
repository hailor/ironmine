# -*- coding: utf-8 -*-
class AddWorkflowRuleLookupCode < ActiveRecord::Migration
  def self.up
    workflow_rule_evaluate_type=Irm::LookupType.new(:lookup_level=>'GLOBAL',:lookup_type=>'WORKFLOW_RULE_EVALUATE_TYPE',:status_code=>'ENABLED',:not_auto_mult=>true)
    workflow_rule_evaluate_type.lookup_types_tls.build(:lookup_type_id=>workflow_rule_evaluate_type.id,:meaning=>'工作流规则触发类型',:description=>'工作流规则触发类型',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    workflow_rule_evaluate_type.lookup_types_tls.build(:lookup_type_id=>workflow_rule_evaluate_type.id,:meaning=>'Workflow rule evaluate type',:description=>'Workflow rule evaluate type',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    workflow_rule_evaluate_type.save
    workflow_rule_evaluate_mode=Irm::LookupType.new(:lookup_level=>'GLOBAL',:lookup_type=>'WORKFLOW_RULE_EVALUATE_MODE',:status_code=>'ENABLED',:not_auto_mult=>true)
    workflow_rule_evaluate_mode.lookup_types_tls.build(:lookup_type_id=>workflow_rule_evaluate_mode.id,:meaning=>'工作流规则触发验证方式',:description=>'工作流规则触发验证方式',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    workflow_rule_evaluate_mode.lookup_types_tls.build(:lookup_type_id=>workflow_rule_evaluate_mode.id,:meaning=>'Workflow rule evaluate mode',:description=>'Workflow rule evaluate mode',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    workflow_rule_evaluate_mode.save
    
    workflow_rule_evaluate_typecreate_edit_first_time= Irm::LookupValue.new(:lookup_type=>'WORKFLOW_RULE_EVALUATE_TYPE',:lookup_code=>'CREATE_EDIT_FIRST_TIME',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    workflow_rule_evaluate_typecreate_edit_first_time.lookup_values_tls.build(:lookup_value_id=>workflow_rule_evaluate_typecreate_edit_first_time.id,:meaning=>'当创建或编辑记录且原先未曾达到规则条件',:description=>'当创建或编辑记录且原先未曾达到规则条件',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    workflow_rule_evaluate_typecreate_edit_first_time.lookup_values_tls.build(:lookup_value_id=>workflow_rule_evaluate_typecreate_edit_first_time.id,:meaning=>'When a record is created,or when a record is edited,first time',:description=>'When a record is created, or when a record is edited and did not previously meet the rule criteria',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    workflow_rule_evaluate_typecreate_edit_first_time.save
    workflow_rule_evaluate_typeonly_create= Irm::LookupValue.new(:lookup_type=>'WORKFLOW_RULE_EVALUATE_TYPE',:lookup_code=>'ONLY_CREATE',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    workflow_rule_evaluate_typeonly_create.lookup_values_tls.build(:lookup_value_id=>workflow_rule_evaluate_typeonly_create.id,:meaning=>'仅创建记录时',:description=>'仅创建记录时',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    workflow_rule_evaluate_typeonly_create.lookup_values_tls.build(:lookup_value_id=>workflow_rule_evaluate_typeonly_create.id,:meaning=>'Only when a record is created',:description=>'Only when a record is created',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    workflow_rule_evaluate_typeonly_create.save
    workflow_rule_evaluate_typecreate_edit_every_time= Irm::LookupValue.new(:lookup_type=>'WORKFLOW_RULE_EVALUATE_TYPE',:lookup_code=>'CREATE_EDIT_EVERY_TIME',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    workflow_rule_evaluate_typecreate_edit_every_time.lookup_values_tls.build(:lookup_value_id=>workflow_rule_evaluate_typecreate_edit_every_time.id,:meaning=>'每一次创建或更新记录时',:description=>'每一次创建或更新记录时',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    workflow_rule_evaluate_typecreate_edit_every_time.lookup_values_tls.build(:lookup_value_id=>workflow_rule_evaluate_typecreate_edit_every_time.id,:meaning=>'Every time a record is created or edited',:description=>'Every time a record is created or edited',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    workflow_rule_evaluate_typecreate_edit_every_time.save
    workflow_rule_evaluate_modefilter= Irm::LookupValue.new(:lookup_type=>'WORKFLOW_RULE_EVALUATE_MODE',:lookup_code=>'FILTER',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    workflow_rule_evaluate_modefilter.lookup_values_tls.build(:lookup_value_id=>workflow_rule_evaluate_modefilter.id,:meaning=>'过滤条件',:description=>'过滤条件',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    workflow_rule_evaluate_modefilter.lookup_values_tls.build(:lookup_value_id=>workflow_rule_evaluate_modefilter.id,:meaning=>'Filter',:description=>'Filter',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    workflow_rule_evaluate_modefilter.save
    workflow_rule_evaluate_modeformula= Irm::LookupValue.new(:lookup_type=>'WORKFLOW_RULE_EVALUATE_MODE',:lookup_code=>'FORMULA',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    workflow_rule_evaluate_modeformula.lookup_values_tls.build(:lookup_value_id=>workflow_rule_evaluate_modeformula.id,:meaning=>'公式条件',:description=>'公式条件',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    workflow_rule_evaluate_modeformula.lookup_values_tls.build(:lookup_value_id=>workflow_rule_evaluate_modeformula.id,:meaning=>'Formula',:description=>'Formula',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    workflow_rule_evaluate_modeformula.save
  end

  def self.down
  end
end
