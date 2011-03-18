class RemoveCategoryIdIniIcmCloseReasons < ActiveRecord::Migration
  def self.up
    remove_column :icm_close_reasons,:category_id
    execute('CREATE OR REPLACE VIEW icm_close_reasons_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM icm_close_reasons  t,icm_close_reasons_tl tl
                                             WHERE t.id = tl.close_reason_id')
  end

  def self.down
  end
end
