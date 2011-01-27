# -*- coding: utf-8 -*-
class InitCmsBasePermissions < ActiveRecord::Migration
  def self.up
    cms_home_index= Irm::Permission.new(:permission_code=>'CMS_HOME_INDEX',:page_controller=>'cms/home',:page_action=>'index',:not_auto_mult=>true)
    cms_home_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    cms_home_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    cms_home_index.save
  end

  def self.down
  end
end
