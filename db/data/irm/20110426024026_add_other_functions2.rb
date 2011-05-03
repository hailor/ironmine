# -*- coding: utf-8 -*-
class AddOtherFunctions2 < ActiveRecord::Migration
  def self.up

    irm_edit_watchers= Irm::Function.new(:group_code=>'ICM_INCIDENT_REQUEST',:function_code=>'EDIT_WATCHERS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_watchers.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑跟踪者',:description=>'编辑跟踪者')
    irm_edit_watchers.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Watchers',:description=>'Edit Watchers')
    irm_edit_watchers.save
    irm_view_watchers= Irm::Function.new(:group_code=>'ICM_INCIDENT_REQUEST',:function_code=>'VIEW_WATCHERS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_watchers.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'查看跟踪者',:description=>'查看跟踪者')
    irm_view_watchers.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'View Watchers',:description=>'View Watchers')
    irm_view_watchers.save
  end

  def self.down
  end
end
