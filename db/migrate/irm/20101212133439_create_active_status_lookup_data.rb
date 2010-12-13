class CreateActiveStatusLookupData < ActiveRecord::Migration
  def self.up
    active_lookup_type=Irm::LookupType.new(:lookup_level=>'GLOBAL',
                                         :lookup_type=>'ACTIVE_STATUS',
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    active_lookup_type.lookup_types_tls.build(:lookup_type_id=>active_lookup_type.id,
                                            :meaning=>"可用",
                                            :description=>"可用",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    active_lookup_type.lookup_types_tls.build(:lookup_type_id=>active_lookup_type.id,
                                            :meaning=>"Active",
                                            :description=>"Active",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    active_lookup_type.save

    enabled_lookup_value=Irm::LookupValue.new(:lookup_type=>'ACTIVE_STATUS',
                                         :lookup_code=>"ENABLED",
                                         :start_date_active=>Time.now,
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    enabled_lookup_value.lookup_values_tls.build(:lookup_value_id=>enabled_lookup_value.id,
                                            :meaning=>"启用",
                                            :description=>"启用",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    enabled_lookup_value.lookup_values_tls.build(:lookup_value_id=>enabled_lookup_value.id,
                                            :meaning=>"Enabled",
                                            :description=>"Enabled",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    enabled_lookup_value.save

    offline_lookup_value=Irm::LookupValue.new(:lookup_type=>'ACTIVE_STATUS',
                                         :lookup_code=>"OFFLINE",
                                         :start_date_active=>Time.now,
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    offline_lookup_value.lookup_values_tls.build(:lookup_value_id=>offline_lookup_value.id,
                                            :meaning=>"失效",
                                            :description=>"失效",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    offline_lookup_value.lookup_values_tls.build(:lookup_value_id=>offline_lookup_value.id,
                                            :meaning=>"Offline",
                                            :description=>"Offline",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    offline_lookup_value.save      
  end

  def self.down
    active_lookup_type= Irm::LookupType.where(:lookup_type=>"ACTIVE_STATUS").first
    Irm::LookupTypesTl.where(:lookup_type_id => active_lookup_type.id).each do |t1|
      t1.delete
    end

    #delete lookup code
    Irm::LookupType.where(:lookup_type=>"ACTIVE_STATUS").each do |lookup_code|
       Irm::LookupValuesTl.where(:lookup_value_id=>lookup_code.id).each do |lookup_code_tl|
         lookup_code_tl.delete
       end
       lookup_code.delete
    end    
  end
end
