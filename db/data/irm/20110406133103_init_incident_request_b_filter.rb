# -*- coding: utf-8 -*-
class InitIncidentRequestBFilter < ActiveRecord::Migration
  def self.up
    column_a = Irm::ViewColumn.new({:filter_type=>"ICM_INCIDENT_REQUEST_INDEX_B",
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

    column_b = Irm::ViewColumn.new({:filter_type=>"ICM_INCIDENT_REQUEST_INDEX_B",
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


    column_c = Irm::ViewColumn.new({:filter_type=>"ICM_INCIDENT_REQUEST_INDEX_B",
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

    column_a = Irm::ViewColumn.new({:filter_type=>"ICM_INCIDENT_REQUEST_INDEX_B",
                                    :table_name=>"icm_incident_requests",
                                    :column_name=>"submitted_date",
                                    :column_data_type=>"date",
                                    :not_auto_mult=>true})
    column_a.view_columns_tls.build({:name=>"Submitted date",
                                    :description=>"Submitted date",
                                    :language=>"en",
                                    :source_lang=>"en"})
    column_a.view_columns_tls.build({:name=>"提交日期",
                                    :description=>"提交日期",
                                    :language=>"zh",
                                    :source_lang=>"en"})

    column_a = Irm::ViewColumn.new({:filter_type=>"ICM_INCIDENT_REQUEST_INDEX_B",
                                    :table_name=>"icm_incident_requests",
                                    :column_name=>"incident_status_code",
                                    :column_data_type=>"string",
                                    :not_auto_mult=>true})
    column_a.view_columns_tls.build({:name=>"Request Status",
                                    :description=>"Request Status",
                                    :language=>"en",
                                    :source_lang=>"en"})
    column_a.view_columns_tls.build({:name=>"请求状态",
                                    :description=>"请求状态",
                                    :language=>"zh",
                                    :source_lang=>"en"})
    column_a.save

    column_b = Irm::ViewColumn.new({:filter_type=>"ICM_INCIDENT_REQUEST_INDEX_B",
                                    :table_name=>"icm_incident_requests",
                                    :column_name=>"close_reason_code",
                                    :column_data_type=>"string",
                                    :not_auto_mult=>true})
    column_b.view_columns_tls.build({:name=>"Close Reason",
                                    :description=>"Close Reason",
                                    :language=>"en",
                                    :source_lang=>"en"})
    column_b.view_columns_tls.build({:name=>"关闭原因",
                                    :description=>"关闭原因",
                                    :language=>"zh",
                                    :source_lang=>"en"})
    column_b.save

    column_c = Irm::ViewColumn.new({:filter_type=>"ICM_INCIDENT_REQUEST_INDEX_B",
                                    :table_name=>"icm_incident_requests",
                                    :column_name=>"impact_range_code",
                                    :column_data_type=>"string",
                                    :not_auto_mult=>true})
    column_c.view_columns_tls.build({:name=>"Impact Range",
                                    :description=>"Request Status",
                                    :language=>"en",
                                    :source_lang=>"en"})
    column_c.view_columns_tls.build({:name=>"影响度",
                                    :description=>"影响度",
                                    :language=>"zh",
                                    :source_lang=>"en"})
    column_c.save

    column_c = Irm::ViewColumn.new({:filter_type=>"ICM_INCIDENT_REQUEST_INDEX_B",
                                    :table_name=>"icm_incident_requests",
                                    :column_name=>"urgence_code",
                                    :column_data_type=>"string",
                                    :not_auto_mult=>true})
    column_c.view_columns_tls.build({:name=>"Urgence",
                                    :description=>"Urgence",
                                    :language=>"en",
                                    :source_lang=>"en"})
    column_c.view_columns_tls.build({:name=>"紧急度",
                                    :description=>"紧急度",
                                    :language=>"zh",
                                    :source_lang=>"en"})
    column_c.save

    column_d = Irm::ViewColumn.new({:filter_type=>"ICM_INCIDENT_REQUEST_INDEX_B",
                                    :table_name=>"icm_incident_requests",
                                    :column_name=>"request_type_code",
                                    :column_data_type=>"string",
                                    :not_auto_mult=>true})
    column_d.view_columns_tls.build({:name=>"Request Type",
                                    :description=>"Request Type",
                                    :language=>"en",
                                    :source_lang=>"en"})
    column_d.view_columns_tls.build({:name=>"请求类型",
                                    :description=>"请求类型",
                                    :language=>"zh",
                                    :source_lang=>"en"})
    column_d.save

    column_e = Irm::ViewColumn.new({:filter_type=>"ICM_INCIDENT_REQUEST_INDEX_B",
                                    :table_name=>"icm_incident_requests",
                                    :column_name=>"report_source_code",
                                    :column_data_type=>"string",
                                    :not_auto_mult=>true})
    column_e.view_columns_tls.build({:name=>"Report Source",
                                    :description=>"Report Source",
                                    :language=>"en",
                                    :source_lang=>"en"})
    column_e.view_columns_tls.build({:name=>"来源类型",
                                    :description=>"来源类型",
                                    :language=>"zh",
                                    :source_lang=>"en"})
    column_e.save

    column_f = Irm::ViewColumn.new({:filter_type=>"ICM_INCIDENT_REQUEST_INDEX_B",
                                    :table_name=>"icm_incident_requests",
                                    :column_name=>"submitted_by",
                                    :column_data_type=>"int",
                                    :not_auto_mult=>true})
    column_f.view_columns_tls.build({:name=>"Submitted By",
                                    :description=>"Submitted By",
                                    :language=>"en",
                                    :source_lang=>"en"})
    column_f.view_columns_tls.build({:name=>"提交人",
                                    :description=>"提交人",
                                    :language=>"zh",
                                    :source_lang=>"en"})
    column_f.save
  end

  def self.down
  end
end
