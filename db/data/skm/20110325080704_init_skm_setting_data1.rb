# -*- coding: utf-8 -*-
class InitSkmSettingData1 < ActiveRecord::Migration
  def self.up
    p1 = Irm::SystemParameter.new(:parameter_code => "SKM_SIDEBAR_NAVI_DISPLAY", :value => "Y", :content_type => "SKM_SETTING", :data_type => "SELECT",:status_code=>'ENABLED',:not_auto_mult=>true)
    p1.system_parameters_tls.build(:system_parameter_id => p1.id, :name => "是否显示边栏导航", :description => "是否显示边栏导航", :language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    p1.system_parameters_tls.build(:system_parameter_id => p1.id, :name => "Display Sidebar Navigator", :description => "Display Sidebar Navigator", :language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    p1.save

    p2 = Irm::SystemParameter.new(:parameter_code => "SKM_SIDEBAR_FILE_LINK_DISPLAY", :value => "Y", :content_type => "SKM_SETTING", :data_type => "SELECT",:status_code=>'ENABLED',:not_auto_mult=>true)
    p2.system_parameters_tls.build(:system_parameter_id => p1.id, :name => "边栏导航是否显示文件管理", :description => "边栏导航是否显示文件管理", :language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    p2.system_parameters_tls.build(:system_parameter_id => p1.id, :name => "Files Menu in Sidebar Navigator", :description => "Files Menu in Sidebar Navigator", :language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    p2.save
  end

  def self.down
  end
end
