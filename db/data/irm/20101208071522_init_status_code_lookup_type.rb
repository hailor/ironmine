# -*- coding: utf-8 -*-
class InitStatusCodeLookupType < ActiveRecord::Migration
  def self.up
    status_lookup_type=Irm::LookupType.new(:lookup_level=>'GLOBAL',
                                         :lookup_type=>'SYSTEM_STATUS_CODE',
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    status_lookup_type.lookup_types_tls.build(:lookup_type_id=>status_lookup_type.id,
                                            :meaning=>"记录状态",
                                            :description=>"记录状态",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    status_lookup_type.lookup_types_tls.build(:lookup_type_id=>status_lookup_type.id,
                                            :meaning=>"Status Code",
                                            :description=>"Status Code",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    status_lookup_type.save
    #Enabled
    enabled_lookup_value=Irm::LookupValue.new(:lookup_type=>'SYSTEM_STATUS_CODE',
                                         :lookup_code=>"ENABLED",
                                         :start_date_active=>Time.now,
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    enabled_lookup_value.lookup_values_tls.build(:lookup_value_id=>enabled_lookup_value.id,
                                            :meaning=>"可用",
                                            :description=>"可用",
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
    #Archive
    archive_lookup_value=Irm::LookupValue.new(:lookup_type=>'SYSTEM_STATUS_CODE',
                                         :lookup_code=>"ARCHIVE",
                                         :start_date_active=>Time.now,
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    archive_lookup_value.lookup_values_tls.build(:lookup_value_id=>archive_lookup_value.id,
                                            :meaning=>"归档",
                                            :description=>"归档",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    archive_lookup_value.lookup_values_tls.build(:lookup_value_id=>archive_lookup_value.id,
                                            :meaning=>"Archive",
                                            :description=>"Archive",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")

    archive_lookup_value.save
    #Delete
    delete_lookup_value=Irm::LookupValue.new(:lookup_type=>'SYSTEM_STATUS_CODE',
                                         :lookup_code=>"DELETE",
                                         :start_date_active=>Time.now,
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    delete_lookup_value.lookup_values_tls.build(:lookup_value_id=>delete_lookup_value.id,
                                            :meaning=>"删除",
                                            :description=>"删除",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    delete_lookup_value.lookup_values_tls.build(:lookup_value_id=>delete_lookup_value.id,
                                            :meaning=>"Delete",
                                            :description=>"Delete",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")

    delete_lookup_value.save

    #Obsolete
    obsolete_lookup_value=Irm::LookupValue.new(:lookup_type=>'SYSTEM_STATUS_CODE',
                                         :lookup_code=>"OBSOLETE",
                                         :start_date_active=>Time.now,
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    obsolete_lookup_value.lookup_values_tls.build(:lookup_value_id=>obsolete_lookup_value.id,
                                            :meaning=>"已过时",
                                            :description=>"已过时",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    obsolete_lookup_value.lookup_values_tls.build(:lookup_value_id=>obsolete_lookup_value.id,
                                            :meaning=>"Obsolete",
                                            :description=>"Obsolete",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")

    obsolete_lookup_value.save

    #Offline
    offline_lookup_value=Irm::LookupValue.new(:lookup_type=>'SYSTEM_STATUS_CODE',
                                         :lookup_code=>"OFFLINE",
                                         :start_date_active=>Time.now,
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    offline_lookup_value.lookup_values_tls.build(:lookup_value_id=>offline_lookup_value.id,
                                            :meaning=>"离线",
                                            :description=>"离线",
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

    #Proposed
    proposed_lookup_value=Irm::LookupValue.new(:lookup_type=>'SYSTEM_STATUS_CODE',
                                         :lookup_code=>"PROPOSED",
                                         :start_date_active=>Time.now,
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    proposed_lookup_value.lookup_values_tls.build(:lookup_value_id=>proposed_lookup_value.id,
                                            :meaning=>"建议",
                                            :description=>"建议",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    proposed_lookup_value.lookup_values_tls.build(:lookup_value_id=>proposed_lookup_value.id,
                                            :meaning=>"Proposed",
                                            :description=>"Proposed",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    proposed_lookup_value.save


  end

  def self.down
    #delete lookup type
    system_status_lookup_type= Irm::LookupType.where(:lookup_type=>"SYSTEM_STATUS_CODE").first
    Irm::LookupTypesTl.where(:lookup_type_id=>system_status_lookup_type.id).each do |t1|
      t1.delete
    end

    #delete lookup code
    Irm::LookupType.where(:lookup_type=>"SYSTEM_STATUS_CODE").each do |lookup_code|
       Irm::LookupValuesTl.where(:lookup_value_id=>lookup_code.id).each do |lookup_code_tl|
         lookup_code_tl.delete
       end
       lookup_code.delete
    end
  end
end
