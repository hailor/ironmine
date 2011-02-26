class InitIrmReportListsPermission < ActiveRecord::Migration
  def self.up
    irm_report_lists_index= Irm::Permission.new(:permission_code=>'IRM_REPORT_LISTS_INDEX',
                                                :page_controller=>'irm/report_lists',
                                                :page_action=>'index',:not_auto_mult=>true)
    irm_report_lists_index.permissions_tls.build(:language=>'zh',:name=>'首页',
                                                 :description=>'首页',:source_lang=>'en')
    irm_report_lists_index.permissions_tls.build(:language=>'en',:name=>'Index',
                                                 :description=>'Index',:source_lang=>'en')
    irm_report_lists_index.save
  end

  def self.down

  end
end
