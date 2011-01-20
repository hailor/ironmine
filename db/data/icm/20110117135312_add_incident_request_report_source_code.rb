# -*- coding: utf-8 -*-
class AddIncidentRequestReportSourceCode < ActiveRecord::Migration
  def self.up
    incident_request_report_source =Irm::LookupType.new(:lookup_level=>'GLOBAL',
                                         :lookup_type=>'ICM_REQUEST_REPORT_SOURCE',
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    incident_request_report_source.lookup_types_tls.build(
                                            :meaning=>"事故单来源类型",
                                            :description=>"事故单来源类型",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    incident_request_report_source.lookup_types_tls.build(
                                            :meaning=>"Incident report source",
                                            :description=>"Incident report source",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")

    incident_request_report_source.save
    #Enabled
    customer_submit =Irm::LookupValue.new(:lookup_type=>'ICM_REQUEST_REPORT_SOURCE',
                                             :lookup_code=>"CUSTOMER_SUBMIT",
                                             :start_date_active=>Time.now,
                                             :status_code=>'ENABLED',
                                             :not_auto_mult=>true)
    customer_submit.lookup_values_tls.build(
                                            :meaning=>"客户提交",
                                            :description=>"客户提交",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    customer_submit.lookup_values_tls.build(
                                            :meaning=>"Customer submit",
                                            :description=>"Customer submit",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")

    customer_submit.save


    customer_phone_call =Irm::LookupValue.new(:lookup_type=>'ICM_REQUEST_REPORT_SOURCE',
                                             :lookup_code=>"CUSTOMER_PHONE_CALL",
                                             :start_date_active=>Time.now,
                                             :status_code=>'ENABLED',
                                             :not_auto_mult=>true)
    customer_phone_call.lookup_values_tls.build(
                                            :meaning=>"客户电话",
                                            :description=>"客户电话",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    customer_phone_call.lookup_values_tls.build(
                                            :meaning=>"Customer phone call",
                                            :description=>"Customer phone call",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")

    customer_phone_call.save   
  end

  def self.down
  end
end
