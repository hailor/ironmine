class AddIrmPermissionsViewColumn < ActiveRecord::Migration
  def self.up
    column_a = Irm::ViewColumn.new({:filter_type=>"IRM_PERMISSIONS_INDEX_A",
                                    :table_name=>"irm_product_modules_tl",
                                    :column_name=>"name",
                                    :column_data_type=>"string",
                                    :not_auto_mult=>true})
    column_a.view_columns_tls.build({:name=>"Product module name",
                                    :description=>"Product module name",
                                    :language=>"en",
                                    :source_lang=>"en"})
    column_a.view_columns_tls.build({:name=>"产品模块名称",
                                    :description=>"产品模块名称",
                                    :language=>"zh",
                                    :source_lang=>"en"})
    column_a.save

    column_b = Irm::ViewColumn.new({:filter_type=>"IRM_PERMISSIONS_INDEX_A",
                                    :table_name=>"irm_permissions",
                                    :column_name=>"permission_code",
                                    :column_data_type=>"string",
                                    :not_auto_mult=>true})
    column_b.view_columns_tls.build({:name=>"Permission code",
                                    :description=>"Permission code",
                                    :language=>"en",
                                    :source_lang=>"en"})
    column_b.view_columns_tls.build({:name=>"权限编码",
                                    :description=>"权限编码",
                                    :language=>"zh",
                                    :source_lang=>"en"})
    column_b.save

    column_c = Irm::ViewColumn.new({:filter_type=>"IRM_PERMISSIONS_INDEX_A",
                                    :table_name=>"irm_permissions_tl",
                                    :column_name=>"name",
                                    :column_data_type=>"string",
                                    :not_auto_mult=>true})
    column_c.view_columns_tls.build({:name=>"Permission name",
                                    :description=>"Permission name",
                                    :language=>"en",
                                    :source_lang=>"en"})
    column_c.view_columns_tls.build({:name=>"权限名称",
                                    :description=>"权限名称",
                                    :language=>"zh",
                                    :source_lang=>"en"})
    column_c.save

    column_d = Irm::ViewColumn.new({:filter_type=>"IRM_PERMISSIONS_INDEX_A",
                                    :table_name=>"irm_permissions",
                                    :column_name=>"page_controller",
                                    :column_data_type=>"string",
                                    :not_auto_mult=>true})
    column_d.view_columns_tls.build({:name=>"Permission controller",
                                    :description=>"Permission controller",
                                    :language=>"en",
                                    :source_lang=>"en"})
    column_d.view_columns_tls.build({:name=>"权限Controller",
                                    :description=>"权限Controller",
                                    :language=>"zh",
                                    :source_lang=>"en"})
    column_d.save

    column_e = Irm::ViewColumn.new({:filter_type=>"IRM_PERMISSIONS_INDEX_A",
                                    :table_name=>"irm_permissions",
                                    :column_name=>"page_action",
                                    :column_data_type=>"string",
                                    :not_auto_mult=>true})
    column_e.view_columns_tls.build({:name=>"Permission action",
                                    :description=>"Permission action",
                                    :language=>"en",
                                    :source_lang=>"en"})
    column_e.view_columns_tls.build({:name=>"权限Action",
                                    :description=>"权限Action",
                                    :language=>"zh",
                                    :source_lang=>"en"})
    column_e.save


    column_f = Irm::ViewColumn.new({:filter_type=>"IRM_PERMISSIONS_INDEX_A",
                                    :table_name=>"status_lookup",
                                    :column_name=>"meaning",
                                    :column_data_type=>"string",
                                    :not_auto_mult=>true})
    column_f.view_columns_tls.build({:name=>"Permission status",
                                    :description=>"Permission status",
                                    :language=>"en",
                                    :source_lang=>"en"})
    column_f.view_columns_tls.build({:name=>"权限状态",
                                    :description=>"权限状态",
                                    :language=>"zh",
                                    :source_lang=>"en"})
    column_f.save

    column_g = Irm::ViewColumn.new({:filter_type=>"IRM_PERMISSIONS_INDEX_A",
                                    :table_name=>"irm_permissions",
                                    :column_name=>"created_at",
                                    :column_data_type=>"date",
                                    :not_auto_mult=>true})
    column_g.view_columns_tls.build({:name=>"Permission creation date",
                                    :description=>"Permission creation date",
                                    :language=>"en",
                                    :source_lang=>"en"})
    column_g.view_columns_tls.build({:name=>"权限创建日期",
                                    :description=>"权限创建日期",
                                    :language=>"zh",
                                    :source_lang=>"en"})
    column_g.save

    column_h = Irm::ViewColumn.new({:filter_type=>"IRM_PERMISSIONS_INDEX_A",
                                    :table_name=>"irm_permissions",
                                    :column_name=>"created_by",
                                    :column_data_type=>"int",
                                    :not_auto_mult=>true})
    column_h.view_columns_tls.build({:name=>"Permission creator",
                                    :description=>"Permission creator",
                                    :language=>"en",
                                    :source_lang=>"en"})
    column_h.view_columns_tls.build({:name=>"权限创建人帐号ID",
                                    :description=>"权限创建人帐号ID",
                                    :language=>"zh",
                                    :source_lang=>"en"})
    column_h.save    

  end

  def self.down
    Irm::ViewColumn.delete_all({:filter_type=>"IRM_PERMISSIONS_INDEX_A"})
  end
end
