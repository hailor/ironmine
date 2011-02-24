# -*- coding: utf-8 -*-
class IrmFixedBaseMenuPermissions < ActiveRecord::Migration
  def self.up

    irm_filters_index= Irm::Permission.new(:permission_code=>'IRM_FILTERS_INDEX',:page_controller=>'irm/filters',:page_action=>'index',:not_auto_mult=>true)
    irm_filters_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    irm_filters_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    irm_filters_index.save
    
  end

  def self.down
  end
end
