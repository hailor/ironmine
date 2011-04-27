# -*- coding: utf-8 -*-
class InitWfSettingsMenu < ActiveRecord::Migration
  def self.up
    deleteable_menus = Irm::Menu.where("#{Irm::Menu.table_name}.menu_code IN (?)",["IRM_DEV_AUTOMATOR_MENU"])
    deleteable_menus.each do |dm|
      dm.delete
    end


    deleteable_menuentries = Irm::MenuEntry.where("#{Irm::MenuEntry.table_name}.menu_code IN (?) OR #{Irm::MenuEntry.table_name}.sub_menu_code IN (?)",["IRM_DEV_AUTOMATOR_MENU"],["IRM_DEV_AUTOMATOR_MENU"])

    deleteable_menuentries.each do |dm|
      dm.delete
    end


    irm_irm_dev_workflow= Irm::Menu.new(:menu_code=>'IRM_DEV_WORKFLOW',:leaf_flag=>'Y',:not_auto_mult=>true)
    irm_irm_dev_workflow.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'工作流 & 审批',:description=>'工作流 & 审批')
    irm_irm_dev_workflow.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Workflow & Approvals',:description=>'Workflow & Approvals')
    irm_irm_dev_workflow.save

    irm_menu_entiry_116= Irm::MenuEntry.new(:menu_code=>'IRM_DEVELOPER_MENU',:sub_menu_code=>'IRM_DEV_WORKFLOW',:page_controller=>nil,:display_sequence=>30,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_116.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'工作流 & 审批',:description=>'工作流 & 审批')
    irm_menu_entiry_116.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Workflow & Approvals',:description=>'Workflow & Approvals')
    irm_menu_entiry_116.save
    irm_menu_entiry_117= Irm::MenuEntry.new(:menu_code=>'IRM_DEV_WORKFLOW',:sub_menu_code=>nil,:page_controller=>'irm/wf_settings',:display_sequence=>80,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_117.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'工作流设置',:description=>'工作流设置')
    irm_menu_entiry_117.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Workflow Setting',:description=>'Workflow Setting')
    irm_menu_entiry_117.save
  end

  def self.down
  end
end
