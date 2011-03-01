# -*- coding: utf-8 -*-
class SkmEntryHeaderIndexViewColumnsData2 < ActiveRecord::Migration
  def self.up
    column_a = Irm::ViewColumn.new({:filter_type=>"SKM_ENTRY_HEADERS_INDEX_A",
                                    :table_name=>"skm_entry_headers",
                                    :column_name=>"author_id",
                                    :column_data_type=>"string",
                                    :not_auto_mult=>true})
    column_a.view_columns_tls.build({:name=>"Author",
                                    :description=>"Author",
                                    :language=>"en",
                                    :source_lang=>"en"})
    column_a.view_columns_tls.build({:name=>"作者",
                                    :description=>"作者",
                                    :language=>"zh",
                                    :source_lang=>"en"})
    column_a.save    
  end

  def self.down
  end
end
