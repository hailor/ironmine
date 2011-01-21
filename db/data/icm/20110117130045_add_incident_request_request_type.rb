# -*- coding: utf-8 -*-
class AddIncidentRequestRequestType < ActiveRecord::Migration
  def self.up
    incident_request_type =Irm::LookupType.new(:lookup_level=>'GLOBAL',
                                         :lookup_type=>'ICM_REQUEST_TYPE_CODE',
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    incident_request_type.lookup_types_tls.build(:lookup_type_id=>incident_request_type.id,
                                            :meaning=>"事故单请求类型",
                                            :description=>"事故单请求类型",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    incident_request_type.lookup_types_tls.build(:lookup_type_id=>incident_request_type.id,
                                            :meaning=>"Incident request type",
                                            :description=>"Incident request type",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")

    incident_request_type.save
    #Enabled
    perform =Irm::LookupValue.new(:lookup_type=>'ICM_REQUEST_TYPE_CODE',
                                             :lookup_code=>"REQUESTED_TO_PERFORM",
                                             :start_date_active=>Time.now,
                                             :status_code=>'ENABLED',
                                             :not_auto_mult=>true)
    perform.lookup_values_tls.build(:lookup_value_id=>perform.id,
                                            :meaning=>"请求履行",
                                            :description=>"请求履行",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    perform.lookup_values_tls.build(:lookup_value_id=>perform.id,
                                            :meaning=>"Request to perform",
                                            :description=>"Request to perform",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")

    perform.save


    change =Irm::LookupValue.new(:lookup_type=>'ICM_REQUEST_TYPE_CODE',
                                             :lookup_code=>"REQUESTED_TO_CHANGE",
                                             :start_date_active=>Time.now,
                                             :status_code=>'ENABLED',
                                             :not_auto_mult=>true)
    change.lookup_values_tls.build(:lookup_value_id=>perform.id,
                                            :meaning=>"请求变更",
                                            :description=>"请求变更",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    change.lookup_values_tls.build(:lookup_value_id=>perform.id,
                                            :meaning=>"Request to change",
                                            :description=>"Request to change",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")

    change.save
  end

  def self.down
  end
end
