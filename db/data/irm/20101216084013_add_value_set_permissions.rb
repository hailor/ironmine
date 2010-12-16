class AddValueSetPermissions < ActiveRecord::Migration
  def self.up
    irm_value_sets_index = Irm::Permission.new(:permission_code=>'IRM_VALUE_SETS_INDEX',
                                             :page_controller=>'irm/value_sets',
                                             :page_action=>'index',
                                             :not_auto_mult=>true)
    irm_value_sets_index.permissions_tls.build(:language=>'zh',:name=>'值集',:description=>'值集',:source_lang=>'en')
    irm_value_sets_index.permissions_tls.build(:language=>'en',:name=>'Value Sets',:description=>'Value Sets',:source_lang=>'en')
    irm_value_sets_index.save

    irm_value_sets_edit = Irm::Permission.new(:permission_code=>'IRM_VALUE_SETS_EDIT',
                                             :page_controller=>'irm/value_sets',
                                             :page_action=>'edit',
                                             :not_auto_mult=>true)
    irm_value_sets_edit.permissions_tls.build(:language=>'zh',:name=>'编辑值集',:description=>'编辑值集',:source_lang=>'en')
    irm_value_sets_edit.permissions_tls.build(:language=>'en',:name=>'Edit Value Set',:description=>'Edit Value Set',:source_lang=>'en')
    irm_value_sets_edit.save

    irm_value_sets_new = Irm::Permission.new(:permission_code=>'IRM_VALUE_SETS_NEW',
                                             :page_controller=>'irm/value_sets',
                                             :page_action=>'new',
                                             :not_auto_mult=>true)
    irm_value_sets_new.permissions_tls.build(:language=>'zh',:name=>'创建值集',:description=>'创建值集',:source_lang=>'en')
    irm_value_sets_new.permissions_tls.build(:language=>'en',:name=>'Create Value Set',:description=>'Create Value Set',:source_lang=>'en')
    irm_value_sets_new.save

    irm_flex_values_index = Irm::Permission.new(:permission_code=>'IRM_FLEX_VALUES_INDEX',
                                             :page_controller=>'irm/flex_values',
                                             :page_action=>'index',
                                             :not_auto_mult=>true)
    irm_flex_values_index.permissions_tls.build(:language=>'zh',:name=>'值',:description=>'值',:source_lang=>'en')
    irm_flex_values_index.permissions_tls.build(:language=>'en',:name=>'Flex Values',:description=>'Flex Values',:source_lang=>'en')
    irm_flex_values_index.save    
  end

  def self.down
  end
end
