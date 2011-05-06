# -*- coding: utf-8 -*-
class AddViewReportListsFunction < ActiveRecord::Migration
  def self.up
    _view_report_lists= Irm::Function.new(:group_code=>'IRM_SYSTEM_HOME_PAGE',:function_code=>'VIEW_REPORT_LISTS',:default_flag=>'Y',:login_flag => 'N', :public_flag=>'N',:not_auto_mult=>true)
    _view_report_lists.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'报表列表',:description=>'报表列表')
    _view_report_lists.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Report List',:description=>'Report List')
    _view_report_lists.save
  end

  def self.down
  end
end
