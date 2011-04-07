# -*- coding: utf-8 -*-
class InitIncidentRequestFilterColumn < ActiveRecord::Migration
  def self.up
    column_a = Irm::ViewColumn.new({:filter_type=>"ICM_INCIDENT_REQUEST_INDEX_A",
                                    :table_name=>"icm_incident_requests",
                                    :column_name=>"requested_by",
                                    :column_data_type=>"int",
                                    :not_auto_mult=>true})
    column_a.view_columns_tls.build({:name=>"Requested By",
                                    :description=>"Requested By",
                                    :language=>"en",
                                    :source_lang=>"en"})
    column_a.view_columns_tls.build({:name=>"请求人",
                                    :description=>"请求人",
                                    :language=>"zh",
                                    :source_lang=>"en"})
    column_a.save
    column_b = Irm::ViewColumn.new({:filter_type=>"ICM_INCIDENT_REQUEST_INDEX_B",
                                    :table_name=>"icm_incident_requests",
                                    :column_name=>"requested_by",
                                    :column_data_type=>"int",
                                    :not_auto_mult=>true})
    column_b.view_columns_tls.build({:name=>"Requested By",
                                    :description=>"Requested By",
                                    :language=>"en",
                                    :source_lang=>"en"})
    column_b.view_columns_tls.build({:name=>"请求人",
                                    :description=>"请求人",
                                    :language=>"zh",
                                    :source_lang=>"en"})
    column_b.save

    column_c = Irm::ViewColumn.new({:filter_type=>"ICM_INCIDENT_REQUEST_INDEX_A",
                                    :table_name=>"icm_incident_requests",
                                    :column_name=>"support_person_id",
                                    :column_data_type=>"int",
                                    :not_auto_mult=>true})
    column_c.view_columns_tls.build({:name=>"Support By",
                                    :description=>"Support By",
                                    :language=>"en",
                                    :source_lang=>"en"})
    column_c.view_columns_tls.build({:name=>"支持人员",
                                    :description=>"支持人员",
                                    :language=>"zh",
                                    :source_lang=>"en"})
    column_c.save

    column_d = Irm::ViewColumn.new({:filter_type=>"ICM_INCIDENT_REQUEST_INDEX_B",
                                    :table_name=>"icm_incident_requests",
                                    :column_name=>"support_person_id",
                                    :column_data_type=>"int",
                                    :not_auto_mult=>true})
    column_d.view_columns_tls.build({:name=>"Support By",
                                    :description=>"Support By",
                                    :language=>"en",
                                    :source_lang=>"en"})
    column_d.view_columns_tls.build({:name=>"支持人员",
                                    :description=>"支持人员",
                                    :language=>"zh",
                                    :source_lang=>"en"})
    column_d.save

  end

  def self.down
  end
end
