# -*- coding: utf-8 -*-
class InitEntityCodeLookupType < ActiveRecord::Migration
  def self.up
    entity_lookup_type=Irm::LookupType.new(:lookup_level=>'GLOBAL',
                                         :lookup_type=>'ENTITY_CODE',
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    entity_lookup_type.lookup_types_tls.build(:lookup_type_id=>entity_lookup_type.id,
                                            :meaning=>"实体编码",
                                            :description=>"实体编码",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    entity_lookup_type.lookup_types_tls.build(:lookup_type_id=>entity_lookup_type.id,
                                            :meaning=>"Entity Code",
                                            :description=>"Entity Code",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")

    entity_lookup_type.save
    #Enabled
    entity_lookup_value=Irm::LookupValue.new(:lookup_type=>'ENTITY_CODE',
                                             :lookup_code=>"USER",
                                             :start_date_active=>Time.now,
                                             :status_code=>'ENABLED',
                                             :not_auto_mult=>true)
    entity_lookup_value.lookup_values_tls.build(:lookup_value_id=>entity_lookup_value.id,
                                            :meaning=>"用户",
                                            :description=>"用户",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    entity_lookup_value.lookup_values_tls.build(:lookup_value_id=>entity_lookup_value.id,
                                            :meaning=>"User",
                                            :description=>"User",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")

    entity_lookup_value.save
  end

  def self.down
    #delete lookup type
    system_status_lookup_type= Irm::LookupType.where(:lookup_type=>"ENTITY_CODE").first
    Irm::LookupTypesTl.where(:lookup_type_id=>system_status_lookup_type.id).each do |t1|
      t1.delete
    end

    #delete lookup code
    Irm::LookupType.where(:lookup_type=>"ENTITY_CODE").each do |lookup_code|
       Irm::LookupValuesTl.where(:lookup_value_id=>lookup_code.id).each do |lookup_code_tl|
         lookup_code_tl.delete
       end
       lookup_code.delete
    end
  end
end
