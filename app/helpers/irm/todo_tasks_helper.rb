module Irm::TodoTasksHelper
  def available_tasks_list_options
    [[I18n.t(:label_irm_todo_task_display_opts_open), "open"],
     [I18n.t(:label_irm_todo_task_display_opts_today), "today"],
     [I18n.t(:label_irm_todo_task_display_opts_over_due), "overdue"],
     [I18n.t(:label_irm_todo_task_display_opts_next_7_days), "in7day"]]
  end
end
