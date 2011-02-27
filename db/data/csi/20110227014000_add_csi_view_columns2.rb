# -*- coding: utf-8 -*-
class AddCsiViewColumns2 < ActiveRecord::Migration
  def self.up
    column_a = Irm::ViewColumn.new({:filter_type=>"CSI_SURVEYS_INDEX_A",
                                    :table_name=>"csi_surveys",
                                    :column_name=>"closed_datetime",
                                    :column_data_type=>"date",
                                    :not_auto_mult=>true})
    column_a.view_columns_tls.build({:name=>"Closed Date",
                                    :description=>"Closed Date",
                                    :language=>"en",
                                    :source_lang=>"en"})
    column_a.view_columns_tls.build({:name=>"关闭时间",
                                    :description=>"关闭时间",
                                    :language=>"zh",
                                    :source_lang=>"en"})
    column_a.save    
  end

  def self.down
  end
end
