# -*- coding: utf-8 -*-
class InitTimeHourLookupValue < ActiveRecord::Migration
  def self.up
    slm_service_hour=Irm::LookupType.new(:lookup_level=>'GLOBAL',:lookup_type=>'SLM_SERVICE_HOUR',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_hour.lookup_types_tls.build(:lookup_type_id=>slm_service_hour.id,:meaning=>'服务小时选择',:description=>'服务小时选择',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour.lookup_types_tls.build(:lookup_type_id=>slm_service_hour.id,:meaning=>'SERVICE HOUR CHOICE',:description=>'SERVICE HOUR CHOICE',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour.save

    slm_service_hour_1= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_HOUR',:lookup_code=>'1',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_hour_1.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_1.id,:meaning=>'1',:description=>'1',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_1.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_1.id,:meaning=>'1',:description=>'1',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_1.save
    slm_service_hour_2= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_HOUR',:lookup_code=>'2',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_hour_2.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_2.id,:meaning=>'2',:description=>'2',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_2.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_2.id,:meaning=>'2',:description=>'2',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_2.save
    slm_service_hour_3= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_HOUR',:lookup_code=>'3',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_hour_3.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_3.id,:meaning=>'3',:description=>'3',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_3.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_3.id,:meaning=>'3',:description=>'3',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_3.save
    slm_service_hour_4= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_HOUR',:lookup_code=>'4',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_hour_4.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_4.id,:meaning=>'4',:description=>'4',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_4.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_4.id,:meaning=>'4',:description=>'4',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_4.save
    slm_service_hour_5= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_HOUR',:lookup_code=>'5',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_hour_5.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_5.id,:meaning=>'5',:description=>'5',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_5.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_5.id,:meaning=>'5',:description=>'5',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_5.save
    slm_service_hour_6= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_HOUR',:lookup_code=>'6',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_hour_6.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_6.id,:meaning=>'6',:description=>'6',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_6.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_6.id,:meaning=>'6',:description=>'6',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_6.save
    slm_service_hour_7= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_HOUR',:lookup_code=>'7',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_hour_7.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_7.id,:meaning=>'7',:description=>'7',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_7.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_7.id,:meaning=>'7',:description=>'7',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_7.save
    slm_service_hour_8= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_HOUR',:lookup_code=>'8',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_hour_8.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_8.id,:meaning=>'8',:description=>'8',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_8.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_8.id,:meaning=>'8',:description=>'8',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_8.save
    slm_service_hour_9= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_HOUR',:lookup_code=>'9',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_hour_9.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_9.id,:meaning=>'9',:description=>'9',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_9.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_9.id,:meaning=>'9',:description=>'9',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_9.save
    slm_service_hour_10= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_HOUR',:lookup_code=>'10',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_hour_10.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_10.id,:meaning=>'10',:description=>'10',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_10.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_10.id,:meaning=>'10',:description=>'10',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_10.save
    slm_service_hour_11= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_HOUR',:lookup_code=>'11',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_hour_11.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_11.id,:meaning=>'11',:description=>'11',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_11.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_11.id,:meaning=>'11',:description=>'11',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_11.save
    slm_service_hour_12= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_HOUR',:lookup_code=>'12',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_hour_12.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_12.id,:meaning=>'12',:description=>'12',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_12.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_12.id,:meaning=>'12',:description=>'12',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_12.save
    slm_service_hour_13= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_HOUR',:lookup_code=>'13',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_hour_13.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_13.id,:meaning=>'13',:description=>'13',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_13.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_13.id,:meaning=>'13',:description=>'13',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_13.save
    slm_service_hour_14= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_HOUR',:lookup_code=>'14',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_hour_14.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_14.id,:meaning=>'14',:description=>'14',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_14.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_14.id,:meaning=>'14',:description=>'14',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_14.save
    slm_service_hour_15= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_HOUR',:lookup_code=>'15',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_hour_15.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_15.id,:meaning=>'15',:description=>'15',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_15.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_15.id,:meaning=>'15',:description=>'15',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_15.save
    slm_service_hour_16= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_HOUR',:lookup_code=>'16',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_hour_16.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_16.id,:meaning=>'16',:description=>'16',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_16.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_16.id,:meaning=>'16',:description=>'16',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_16.save
    slm_service_hour_17= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_HOUR',:lookup_code=>'17',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_hour_17.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_17.id,:meaning=>'17',:description=>'17',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_17.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_17.id,:meaning=>'17',:description=>'17',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_17.save
    slm_service_hour_18= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_HOUR',:lookup_code=>'18',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_hour_18.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_18.id,:meaning=>'18',:description=>'18',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_18.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_18.id,:meaning=>'18',:description=>'18',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_18.save
    slm_service_hour_19= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_HOUR',:lookup_code=>'19',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_hour_19.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_19.id,:meaning=>'19',:description=>'19',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_19.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_19.id,:meaning=>'19',:description=>'19',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_19.save
    slm_service_hour_20= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_HOUR',:lookup_code=>'20',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_hour_20.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_20.id,:meaning=>'20',:description=>'20',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_20.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_20.id,:meaning=>'20',:description=>'20',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_20.save
    slm_service_hour_21= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_HOUR',:lookup_code=>'21',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_hour_21.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_21.id,:meaning=>'21',:description=>'21',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_21.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_21.id,:meaning=>'21',:description=>'21',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_21.save
    slm_service_hour_22= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_HOUR',:lookup_code=>'22',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_hour_22.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_22.id,:meaning=>'22',:description=>'22',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_22.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_22.id,:meaning=>'22',:description=>'22',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_22.save
    slm_service_hour_23= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_HOUR',:lookup_code=>'23',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_hour_23.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_23.id,:meaning=>'23',:description=>'23',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_23.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_23.id,:meaning=>'23',:description=>'23',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_23.save
    slm_service_hour_24= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_HOUR',:lookup_code=>'24',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_hour_24.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_24.id,:meaning=>'24',:description=>'24',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_24.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_24.id,:meaning=>'24',:description=>'24',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_24.save
  end

  def self.down
  end
end
