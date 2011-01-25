# -*- coding: utf-8 -*-
class AddPermissionShowPermissionData < ActiveRecord::Migration
  def self.up
    irm_permissions_show = Irm::Permission.new(:permission_code=>'IRM_PERMISSIONS_SHOW',
                                             :page_controller=>'irm/permissions',
                                             :page_action=>'show',
                                             :not_auto_mult=>true)
    irm_permissions_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'',:source_lang=>'en')
    irm_permissions_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'',:source_lang=>'en')
    irm_permissions_show.save
  end

  def self.down
  end
end
