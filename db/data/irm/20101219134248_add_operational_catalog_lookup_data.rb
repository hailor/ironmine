# -*- coding: utf-8 -*-
class AddOperationalCatalogLookupData < ActiveRecord::Migration
  def self.up
    change_column :irm_flex_values, :position, :integer, :null => true

    operational_catalog_type=Irm::LookupType.new(:lookup_level=>'GLOBAL',
                                         :lookup_type=>'OPERATIONAL_CATALOG_TYPE',
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    operational_catalog_type.lookup_types_tls.build(:lookup_type_id=>operational_catalog_type.id,
                                            :meaning=>"服务类型类别",
                                            :description=>"服务类型类别",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    operational_catalog_type.lookup_types_tls.build(:lookup_type_id=>operational_catalog_type.id,
                                            :meaning=>"Operational Catalogs Type",
                                            :description=>"Operational Catalogs Type",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    operational_catalog_type.save

    operational_catalog_type_value1=Irm::LookupValue.new(:lookup_type=>'OPERATIONAL_CATALOG_TYPE',
                                         :lookup_code=>"OPE_CATALOG_TYPE_HARDWARE",
                                         :start_date_active=>Time.now,
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    operational_catalog_type_value1.lookup_values_tls.build(:lookup_value_id=>operational_catalog_type_value1.id,
                                            :meaning=>"硬件故障",
                                            :description=>"硬件故障",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    operational_catalog_type_value1.lookup_values_tls.build(:lookup_value_id=>operational_catalog_type_value1.id,
                                            :meaning=>"Hardware Fault",
                                            :description=>"Hardware Fault",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    operational_catalog_type_value1.save

    operational_catalog_type_value2=Irm::LookupValue.new(:lookup_type=>'OPERATIONAL_CATALOG_TYPE',
                                         :lookup_code=>"OPE_CATALOG_TYPE_NEW_FEA",
                                         :start_date_active=>Time.now,
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    operational_catalog_type_value2.lookup_values_tls.build(:lookup_value_id=>operational_catalog_type_value2.id,
                                            :meaning=>"新功能申请",
                                            :description=>"新功能申请",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    operational_catalog_type_value2.lookup_values_tls.build(:lookup_value_id=>operational_catalog_type_value2.id,
                                            :meaning=>"New Features",
                                            :description=>"New Features",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    operational_catalog_type_value2.save

    operational_catalog_type_value3=Irm::LookupValue.new(:lookup_type=>'OPERATIONAL_CATALOG_TYPE',
                                         :lookup_code=>"OPE_CATALOG_TYPE_SYSTEM_FA",
                                         :start_date_active=>Time.now,
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    operational_catalog_type_value3.lookup_values_tls.build(:lookup_value_id=>operational_catalog_type_value3.id,
                                            :meaning=>"系统故障",
                                            :description=>"系统故障",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    operational_catalog_type_value3.lookup_values_tls.build(:lookup_value_id=>operational_catalog_type_value3.id,
                                            :meaning=>"System Failure",
                                            :description=>"System Failure",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    operational_catalog_type_value3.save

    hardware_type=Irm::ValueSet.new(    :value_set_code=>'OPERATIONAL_CATALOG_HARDWARE',
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    hardware_type.value_sets_tls.build(:value_set_id=>hardware_type.id,
                                            :name=>"硬件",
                                            :description=>"服务类别中的硬件类别",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    hardware_type.value_sets_tls.build(:value_set_id=>hardware_type.id,
                                            :name=>"Hardware",
                                            :description=>"Hardware In Operational Catalogs",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    hardware_type.save

    hardware_type_value1=Irm::FlexValue.new(:value_set_code=>'OPERATIONAL_CATALOG_HARDWARE',
                                             :value_code=>"OPE_CATALOG_HARDWARE_SERVER",
                                             :start_date_active=>Time.now,
                                             :status_code=>'ENABLED',
                                             :not_auto_mult=>true)
    hardware_type_value1.flex_values_tls.build(:flex_value_id=>hardware_type_value1.id,
                                            :name=>"服务器",
                                            :description=>"服务器",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    hardware_type_value1.flex_values_tls.build(:flex_value_id=>hardware_type_value1.id,
                                            :name=>"Server",
                                            :description=>"Server",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    hardware_type_value1.save

    hardware_type_value2=Irm::FlexValue.new(:value_set_code=>'OPERATIONAL_CATALOG_HARDWARE',
                                             :value_code=>"OPE_CATALOG_HARDWARE_TERMINAL",
                                             :start_date_active=>Time.now,
                                             :status_code=>'ENABLED',
                                             :not_auto_mult=>true)
    hardware_type_value2.flex_values_tls.build(:flex_value_id=>hardware_type_value2.id,
                                            :name=>"终端机",
                                            :description=>"终端机",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    hardware_type_value2.flex_values_tls.build(:flex_value_id=>hardware_type_value2.id,
                                            :name=>"Terminal",
                                            :description=>"Terminal",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    hardware_type_value2.save

    system_type=Irm::ValueSet.new(:value_set_code=>'OPERATIONAL_CATALOG_SYSTEM',
                                   :status_code=>'ENABLED',
                                   :not_auto_mult=>true)
    system_type.value_sets_tls.build(:value_set_id=>system_type.id,
                                            :name=>"系统",
                                            :description=>"服务类别中的系统类别",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    system_type.value_sets_tls.build(:value_set_id=>system_type.id,
                                            :name=>"System",
                                            :description=>"Type SYSTEM In Operational Catalogs",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    system_type.save

    system_type_value1=Irm::FlexValue.new(:value_set_code=>'OPERATIONAL_CATALOG_SYSTEM',
                                         :value_code=>"OPE_CATALOG_SYSTEM_TENGLONG",
                                         :start_date_active=>Time.now,
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    system_type_value1.flex_values_tls.build(:flex_value_id=>system_type_value1.id,
                                            :name=>"腾龙",
                                            :description=>"腾龙",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    system_type_value1.flex_values_tls.build(:flex_value_id=>system_type_value1.id,
                                            :name=>"腾龙",
                                            :description=>"腾龙",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    system_type_value1.save

    system_type_value2=Irm::FlexValue.new(:value_set_code=>'OPERATIONAL_CATALOG_SYSTEM',
                                         :value_code=>"OPE_CATALOG_SYSTEM_ZHIZAO",
                                         :start_date_active=>Time.now,
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    system_type_value2.flex_values_tls.build(:flex_value_id=>system_type_value2.id,
                                            :name=>"制造",
                                            :description=>"制造",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    system_type_value2.flex_values_tls.build(:flex_value_id=>system_type_value2.id,
                                            :name=>"制造",
                                            :description=>"制造",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    system_type_value2.save

    system_type_value3=Irm::FlexValue.new(:value_set_code=>'OPERATIONAL_CATALOG_SYSTEM',
                                         :value_code=>"OPE_CATALOG_SYSTEM_CRM",
                                         :start_date_active=>Time.now,
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    system_type_value3.flex_values_tls.build(:flex_value_id=>system_type_value3.id,
                                            :name=>"CRM",
                                            :description=>"CRM",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    system_type_value3.flex_values_tls.build(:flex_value_id=>system_type_value3.id,
                                            :name=>"CRM",
                                            :description=>"CRM",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    system_type_value3.save

    module_type=Irm::ValueSet.new(:value_set_code=>'OPERATIONAL_CATALOG_MODULE',
                                   :status_code=>'ENABLED',
                                   :not_auto_mult=>true)
    module_type.value_sets_tls.build(:value_set_id=>module_type.id,
                                      :name=>"模块",
                                      :description=>"服务类别中的模块类别",
                                      :language=>"zh",
                                      :status_code=>'ENABLED',
                                      :source_lang=>"en")
    module_type.value_sets_tls.build(:value_set_id=>module_type.id,
                                      :name=>"Module",
                                      :description=>"Type MODULE In Operational Catalogs",
                                      :language=>"en",
                                      :status_code=>'ENABLED',
                                      :source_lang=>"en")
    module_type.save

    module_type_value1=Irm::FlexValue.new(:value_set_code=>'OPERATIONAL_CATALOG_MODULE',
                                         :value_code=>"OPE_CATALOG_MODULE_ZHIZAO",
                                         :start_date_active=>Time.now,
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    module_type_value1.flex_values_tls.build(:flex_value_id=>module_type_value1.id,
                                            :name=>"制造",
                                            :description=>"制造",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    module_type_value1.flex_values_tls.build(:flex_value_id=>module_type_value1.id,
                                            :name=>"制造",
                                            :description=>"制造",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    module_type_value1.save

    module_type_value2=Irm::FlexValue.new(:value_set_code=>'OPERATIONAL_CATALOG_MODULE',
                                         :value_code=>"OPE_CATALOG_MODULE_DESK",
                                         :start_date_active=>Time.now,
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    module_type_value2.flex_values_tls.build(:flex_value_id=>module_type_value2.id,
                                            :name=>"服务台",
                                            :description=>"服务台",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    module_type_value2.flex_values_tls.build(:flex_value_id=>module_type_value2.id,
                                            :name=>"服务台",
                                            :description=>"服务台",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    module_type_value2.save

    module_type_value3=Irm::FlexValue.new(:value_set_code=>'OPERATIONAL_CATALOG_MODULE',
                                         :value_code=>"OPE_CATALOG_MODULE_FIN",
                                         :start_date_active=>Time.now,
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    module_type_value3.flex_values_tls.build(:flex_value_id=>module_type_value3.id,
                                            :name=>"财务",
                                            :description=>"财务",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    module_type_value3.flex_values_tls.build(:flex_value_id=>module_type_value3.id,
                                            :name=>"财务",
                                            :description=>"财务",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    module_type_value3.save

    feature_type=Irm::ValueSet.new(:value_set_code=>'OPERATIONAL_CATALOG_FEATURE',
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    feature_type.value_sets_tls.build(:value_set_id=>feature_type.id,
                                            :name=>"功能",
                                            :description=>"服务类别中的功能类别",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    feature_type.value_sets_tls.build(:value_set_id=>feature_type.id,
                                            :name=>"Module",
                                            :description=>"Type FEATURE In Operational Catalogs",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    feature_type.save

    feature_type_value1=Irm::FlexValue.new(:value_set_code=>'OPERATIONAL_CATALOG_FEATURE',
                                         :value_code=>"OPE_CATALOG_FEATURE_ORDER",
                                         :start_date_active=>Time.now,
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    feature_type_value1.flex_values_tls.build(:flex_value_id=>feature_type_value1.id,
                                            :name=>"订单",
                                            :description=>"订单",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    feature_type_value1.flex_values_tls.build(:flex_value_id=>feature_type_value1.id,
                                            :name=>"订单",
                                            :description=>"订单",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    feature_type_value1.save

    feature_type_value2=Irm::FlexValue.new(:value_set_code=>'OPERATIONAL_CATALOG_FEATURE',
                                         :value_code=>"OPE_CATALOG_FEATURE_GL",
                                         :start_date_active=>Time.now,
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    feature_type_value2.flex_values_tls.build(:flex_value_id=>feature_type_value2.id,
                                            :name=>"总账",
                                            :description=>"总账",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    feature_type_value2.flex_values_tls.build(:flex_value_id=>feature_type_value2.id,
                                            :name=>"总账",
                                            :description=>"总账",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    feature_type_value2.save

  end

  def self.down
    operational_catalog_type= Irm::LookupType.where(:lookup_type=>"OPERATIONAL_CATALOG_TYPE").first
    Irm::LookupTypesTl.where(:lookup_type_id => operational_catalog_type.id).each do |t1|
      t1.delete
    end

    #delete lookup code
    Irm::LookupValue.where(:lookup_type=>"OPERATIONAL_CATALOG_TYPE").each do |lookup_code|
       Irm::LookupValuesTl.where(:lookup_value_id=>lookup_code.id).each do |lookup_code_tl|
         lookup_code_tl.delete
       end
       lookup_code.delete
    end

    operational_catalog_system= Irm::ValueSet.where(:value_set_code=>"OPERATIONAL_CATALOG_SYSTEM").first
    Irm::ValueSetsTl.where(:value_set_id => operational_catalog_system.id).each do |t1|
      t1.delete
    end

    #delete lookup code
    Irm::FlexValue.where(:value_set_code=>"OPERATIONAL_CATALOG_SYSTEM").each do |value_code|
       Irm::FlexValuesTl.where(:flex_value_id=>value_code.id).each do |value_code_tl|
         value_code_tl.delete
       end
       value_code.delete
    end

    operational_catalog_hardware= Irm::ValueSet.where(:value_set_code=>"OPERATIONAL_CATALOG_HARDWARE").first
    Irm::ValueSetsTl.where(:value_set_id => operational_catalog_hardware.id).each do |t1|
      t1.delete
    end

    #delete lookup code
    Irm::FlexValue.where(:value_set_code=>"OPERATIONAL_CATALOG_HARDWARE").each do |value_code|
       Irm::FlexValuesTl.where(:flex_value_id=>value_code.id).each do |value_code_tl|
         value_code_tl.delete
       end
       value_code.delete
    end

    operational_catalog_module= Irm::ValueSet.where(:value_set_code=>"OPERATIONAL_CATALOG_MODULE").first
    Irm::ValueSetsTl.where(:value_set_id => operational_catalog_module.id).each do |t1|
      t1.delete
    end

    #delete lookup code
    Irm::FlexValue.where(:value_set_code=>"OPERATIONAL_CATALOG_MODULE").each do |value_code|
       Irm::FlexValuesTl.where(:flex_value_id=>value_code.id).each do |value_code_tl|
         value_code_tl.delete
       end
       value_code.delete
    end

    operational_catalog_feature= Irm::ValueSet.where(:value_set_code=>"OPERATIONAL_CATALOG_FEATURE").first
    Irm::ValueSetsTl.where(:value_set_id => operational_catalog_feature.id).each do |t1|
      t1.delete
    end

    #delete lookup code
    Irm::FlexValue.where(:value_set_code=>"OPERATIONAL_CATALOG_FEATURE").each do |value_code|
       Irm::FlexValuesTl.where(:flex_value_id=>value_code.id).each do |value_code_tl|
         value_code_tl.delete
       end
       value_code.delete
    end     
  end
end
