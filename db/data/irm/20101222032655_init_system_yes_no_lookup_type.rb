# -*- coding: utf-8 -*-
class InitSystemYesNoLookupType < ActiveRecord::Migration
  def self.up
    yes_no_lookup_type=Irm::LookupType.new(:lookup_level=>'GLOBAL',
                                         :lookup_type=>'SYSTEM_YES_NO',
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    yes_no_lookup_type.lookup_types_tls.build(:lookup_type_id=>yes_no_lookup_type.id,
                                            :meaning=>"系统初始化YES_NO",
                                            :description=>"系统初始化YES_NO",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    yes_no_lookup_type.lookup_types_tls.build(:lookup_type_id=>yes_no_lookup_type.id,
                                            :meaning=>"Init SYSTEM_YES_NO",
                                            :description=>"Init SYSTEM_YES_NO",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    yes_no_lookup_type.save
    #Enabled
    yes_lookup_value=Irm::LookupValue.new(:lookup_type=>'SYSTEM_YES_NO',
                                         :lookup_code=>"Y",
                                         :start_date_active=>Time.now,
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    yes_lookup_value.lookup_values_tls.build(:lookup_value_id=>yes_lookup_value.id,
                                            :meaning=>"Y",
                                            :description=>"Y",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    yes_lookup_value.lookup_values_tls.build(:lookup_value_id=>yes_lookup_value.id,
                                            :meaning=>"是",
                                            :description=>"是",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")

    yes_lookup_value.save
    #Archive
    no_lookup_value=Irm::LookupValue.new(:lookup_type=>'SYSTEM_YES_NO',
                                         :lookup_code=>"N",
                                         :start_date_active=>Time.now,
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    no_lookup_value.lookup_values_tls.build(:lookup_value_id=>no_lookup_value.id,
                                            :meaning=>"N",
                                            :description=>"N",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    no_lookup_value.lookup_values_tls.build(:lookup_value_id=>no_lookup_value.id,
                                            :meaning=>"否",
                                            :description=>"否",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")

    no_lookup_value.save
  end

  def self.down
    #delete lookup type
    system_status_lookup_type= Irm::LookupType.where(:lookup_type=>"SYSTEM_YES_NO").first
    Irm::LookupTypesTl.where(:lookup_type_id=>system_status_lookup_type.id).each do |t1|
      t1.delete
    end

    #delete lookup code
    Irm::LookupType.where(:lookup_type=>"SYSTEM_YES_NO").each do |lookup_code|
       Irm::LookupValuesTl.where(:lookup_value_id=>lookup_code.id).each do |lookup_code_tl|
         lookup_code_tl.delete
       end
       lookup_code.delete
    end
  end
end
