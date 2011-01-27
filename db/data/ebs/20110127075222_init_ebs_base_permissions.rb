# -*- coding: utf-8 -*-
class InitEbsBasePermissions < ActiveRecord::Migration
  def self.up
    ebs_home_index= Irm::Permission.new(:permission_code=>'EBS_HOME_INDEX',:page_controller=>'ebs/home',:page_action=>'index',:not_auto_mult=>true)
    ebs_home_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    ebs_home_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    ebs_home_index.save
  end

  def self.down
  end
end
