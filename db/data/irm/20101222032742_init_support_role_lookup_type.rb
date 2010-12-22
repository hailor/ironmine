class InitSupportRoleLookupType < ActiveRecord::Migration
  def self.up
     support_role_lookup_type=Irm::LookupType.new(:lookup_level=>'GLOBAL',
                                         :lookup_type=>'IRM_SUPPORT_ROLE',
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    support_role_lookup_type.lookup_types_tls.build(:lookup_type_id=>support_role_lookup_type.id,
                                            :meaning=>"支持组所在的角色",
                                            :description=>"支持组所在的角色",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    support_role_lookup_type.lookup_types_tls.build(:lookup_type_id=>support_role_lookup_type.id,
                                            :meaning=>"support role of support_group",
                                            :description=>"support role of support_group",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    support_role_lookup_type.save
    #服务台
    sd_lookup_value=Irm::LookupValue.new(:lookup_type=>'IRM_SUPPORT_ROLE',
                                         :lookup_code=>"SERVICE_DESK",
                                         :start_date_active=>Time.now,
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    sd_lookup_value.lookup_values_tls.build(:lookup_value_id=>sd_lookup_value.id,
                                            :meaning=>"Service Desk",
                                            :description=>"Service Desk",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    sd_lookup_value.lookup_values_tls.build(:lookup_value_id=>sd_lookup_value.id,
                                            :meaning=>"服务台",
                                            :description=>"服务台",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")

    sd_lookup_value.save
    #一线
    one_lookup_value=Irm::LookupValue.new(:lookup_type=>'IRM_SUPPORT_ROLE',
                                         :lookup_code=>"ONE_LINE",
                                         :start_date_active=>Time.now,
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    one_lookup_value.lookup_values_tls.build(:lookup_value_id=>one_lookup_value.id,
                                            :meaning=>"One Line",
                                            :description=>"One Line",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    one_lookup_value.lookup_values_tls.build(:lookup_value_id=>one_lookup_value.id,
                                            :meaning=>"一线",
                                            :description=>"一线",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")

    one_lookup_value.save
    #二线
    two_lookup_value=Irm::LookupValue.new(:lookup_type=>'IRM_SUPPORT_ROLE',
                                         :lookup_code=>"TWO_LINE",
                                         :start_date_active=>Time.now,
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    two_lookup_value.lookup_values_tls.build(:lookup_value_id=>two_lookup_value.id,
                                            :meaning=>"Two Line",
                                            :description=>"Two Line",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    two_lookup_value.lookup_values_tls.build(:lookup_value_id=>two_lookup_value.id,
                                            :meaning=>"二线",
                                            :description=>"二线",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")

    two_lookup_value.save
    #三线
    three_lookup_value=Irm::LookupValue.new(:lookup_type=>'IRM_SUPPORT_ROLE',
                                         :lookup_code=>"THREE_LINE",
                                         :start_date_active=>Time.now,
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    three_lookup_value.lookup_values_tls.build(:lookup_value_id=>three_lookup_value.id,
                                            :meaning=>"Three Line",
                                            :description=>"Three Line",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    three_lookup_value.lookup_values_tls.build(:lookup_value_id=>three_lookup_value.id,
                                            :meaning=>"三线",
                                            :description=>"三线",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")

    three_lookup_value.save    
    #行业
    profession_lookup_value=Irm::LookupValue.new(:lookup_type=>'IRM_SUPPORT_ROLE',
                                         :lookup_code=>"PROFESSION_LINE",
                                         :start_date_active=>Time.now,
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    profession_lookup_value.lookup_values_tls.build(:lookup_value_id=>profession_lookup_value.id,
                                            :meaning=>"Profession Line",
                                            :description=>"Profession Line",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    profession_lookup_value.lookup_values_tls.build(:lookup_value_id=>profession_lookup_value.id,
                                            :meaning=>"行业",
                                            :description=>"行业",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")

    profession_lookup_value.save
  end

  def self.down
    #delete lookup type
    system_status_lookup_type= Irm::LookupType.where(:lookup_type=>"IRM_SUPPORT_ROLE").first
    Irm::LookupTypesTl.where(:lookup_type_id=>system_status_lookup_type.id).each do |t1|
      t1.delete
    end

    #delete lookup code
    Irm::LookupType.where(:lookup_type=>"IRM_SUPPORT_ROLE").each do |lookup_code|
       Irm::LookupValuesTl.where(:lookup_value_id=>lookup_code.id).each do |lookup_code_tl|
         lookup_code_tl.delete
       end
       lookup_code.delete
    end
  end
end
