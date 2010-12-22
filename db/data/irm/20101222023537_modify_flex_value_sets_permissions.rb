# -*- coding: utf-8 -*-
class ModifyFlexValueSetsPermissions < ActiveRecord::Migration
  def self.up 
    value_sets = Irm::Permission.where(:page_controller => "irm/value_sets")
    value_sets.each do |f|
      f.destroy
    end

    irm_value_sets_index = Irm::Permission.new(:permission_code=>'IRM_VALUE_SETS_INDEX',
                                             :page_controller=>'irm/flex_value_sets',
                                             :page_action=>'index',
                                             :not_auto_mult=>true)
    irm_value_sets_index.permissions_tls.build(:language=>'zh',:name=>'值集',:description=>'值集',:source_lang=>'en')
    irm_value_sets_index.permissions_tls.build(:language=>'en',:name=>'Flex Value Sets',:description=>'Flex Value Sets',:source_lang=>'en')
    irm_value_sets_index.save

    irm_value_sets_edit = Irm::Permission.new(:permission_code=>'IRM_VALUE_SETS_EDIT',
                                             :page_controller=>'irm/flex_value_sets',
                                             :page_action=>'edit',
                                             :not_auto_mult=>true)
    irm_value_sets_edit.permissions_tls.build(:language=>'zh',:name=>'编辑值集',:description=>'编辑值集',:source_lang=>'en')
    irm_value_sets_edit.permissions_tls.build(:language=>'en',:name=>'Edit Flex Value Set',:description=>'Edit Flex Value Set',:source_lang=>'en')
    irm_value_sets_edit.save

    irm_value_sets_new = Irm::Permission.new(:permission_code=>'IRM_VALUE_SETS_NEW',
                                             :page_controller=>'irm/flex_value_sets',
                                             :page_action=>'new',
                                             :not_auto_mult=>true)
    irm_value_sets_new.permissions_tls.build(:language=>'zh',:name=>'创建值集',:description=>'创建值集',:source_lang=>'en')
    irm_value_sets_new.permissions_tls.build(:language=>'en',:name=>'Create Flex Value Set',:description=>'Create Flex Value Set',:source_lang=>'en')
    irm_value_sets_new.save    
  end

  def self.down
  end
end
