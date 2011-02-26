# -*- coding: utf-8 -*-
class AddIcmIncidentRequestIndexViewColumns < ActiveRecord::Migration
  def self.up
    column_a = Irm::ViewColumn.new({:filter_type=>"ICM_INCIDENT_REQUEST_INDEX_A",
                                    :table_name=>"icm_incident_requests",
                                    :column_name=>"request_number",
                                    :column_data_type=>"string",
                                    :not_auto_mult=>true})
    column_a.view_columns_tls.build({:name=>"Request Number",
                                    :description=>"Request Number",
                                    :language=>"en",
                                    :source_lang=>"en"})
    column_a.view_columns_tls.build({:name=>"事故单号",
                                    :description=>"事故单号",
                                    :language=>"zh",
                                    :source_lang=>"en"})
    column_a.save

    column_b = Irm::ViewColumn.new({:filter_type=>"ICM_INCIDENT_REQUEST_INDEX_A",
                                    :table_name=>"icm_incident_requests",
                                    :column_name=>"title",
                                    :column_data_type=>"string",
                                    :not_auto_mult=>true})
    column_b.view_columns_tls.build({:name=>"Title",
                                    :description=>"Title",
                                    :language=>"en",
                                    :source_lang=>"en"})
    column_b.view_columns_tls.build({:name=>"标题",
                                    :description=>"标题",
                                    :language=>"zh",
                                    :source_lang=>"en"})
    column_b.save


    column_c = Irm::ViewColumn.new({:filter_type=>"ICM_INCIDENT_REQUEST_INDEX_A",
                                    :table_name=>"icm_incident_requests",
                                    :column_name=>"summary",
                                    :column_data_type=>"string",
                                    :not_auto_mult=>true})
    column_c.view_columns_tls.build({:name=>"Summary",
                                    :description=>"Summary",
                                    :language=>"en",
                                    :source_lang=>"en"})
    column_c.view_columns_tls.build({:name=>"信息",
                                    :description=>"信息",
                                    :language=>"zh",
                                    :source_lang=>"en"})
    column_c.save            
  end

  def self.down
  end
end
