# -*- coding: utf-8 -*-
class AddOtherFunctions2 < ActiveRecord::Migration
  def self.up
    irm_irm_watcher= Irm::FunctionGroup.new(:group_code=>'IRM_WATCHER',:not_auto_mult=>true)
    irm_irm_watcher.function_groups_tls.build(:language=>'zh',:source_lang=>'en',:name=>'跟踪者',:description=>'跟踪者')
    irm_irm_watcher.function_groups_tls.build(:language=>'en',:source_lang=>'en',:name=>'Watcher',:description=>'Watcher')
    irm_irm_watcher.save

    irm_new_watchers= Irm::Function.new(:group_code=>'IRM_WATCHER',:function_code=>'NEW_WATCHERS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_new_watchers.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'添加跟踪者',:description=>'添加跟踪者')
    irm_new_watchers.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Add Watchers',:description=>'Add Watchers')
    irm_new_watchers.save
    irm_view_watchers= Irm::Function.new(:group_code=>'IRM_WATCHER',:function_code=>'VIEW_WATCHERS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_watchers.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'查看跟踪者',:description=>'查看跟踪者')
    irm_view_watchers.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'View Watchers',:description=>'View Watchers')
    irm_view_watchers.save
    irm_delete_watchers= Irm::Function.new(:group_code=>'IRM_WATCHER',:function_code=>'DELETE_WATCHERS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_delete_watchers.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'删除跟踪者',:description=>'删除跟踪者')
    irm_delete_watchers.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Delete Watchers',:description=>'Delete Watchers')
    irm_delete_watchers.save
  end

  def self.down
  end
end
