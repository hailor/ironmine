class AddSlmLookupValue < ActiveRecord::Migration
  def self.up
    slm_service_hour_0= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_HOUR',:lookup_code=>'0',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_hour_0.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_0.id,:meaning=>'0',:description=>'0',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_0.lookup_values_tls.build(:lookup_value_id=>slm_service_hour_0.id,:meaning=>'0',:description=>'0',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_hour_0.save
    slm_service_minute_0= Irm::LookupValue.new(:lookup_type=>'SLM_SERVICE_MINUTE',:lookup_code=>'0',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_service_minute_0.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_0.id,:meaning=>'0',:description=>'0',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_0.lookup_values_tls.build(:lookup_value_id=>slm_service_minute_0.id,:meaning=>'0',:description=>'0',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_service_minute_0.save
  end

  def self.down
  end
end
