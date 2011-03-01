class AddReportPurposeToIrmReports < ActiveRecord::Migration
  def self.up
    add_column :irm_reports,:report_purpose,:string,:limit=>30,:default=>"REPORT",:after=>"category_code"
    execute('CREATE OR REPLACE VIEW irm_reports_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_reports t,irm_reports_tl tl
                                             WHERE t.id = tl.report_id')
  end

  def self.down
    remove_column :irm_reports,:report_purpose
    execute('CREATE OR REPLACE VIEW irm_reports_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_reports t,irm_reports_tl tl
                                             WHERE t.id = tl.report_id')
  end
end
