class AddIcmIncidentRequestIndexViewColumns2 < ActiveRecord::Migration
  def self.up
    column_a = Irm::ViewColumn.new({:filter_type=>"ICM_INCIDENT_REQUEST_INDEX_A",
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
    column_a.save
  end

  def self.down
  end
end
