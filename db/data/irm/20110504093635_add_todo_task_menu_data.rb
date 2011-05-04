# -*- coding: utf-8 -*-
class AddTodoTaskMenuData < ActiveRecord::Migration
  def self.up
    irm_menu_entiry_112= Irm::MenuEntry.new(:menu_code=>'HOME',:sub_menu_code=>nil,:page_controller=>'irm/todo_tasks',:display_sequence=>40,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_112.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'任务',:description=>'任务')
    irm_menu_entiry_112.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Task',:description=>'Task')
    irm_menu_entiry_112.save
  end

  def self.down
  end
end
