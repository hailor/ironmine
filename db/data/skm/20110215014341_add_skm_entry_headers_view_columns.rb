class AddSkmEntryHeadersViewColumns < ActiveRecord::Migration
  def self.up
    column_a = Irm::ViewColumn.new({:filter_type=>"SKM_ENTRY_HEADERS_INDEX_A",
                                    :table_name=>"skm_entry_headers",
                                    :column_name=>"entry_title",
                                    :column_data_type=>"string",
                                    :not_auto_mult=>true})
    column_a.view_columns_tls.build({:name=>"Entry title",
                                    :description=>"Entry title",
                                    :language=>"en",
                                    :source_lang=>"en"})
    column_a.view_columns_tls.build({:name=>"文章标题",
                                    :description=>"文章标题",
                                    :language=>"zh",
                                    :source_lang=>"en"})
    column_a.save

    column_b = Irm::ViewColumn.new({:filter_type=>"SKM_ENTRY_HEADERS_INDEX_A",
                                    :table_name=>"skm_entry_headers",
                                    :column_name=>"published_date",
                                    :column_data_type=>"date",
                                    :not_auto_mult=>true})
    column_b.view_columns_tls.build({:name=>"Published date",
                                    :description=>"Published date",
                                    :language=>"en",
                                    :source_lang=>"en"})
    column_b.view_columns_tls.build({:name=>"发布日期",
                                    :description=>"发布日期",
                                    :language=>"zh",
                                    :source_lang=>"en"})
    column_b.save        
  end

  def self.down
    Irm::ViewColumn.delete_all({:filter_type=>"SKM_ENTRY_HEADERS_INDEX_A"})
  end
end
