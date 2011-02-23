class AddRoleTypeLookupcode < ActiveRecord::Migration
  def self.up
    irm_role_type=Irm::LookupType.new(:lookup_level=>'GLOBAL',:lookup_type=>'IRM_ROLE_TYPE',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_role_type.lookup_types_tls.build(:lookup_type_id=>irm_role_type.id,:meaning=>'角色类型',:description=>'角色类型',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_role_type.lookup_types_tls.build(:lookup_type_id=>irm_role_type.id,:meaning=>'Role type',:description=>'Role type',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_role_type.save

    irm_role_typesetting= Irm::LookupValue.new(:lookup_type=>'IRM_ROLE_TYPE',:lookup_code=>'SETTING',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_role_typesetting.lookup_values_tls.build(:lookup_value_id=>irm_role_typesetting.id,:meaning=>'设置',:description=>'设置',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_role_typesetting.lookup_values_tls.build(:lookup_value_id=>irm_role_typesetting.id,:meaning=>'Setting',:description=>'Bussinuss',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_role_typesetting.save

    irm_role_typebussiness= Irm::LookupValue.new(:lookup_type=>'IRM_ROLE_TYPE',:lookup_code=>'BUSSINESS',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_role_typebussiness.lookup_values_tls.build(:lookup_value_id=>irm_role_typebussiness.id,:meaning=>'业务',:description=>'业务',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_role_typebussiness.lookup_values_tls.build(:lookup_value_id=>irm_role_typebussiness.id,:meaning=>'Setting',:description=>'Bussinuss',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_role_typebussiness.save

    irm_role_typehidden= Irm::LookupValue.new(:lookup_type=>'IRM_ROLE_TYPE',:lookup_code=>'HIDDEN',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_role_typehidden.lookup_values_tls.build(:lookup_value_id=>irm_role_typehidden.id,:meaning=>'后台角色',:description=>'后台角色',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_role_typehidden.lookup_values_tls.build(:lookup_value_id=>irm_role_typehidden.id,:meaning=>'Hidden',:description=>'Hidden',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_role_typehidden.save

  end

  def self.down
    irm_role_type=Irm::LookupType.where(:lookup_level=>'GLOBAL',:lookup_type=>'IRM_ROLE_TYPE')
    irm_role_type.destroy if irm_role_type
  end
end
