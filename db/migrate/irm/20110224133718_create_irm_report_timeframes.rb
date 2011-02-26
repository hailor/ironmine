class CreateIrmReportTimeframes < ActiveRecord::Migration
  def self.up
    create_table "irm_report_timeframes", :force => true do |t|
      t.integer  :company_id, :null => false
      t.string   :report_code, :limit => 30, :null => false
      t.string   :table_name,  :limit => 30
      t.string   :column_code, :limit => 30
      t.string   :status_code, :limit => 30, :null => false, :default => "ENABLED"
      t.integer  :created_by
      t.integer  :updated_by
      t.datetime :created_at
      t.datetime :updated_at
    end
    add_index "irm_report_timeframes", ["report_code","table_name","column_code"], :name => "IRM_REPORT_TIMEFRAMES_N1"

    create_table "irm_report_timeframes_tl", :force => true do |t|
      t.integer  :company_id, :null => false
      t.integer  :timeframe_id, :null => false
      t.string   :name, :limit => 60, :null => false
      t.string   :description, :limit => 150,  :null => false
      t.string   :status_code, :limit => 30, :null => false, :default => "ENABLED"
      t.string   :language, :limit => 30
      t.string   :source_lang, :limit => 30
      t.integer  :created_by
      t.integer  :updated_by
      t.datetime :created_ats
      t.datetime :updated_at
    end

    add_index "irm_report_timeframes_tl", ["timeframe_id", "language"], :name => "IRM_REPORT_TIMEFRAMES_TL_U1", :unique => true

    execute('CREATE OR REPLACE VIEW irm_report_timeframes_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_report_timeframes  t,irm_report_timeframes_tl tl
                                             WHERE t.id = tl.timeframe_id')
  end

  def self.down
    drop_table :irm_report_timeframes
    drop_table :irm_report_timeframes_tl
    execute("drop view irm_report_timeframes_vl")
  end
end
