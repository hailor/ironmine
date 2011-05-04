# -*- coding: utf-8 -*-
class AddTodoTaskInitdata < ActiveRecord::Migration
  def self.up
    irm_irm_todo_task= Irm::FunctionGroup.new(:group_code=>'IRM_TODO_TASK',:not_auto_mult=>true)
    irm_irm_todo_task.function_groups_tls.build(:language=>'zh',:source_lang=>'en',:name=>'任务',:description=>'任务')
    irm_irm_todo_task.function_groups_tls.build(:language=>'en',:source_lang=>'en',:name=>'Task',:description=>'Task')
    irm_irm_todo_task.save

    irm_create_todo_tasks= Irm::Function.new(:group_code=>'IRM_TODO_TASK',:function_code=>'CREATE_TODO_TASKS',:default_flag=>'N',:login_flag => 'N', :public_flag=>'N',:not_auto_mult=>true)
    irm_create_todo_tasks.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建任务',:description=>'新建任务')
    irm_create_todo_tasks.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Task',:description=>'New Task')
    irm_create_todo_tasks.save

    irm_edit_todo_tasks= Irm::Function.new(:group_code=>'IRM_TODO_TASK',:function_code=>'EDIT_TODO_TASKS',:default_flag=>'N',:login_flag => 'N', :public_flag=>'N',:not_auto_mult=>true)
    irm_edit_todo_tasks.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑任务',:description=>'编辑任务')
    irm_edit_todo_tasks.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Task',:description=>'Edit Task')
    irm_edit_todo_tasks.save

    irm_view_todo_tasks= Irm::Function.new(:group_code=>'IRM_TODO_TASK',:function_code=>'VIEW_TODO_TASKS',:default_flag=>'N',:login_flag => 'N', :public_flag=>'N',:not_auto_mult=>true)
    irm_view_todo_tasks.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'查看任务',:description=>'查看任务')
    irm_view_todo_tasks.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'View Task',:description=>'View Task')
    irm_view_todo_tasks.save
  end

  def self.down
  end
end
