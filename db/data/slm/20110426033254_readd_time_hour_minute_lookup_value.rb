class ReaddTimeHourMinuteLookupValue < ActiveRecord::Migration
  def self.up
     lookup_values = Irm::LookupValue.query_by_lookup_type('SLM_SERVICE_HOUR')
    lookup_values.each do |t|
         hour_zh = Irm::LookupValuesTl.query_by_lookup_value_id(t.id,'zh').first
         hour_zh.delete
         hour_en = Irm::LookupValuesTl.query_by_lookup_value_id(t.id,'en').first
         hour_en.delete
         t.destroy
    end

    lookup_values = Irm::LookupValue.query_by_lookup_type('SLM_SERVICE_MINUTE')
    lookup_values.each do |t1|
         hour_zh = Irm::LookupValuesTl.query_by_lookup_value_id(t1.id,'zh').first
         hour_zh.delete
         hour_en = Irm::LookupValuesTl.query_by_lookup_value_id(t1.id,'en').first
         hour_en.delete
        t1.delete
    end

     #======hour
    slm_service_hour_0= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_HOUR',:lookup_code=>'0',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_hour_0.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_0.id,:meaning=>'0',:description=>'0',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_0.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_0.id,:meaning=>'0',:description=>'0',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_0.save
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

    #======minute            ====
     slm_service_minute_0= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'0',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_0.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_0.id,:meaning=>'0',:description=>'0',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_0.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_0.id,:meaning=>'0',:description=>'0',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_0.save
     slm_service_minute_1= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'1',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_1.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_1.id,:meaning=>'1',:description=>'1',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_1.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_1.id,:meaning=>'1',:description=>'1',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_1.save
    slm_service_minute_2= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'2',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_2.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_2.id,:meaning=>'2',:description=>'2',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_2.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_2.id,:meaning=>'2',:description=>'2',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_2.save
    slm_service_minute_3= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'3',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_3.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_3.id,:meaning=>'3',:description=>'3',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_3.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_3.id,:meaning=>'3',:description=>'3',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_3.save
    slm_service_minute_4= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'4',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_4.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_4.id,:meaning=>'4',:description=>'4',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_4.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_4.id,:meaning=>'4',:description=>'4',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_4.save
    slm_service_minute_5= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'5',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_5.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_5.id,:meaning=>'5',:description=>'5',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_5.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_5.id,:meaning=>'5',:description=>'5',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_5.save
    slm_service_minute_6= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'6',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_6.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_6.id,:meaning=>'6',:description=>'6',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_6.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_6.id,:meaning=>'6',:description=>'6',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_6.save
    slm_service_minute_7= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'7',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_7.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_7.id,:meaning=>'7',:description=>'7',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_7.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_7.id,:meaning=>'7',:description=>'7',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_7.save
    slm_service_minute_8= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'8',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_8.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_8.id,:meaning=>'8',:description=>'8',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_8.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_8.id,:meaning=>'8',:description=>'8',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_8.save
    slm_service_minute_9= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'9',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_9.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_9.id,:meaning=>'9',:description=>'9',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_9.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_9.id,:meaning=>'9',:description=>'9',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_9.save
    slm_service_minute_10= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'10',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_10.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_10.id,:meaning=>'10',:description=>'10',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_10.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_10.id,:meaning=>'10',:description=>'10',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_10.save
    slm_service_minute_11= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'11',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_11.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_11.id,:meaning=>'11',:description=>'11',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_11.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_11.id,:meaning=>'11',:description=>'11',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_11.save
    slm_service_minute_12= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'12',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_12.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_12.id,:meaning=>'12',:description=>'12',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_12.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_12.id,:meaning=>'12',:description=>'12',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_12.save
    slm_service_minute_13= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'13',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_13.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_13.id,:meaning=>'13',:description=>'13',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_13.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_13.id,:meaning=>'13',:description=>'13',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_13.save
    slm_service_minute_14= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'14',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_14.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_14.id,:meaning=>'14',:description=>'14',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_14.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_14.id,:meaning=>'14',:description=>'14',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_14.save
    slm_service_minute_15= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'15',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_15.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_15.id,:meaning=>'15',:description=>'15',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_15.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_15.id,:meaning=>'15',:description=>'15',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_15.save
    slm_service_minute_16= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'16',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_16.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_16.id,:meaning=>'16',:description=>'16',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_16.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_16.id,:meaning=>'16',:description=>'16',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_16.save
    slm_service_minute_17= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'17',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_17.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_17.id,:meaning=>'17',:description=>'17',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_17.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_17.id,:meaning=>'17',:description=>'17',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_17.save
    slm_service_minute_18= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'18',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_18.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_18.id,:meaning=>'18',:description=>'18',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_18.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_18.id,:meaning=>'18',:description=>'18',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_18.save
    slm_service_minute_19= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'19',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_19.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_19.id,:meaning=>'19',:description=>'19',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_19.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_19.id,:meaning=>'19',:description=>'19',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_19.save
    slm_service_minute_20= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'20',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_20.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_20.id,:meaning=>'20',:description=>'20',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_20.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_20.id,:meaning=>'20',:description=>'20',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_20.save
    slm_service_minute_21= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'21',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_21.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_21.id,:meaning=>'21',:description=>'21',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_21.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_21.id,:meaning=>'21',:description=>'21',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_21.save
    slm_service_minute_22= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'22',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_22.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_22.id,:meaning=>'22',:description=>'22',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_22.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_22.id,:meaning=>'22',:description=>'22',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_22.save
    slm_service_minute_23= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'23',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_23.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_23.id,:meaning=>'23',:description=>'23',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_23.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_23.id,:meaning=>'23',:description=>'23',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_23.save
    slm_service_minute_24= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'24',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_24.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_24.id,:meaning=>'24',:description=>'24',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_24.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_24.id,:meaning=>'24',:description=>'24',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_24.save
    slm_service_minute_25= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'25',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_25.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_15.id,:meaning=>'25',:description=>'25',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_25.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_15.id,:meaning=>'25',:description=>'25',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_25.save
    slm_service_minute_26= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'26',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_26.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_16.id,:meaning=>'26',:description=>'26',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_26.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_16.id,:meaning=>'26',:description=>'26',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_26.save
    slm_service_minute_27= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'27',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_27.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_17.id,:meaning=>'27',:description=>'27',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_27.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_17.id,:meaning=>'27',:description=>'27',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_27.save
    slm_service_minute_28= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'28',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_28.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_18.id,:meaning=>'28',:description=>'28',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_28.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_18.id,:meaning=>'28',:description=>'28',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_28.save
    slm_service_minute_29= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'29',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_29.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_19.id,:meaning=>'29',:description=>'29',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_29.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_19.id,:meaning=>'29',:description=>'29',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_29.save
    slm_service_minute_30= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'30',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_30.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_20.id,:meaning=>'30',:description=>'30',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_30.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_20.id,:meaning=>'30',:description=>'30',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_30.save
    slm_service_minute_31= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'31',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_31.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_31.id,:meaning=>'31',:description=>'31',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_31.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_31.id,:meaning=>'31',:description=>'31',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_31.save
    slm_service_minute_32= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'32',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_32.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_32.id,:meaning=>'32',:description=>'32',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_32.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_32.id,:meaning=>'32',:description=>'32',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_32.save
    slm_service_minute_33= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'33',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_33.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_33.id,:meaning=>'33',:description=>'33',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_33.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_33.id,:meaning=>'33',:description=>'33',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_33.save
    slm_service_minute_34= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'34',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_34.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_34.id,:meaning=>'34',:description=>'34',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_34.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_34.id,:meaning=>'34',:description=>'34',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_34.save
    slm_service_minute_35= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'35',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_35.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_35.id,:meaning=>'35',:description=>'35',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_35.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_35.id,:meaning=>'35',:description=>'35',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_35.save
    slm_service_minute_36= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'36',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_36.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_36.id,:meaning=>'36',:description=>'36',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_36.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_36.id,:meaning=>'36',:description=>'36',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_36.save
    slm_service_minute_37= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'37',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_37.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_37.id,:meaning=>'37',:description=>'37',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_37.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_37.id,:meaning=>'37',:description=>'37',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_37.save
    slm_service_minute_38= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'38',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_38.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_38.id,:meaning=>'38',:description=>'38',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_38.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_38.id,:meaning=>'38',:description=>'38',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_38.save
    slm_service_minute_39= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'39',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_39.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_39.id,:meaning=>'39',:description=>'39',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_39.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_39.id,:meaning=>'39',:description=>'39',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_39.save
    slm_service_minute_40= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'30',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_40.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_40.id,:meaning=>'40',:description=>'40',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_40.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_40.id,:meaning=>'40',:description=>'40',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_40.save
    slm_service_minute_41= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'41',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_41.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_41.id,:meaning=>'41',:description=>'41',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_41.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_41.id,:meaning=>'41',:description=>'41',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_41.save
    slm_service_minute_42= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'42',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_42.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_42.id,:meaning=>'42',:description=>'42',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_42.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_42.id,:meaning=>'42',:description=>'42',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_42.save
    slm_service_minute_43= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'43',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_43.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_43.id,:meaning=>'43',:description=>'43',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_43.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_43.id,:meaning=>'43',:description=>'43',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_43.save
    slm_service_minute_44= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'44',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_44.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_44.id,:meaning=>'44',:description=>'44',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_44.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_44.id,:meaning=>'44',:description=>'44',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_44.save
    slm_service_minute_45= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'45',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_45.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_45.id,:meaning=>'45',:description=>'45',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_45.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_45.id,:meaning=>'45',:description=>'45',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_45.save
    slm_service_minute_46= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'46',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_46.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_46.id,:meaning=>'46',:description=>'46',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_46.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_46.id,:meaning=>'46',:description=>'46',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_46.save
    slm_service_minute_47= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'47',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_47.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_47.id,:meaning=>'47',:description=>'47',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_47.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_47.id,:meaning=>'47',:description=>'47',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_47.save
    slm_service_minute_48= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'48',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_48.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_48.id,:meaning=>'48',:description=>'48',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_48.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_48.id,:meaning=>'48',:description=>'48',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_48.save
    slm_service_minute_49= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'49',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_49.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_49.id,:meaning=>'49',:description=>'49',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_49.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_49.id,:meaning=>'49',:description=>'49',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_49.save
    slm_service_minute_50= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'50',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_50.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_50.id,:meaning=>'50',:description=>'50',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_50.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_50.id,:meaning=>'50',:description=>'50',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_50.save
    slm_service_minute_51= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'51',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_51.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_51.id,:meaning=>'51',:description=>'51',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_51.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_51.id,:meaning=>'51',:description=>'51',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_51.save
    slm_service_minute_52= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'52',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_52.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_52.id,:meaning=>'52',:description=>'52',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_52.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_52.id,:meaning=>'52',:description=>'52',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_52.save
    slm_service_minute_53= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'53',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_53.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_53.id,:meaning=>'53',:description=>'53',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_53.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_53.id,:meaning=>'53',:description=>'53',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_53.save
    slm_service_minute_54= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'54',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_54.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_54.id,:meaning=>'54',:description=>'54',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_54.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_54.id,:meaning=>'54',:description=>'54',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_54.save
    slm_service_minute_55= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'55',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_55.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_55.id,:meaning=>'55',:description=>'55',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_55.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_55.id,:meaning=>'55',:description=>'55',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_55.save
    slm_service_minute_56= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'56',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_56.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_56.id,:meaning=>'56',:description=>'56',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_56.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_56.id,:meaning=>'56',:description=>'56',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_56.save
    slm_service_minute_57= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'57',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_57.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_57.id,:meaning=>'57',:description=>'57',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_57.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_57.id,:meaning=>'57',:description=>'57',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_57.save
    slm_service_minute_58= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'58',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_58.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_58.id,:meaning=>'58',:description=>'58',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_58.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_58.id,:meaning=>'58',:description=>'58',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_58.save
    slm_service_minute_59= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'59',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_59.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_59.id,:meaning=>'59',:description=>'59',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_59.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_59.id,:meaning=>'59',:description=>'59',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_59.save
    slm_service_minute_60= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'60',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_60.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_60.id,:meaning=>'60',:description=>'60',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_60.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_60.id,:meaning=>'60',:description=>'60',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_60.save
  end

  def self.down
  end
end
