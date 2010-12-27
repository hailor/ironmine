# -*- coding: utf-8 -*-
class AddPriorityTypes < ActiveRecord::Migration
  def self.up
    icm_priority_type =Irm::LookupType.new(:lookup_level=>'GLOBAL',
                                         :lookup_type=>'ICM_PRIORITY_TYPE',
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    icm_priority_type.lookup_types_tls.build(:lookup_type_id=>icm_priority_type.id,
                                            :meaning=>"ICM优先级分类",
                                            :description=>"ICM优先级分类",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    icm_priority_type.lookup_types_tls.build(:lookup_type_id=>icm_priority_type.id,
                                            :meaning=>"ICM priority type",
                                            :description=>"ICM priority type",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")

    icm_priority_type.save
    #Enabled
    critical =Irm::LookupValue.new(:lookup_type=>'ICM_PRIORITY_TYPE',
                                             :lookup_code=>"CRITICAL",
                                             :start_date_active=>Time.now,
                                             :status_code=>'ENABLED',
                                             :not_auto_mult=>true)
    critical.lookup_values_tls.build(:lookup_value_id=>critical.id,
                                            :meaning=>"紧急",
                                            :description=>"紧急",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    critical.lookup_values_tls.build(:lookup_value_id=>critical.id,
                                            :meaning=>"Critical",
                                            :description=>"Critical",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")

    critical.save
    high =Irm::LookupValue.new(:lookup_type=>'ICM_PRIORITY_TYPE',
                                             :lookup_code=>"HIGH",
                                             :start_date_active=>Time.now,
                                             :status_code=>'ENABLED',
                                             :not_auto_mult=>true)
    high.lookup_values_tls.build(:lookup_value_id=>high.id,
                                            :meaning=>"高",
                                            :description=>"高",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    high.lookup_values_tls.build(:lookup_value_id=>high.id,
                                            :meaning=>"High",
                                            :description=>"High",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")

    high.save
    medium =Irm::LookupValue.new(:lookup_type=>'ICM_PRIORITY_TYPE',
                                             :lookup_code=>"MEDIUM",
                                             :start_date_active=>Time.now,
                                             :status_code=>'ENABLED',
                                             :not_auto_mult=>true)
    medium.lookup_values_tls.build(:lookup_value_id=>medium.id,
                                            :meaning=>"中",
                                            :description=>"中",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    medium.lookup_values_tls.build(:lookup_value_id=>medium.id,
                                            :meaning=>"Medium",
                                            :description=>"Medium",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")

    medium.save
    low =Irm::LookupValue.new(:lookup_type=>'ICM_PRIORITY_TYPE',
                                             :lookup_code=>"LOW",
                                             :start_date_active=>Time.now,
                                             :status_code=>'ENABLED',
                                             :not_auto_mult=>true)
    low.lookup_values_tls.build(:lookup_value_id=>low.id,
                                            :meaning=>"低",
                                            :description=>"低",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    low.lookup_values_tls.build(:lookup_value_id=>low.id,
                                            :meaning=>"Low",
                                            :description=>"Low",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")

    low.save
  end

  def self.down
    #delete lookup type
    icm_priority_type = Irm::LookupType.where(:lookup_type=>"ICM_PRIORITY_TYPE").first
    icm_priority_type.destroy if icm_priority_type

    #delete lookup code
    critical = Irm::LookupValue.where(:lookup_type=>"ICM_PRIORITY_TYPE",:lookup_code=>"CRITICAL").first
    critical.destroy if critical

    #delete lookup code
    high = Irm::LookupValue.where(:lookup_type=>"ICM_PRIORITY_TYPE",:lookup_code=>"HIGH").first
    high.destroy if high

    #delete lookup code
    medium = Irm::LookupValue.where(:lookup_type=>"ICM_PRIORITY_TYPE",:lookup_code=>"MEDIUM").first
    medium.destroy if medium

    #delete lookup code
    low = Irm::LookupValue.where(:lookup_type=>"ICM_PRIORITY_TYPE",:lookup_code=>"LOW").first
    low.destroy if low

  end
end
