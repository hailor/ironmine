# -*- coding: utf-8 -*-
class AddIncidentRequestService < ActiveRecord::Migration
  def self.up
    incident_request_service =Irm::LookupType.new(:lookup_level=>'GLOBAL',
                                         :lookup_type=>'ICM_SERVICE_CODE',
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    incident_request_service.lookup_types_tls.build(:lookup_type_id=>incident_request_service.id,
                                            :meaning=>"事故单服务类型",
                                            :description=>"事故单服务类型",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    incident_request_service.lookup_types_tls.build(:lookup_type_id=>incident_request_service.id,
                                            :meaning=>"Incident request service codes",
                                            :description=>"Incident request service codes",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")

    incident_request_service.save
    #Enabled
    inventory =Irm::LookupValue.new(:lookup_type=>'ICM_SERVICE_CODE',
                                             :lookup_code=>"ORAL_EBS_INV",
                                             :start_date_active=>Time.now,
                                             :status_code=>'ENABLED',
                                             :not_auto_mult=>true)
    inventory.lookup_values_tls.build(:lookup_value_id=>inventory.id,
                                            :meaning=>"Oracle ebs 库存",
                                            :description=>"Oracle ebs 库存",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    inventory.lookup_values_tls.build(:lookup_value_id=>inventory.id,
                                            :meaning=>"Oracle ebs inventory",
                                            :description=>"Oracle ebs inventory",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")

    inventory.save
  end

  def self.down
  end
end
