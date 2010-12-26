# -*- coding: utf-8 -*-
class AddOpeCatalogValueSetData < ActiveRecord::Migration
  def self.up
    hardware_type=Irm::FlexValueSet.new(    :flex_value_set_name=>'OPERATIONAL_CATALOG_HARDWARE',
                                            :description=>"服务类别中的硬件类别",
                                         :status_code=>'ENABLED')
    hardware_type.save

    hardware_type_value1=Irm::FlexValue.new(:flex_value_set_id => hardware_type.id,
                                             :flex_value=>"OPE_CATALOG_HARDWARE_SERVER",
                                             :display_sequence => 10,
                                             :start_date_active=>Time.now,
                                             :status_code=>'ENABLED',
                                             :not_auto_mult=>true)
    hardware_type_value1.flex_values_tls.build(:flex_value_id=>hardware_type_value1.id,
                                            :flex_value_meaning=>"服务器",
                                            :description=>"服务器",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    hardware_type_value1.flex_values_tls.build(:flex_value_id=>hardware_type_value1.id,
                                            :flex_value_meaning=>"Server",
                                            :description=>"Server",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    hardware_type_value1.save

    hardware_type_value2=Irm::FlexValue.new(:flex_value_set_id => hardware_type.id,
                                             :flex_value=>"OPE_CATALOG_HARDWARE_TERMINAL",
                                             :display_sequence => 20,
                                             :start_date_active=>Time.now,
                                             :status_code=>'ENABLED',
                                             :not_auto_mult=>true)
    hardware_type_value2.flex_values_tls.build(:flex_value_id=>hardware_type_value2.id,
                                            :flex_value_meaning=>"终端机",
                                            :description=>"终端机",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    hardware_type_value2.flex_values_tls.build(:flex_value_id=>hardware_type_value2.id,
                                            :flex_value_meaning=>"Terminal",
                                            :description=>"Terminal",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    hardware_type_value2.save

    system_type=Irm::FlexValueSet.new(:flex_value_set_name=>'OPERATIONAL_CATALOG_SYSTEM',
                                            :description=>"服务类别中的系统类别",
                                   :status_code=>'ENABLED')
    system_type.save

    system_type_value1=Irm::FlexValue.new(:flex_value_set_id=>system_type.id,
                                         :flex_value=>"OPE_CATALOG_SYSTEM_TENGLONG",
                                             :display_sequence => 10,
                                         :start_date_active=>Time.now,
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    system_type_value1.flex_values_tls.build(:flex_value_id=>system_type_value1.id,
                                            :flex_value_meaning=>"腾龙",
                                            :description=>"腾龙",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    system_type_value1.flex_values_tls.build(:flex_value_id=>system_type_value1.id,
                                            :flex_value_meaning=>"腾龙",
                                            :description=>"腾龙",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    system_type_value1.save

    system_type_value2=Irm::FlexValue.new(:flex_value_set_id=>system_type.id,
                                         :flex_value=>"OPE_CATALOG_SYSTEM_ZHIZAO",
                                             :display_sequence => 20,
                                         :start_date_active=>Time.now,
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    system_type_value2.flex_values_tls.build(:flex_value_id=>system_type_value2.id,
                                            :flex_value_meaning=>"制造",
                                            :description=>"制造",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    system_type_value2.flex_values_tls.build(:flex_value_id=>system_type_value2.id,
                                            :flex_value_meaning=>"制造",
                                            :description=>"制造",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    system_type_value2.save

    system_type_value3=Irm::FlexValue.new(:flex_value_set_id=>system_type.id,
                                         :flex_value=>"OPE_CATALOG_SYSTEM_CRM",
                                             :display_sequence => 30,
                                         :start_date_active=>Time.now,
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    system_type_value3.flex_values_tls.build(:flex_value_id=>system_type_value3.id,
                                            :flex_value_meaning=>"CRM",
                                            :description=>"CRM",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    system_type_value3.flex_values_tls.build(:flex_value_id=>system_type_value3.id,
                                            :flex_value_meaning=>"CRM",
                                            :description=>"CRM",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    system_type_value3.save

    module_type=Irm::FlexValueSet.new(:flex_value_set_name=>'OPERATIONAL_CATALOG_MODULE',
                                      :description=>"服务类别中的系统类别",
                                   :status_code=>'ENABLED')
    module_type.save

    module_type_value1=Irm::FlexValue.new(:flex_value_set_id=>module_type.id,
                                         :flex_value=>"OPE_CATALOG_MODULE_ZHIZAO",
                                             :display_sequence => 10,
                                         :start_date_active=>Time.now,
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    module_type_value1.flex_values_tls.build(:flex_value_id=>module_type_value1.id,
                                            :flex_value_meaning=>"制造",
                                            :description=>"制造",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    module_type_value1.flex_values_tls.build(:flex_value_id=>module_type_value1.id,
                                            :flex_value_meaning=>"制造",
                                            :description=>"制造",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    module_type_value1.save

    module_type_value2=Irm::FlexValue.new(:flex_value_set_id=>module_type.id,
                                         :flex_value=>"OPE_CATALOG_MODULE_DESK",
                                             :display_sequence => 20,
                                         :start_date_active=>Time.now,
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    module_type_value2.flex_values_tls.build(:flex_value_id=>module_type_value2.id,
                                            :flex_value_meaning=>"服务台",
                                            :description=>"服务台",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    module_type_value2.flex_values_tls.build(:flex_value_id=>module_type_value2.id,
                                            :flex_value_meaning=>"服务台",
                                            :description=>"服务台",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    module_type_value2.save

    module_type_value3=Irm::FlexValue.new(:flex_value_set_id=>module_type.id,
                                         :flex_value=>"OPE_CATALOG_MODULE_FIN",
                                             :display_sequence => 30,
                                         :start_date_active=>Time.now,
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    module_type_value3.flex_values_tls.build(:flex_value_id=>module_type_value3.id,
                                            :flex_value_meaning=>"财务",
                                            :description=>"财务",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    module_type_value3.flex_values_tls.build(:flex_value_id=>module_type_value3.id,
                                            :flex_value_meaning=>"财务",
                                            :description=>"财务",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    module_type_value3.save

    feature_type=Irm::FlexValueSet.new(:flex_value_set_name=>'OPERATIONAL_CATALOG_FEATURE',
                                            :description=>"服务类别中的功能类别",
                                         :status_code=>'ENABLED')
    feature_type.save

    feature_type_value1=Irm::FlexValue.new(:flex_value_set_id=>feature_type.id,
                                         :flex_value=>"OPE_CATALOG_FEATURE_ORDER",
                                             :display_sequence => 10,
                                         :start_date_active=>Time.now,
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    feature_type_value1.flex_values_tls.build(:flex_value_id=>feature_type_value1.id,
                                            :flex_value_meaning=>"订单",
                                            :description=>"订单",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    feature_type_value1.flex_values_tls.build(:flex_value_id=>feature_type_value1.id,
                                            :flex_value_meaning=>"订单",
                                            :description=>"订单",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    feature_type_value1.save

    feature_type_value2=Irm::FlexValue.new(:flex_value_set_id=>feature_type.id,
                                         :flex_value=>"OPE_CATALOG_FEATURE_GL",
                                             :display_sequence => 20,
                                         :start_date_active=>Time.now,
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    feature_type_value2.flex_values_tls.build(:flex_value_id=>feature_type_value2.id,
                                            :flex_value_meaning=>"总账",
                                            :description=>"总账",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    feature_type_value2.flex_values_tls.build(:flex_value_id=>feature_type_value2.id,
                                            :flex_value_meaning=>"总账",
                                            :description=>"总账",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    feature_type_value2.save    
  end

  def self.down
  end
end
