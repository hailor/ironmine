# -*- coding: utf-8 -*-
class AddCsiViewColumnsData < ActiveRecord::Migration
  def self.up
    column_a = Irm::ViewColumn.new({:filter_type=>"CSI_SURVEYS_INDEX_A",
                                    :table_name=>"csi_surveys",
                                    :column_name=>"title",
                                    :column_data_type=>"string",
                                    :not_auto_mult=>true})
    column_a.view_columns_tls.build({:name=>"Title",
                                    :description=>"Title",
                                    :language=>"en",
                                    :source_lang=>"en"})
    column_a.view_columns_tls.build({:name=>"问卷名称",
                                    :description=>"问卷名称",
                                    :language=>"zh",
                                    :source_lang=>"en"})
    column_a.save

    column_b = Irm::ViewColumn.new({:filter_type=>"CSI_SURVEYS_INDEX_A",
                                    :table_name=>"csi_surveys",
                                    :column_name=>"description",
                                    :column_data_type=>"string",
                                    :not_auto_mult=>true})
    column_b.view_columns_tls.build({:name=>"Description",
                                    :description=>"Description",
                                    :language=>"en",
                                    :source_lang=>"en"})
    column_b.view_columns_tls.build({:name=>"描述",
                                    :description=>"描述",
                                    :language=>"zh",
                                    :source_lang=>"en"})
    column_b.save

    column_c = Irm::ViewColumn.new({:filter_type=>"CSI_SURVEYS_INDEX_A",
                                    :table_name=>"csi_surveys",
                                    :column_name=>"thanks_message",
                                    :column_data_type=>"string",
                                    :not_auto_mult=>true})
    column_c.view_columns_tls.build({:name=>"Thanks",
                                    :description=>"Thanks",
                                    :language=>"en",
                                    :source_lang=>"en"})
    column_c.view_columns_tls.build({:name=>"感谢",
                                    :description=>"感谢",
                                    :language=>"zh",
                                    :source_lang=>"en"})
    column_c.save

    column_d = Irm::ViewColumn.new({:filter_type=>"CSI_SURVEYS_INDEX_A",
                                    :table_name=>"csi_surveys",
                                    :column_name=>"created_at",
                                    :column_data_type=>"string",
                                    :not_auto_mult=>true})
    column_d.view_columns_tls.build({:name=>"Created at",
                                    :description=>"Created at",
                                    :language=>"en",
                                    :source_lang=>"en"})
    column_d.view_columns_tls.build({:name=>"创建时间",
                                    :description=>"创建时间",
                                    :language=>"zh",
                                    :source_lang=>"en"})
    column_d.save      
  end

  def self.down
  end
end
