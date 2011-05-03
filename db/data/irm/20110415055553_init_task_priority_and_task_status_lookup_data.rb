# -*- coding: utf-8 -*-
class InitTaskPriorityAndTaskStatusLookupData < ActiveRecord::Migration
  def self.up
    irm_todo_event_priority=Irm::LookupType.new(:lookup_level=>'GLOBAL',:lookup_type=>'IRM_TODO_EVENT_PRIORITY',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_todo_event_priority.lookup_types_tls.build(:lookup_type_id=>irm_todo_event_priority.id,:meaning=>'事件优先级',:description=>'事件优先级',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_todo_event_priority.lookup_types_tls.build(:lookup_type_id=>irm_todo_event_priority.id,:meaning=>'Event Priorities',:description=>'Event Priorities',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_todo_event_priority.save
    irm_todo_event_status=Irm::LookupType.new(:lookup_level=>'GLOBAL',:lookup_type=>'IRM_TODO_EVENT_STATUS',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_todo_event_status.lookup_types_tls.build(:lookup_type_id=>irm_todo_event_status.id,:meaning=>'事件状态',:description=>'事件状态',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_todo_event_status.lookup_types_tls.build(:lookup_type_id=>irm_todo_event_status.id,:meaning=>'Event Statuses',:description=>'Event Statuses',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_todo_event_status.save

    irm_todo_event_prioritynormal= Irm::LookupValue.new(:lookup_type=>'IRM_TODO_EVENT_PRIORITY',:lookup_code=>'NORMAL',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_todo_event_prioritynormal.lookup_values_tls.build(:lookup_value_id=>irm_todo_event_prioritynormal.id,:meaning=>'一般',:description=>'一般',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_todo_event_prioritynormal.lookup_values_tls.build(:lookup_value_id=>irm_todo_event_prioritynormal.id,:meaning=>'Normal',:description=>'Normal',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_todo_event_prioritynormal.save
    irm_todo_event_prioritylow= Irm::LookupValue.new(:lookup_type=>'IRM_TODO_EVENT_PRIORITY',:lookup_code=>'LOW',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_todo_event_prioritylow.lookup_values_tls.build(:lookup_value_id=>irm_todo_event_prioritylow.id,:meaning=>'低',:description=>'低',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_todo_event_prioritylow.lookup_values_tls.build(:lookup_value_id=>irm_todo_event_prioritylow.id,:meaning=>'Low',:description=>'Low',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_todo_event_prioritylow.save
    irm_todo_event_priorityhigh= Irm::LookupValue.new(:lookup_type=>'IRM_TODO_EVENT_PRIORITY',:lookup_code=>'HIGH',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_todo_event_priorityhigh.lookup_values_tls.build(:lookup_value_id=>irm_todo_event_priorityhigh.id,:meaning=>'高',:description=>'高',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_todo_event_priorityhigh.lookup_values_tls.build(:lookup_value_id=>irm_todo_event_priorityhigh.id,:meaning=>'High',:description=>'High',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_todo_event_priorityhigh.save
    irm_todo_event_statusnot_started= Irm::LookupValue.new(:lookup_type=>'IRM_TODO_EVENT_STATUS',:lookup_code=>'NOT_STARTED',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_todo_event_statusnot_started.lookup_values_tls.build(:lookup_value_id=>irm_todo_event_statusnot_started.id,:meaning=>'未开始',:description=>'未开始',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_todo_event_statusnot_started.lookup_values_tls.build(:lookup_value_id=>irm_todo_event_statusnot_started.id,:meaning=>'Not Started',:description=>'Not Started',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_todo_event_statusnot_started.save
    irm_todo_event_statusin_progress= Irm::LookupValue.new(:lookup_type=>'IRM_TODO_EVENT_STATUS',:lookup_code=>'IN_PROGRESS',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_todo_event_statusin_progress.lookup_values_tls.build(:lookup_value_id=>irm_todo_event_statusin_progress.id,:meaning=>'进行中',:description=>'进行中',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_todo_event_statusin_progress.lookup_values_tls.build(:lookup_value_id=>irm_todo_event_statusin_progress.id,:meaning=>'In Progress',:description=>'In Progress',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_todo_event_statusin_progress.save
    irm_todo_event_statuscompleted= Irm::LookupValue.new(:lookup_type=>'IRM_TODO_EVENT_STATUS',:lookup_code=>'COMPLETED',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_todo_event_statuscompleted.lookup_values_tls.build(:lookup_value_id=>irm_todo_event_statuscompleted.id,:meaning=>'已完成',:description=>'已完成',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_todo_event_statuscompleted.lookup_values_tls.build(:lookup_value_id=>irm_todo_event_statuscompleted.id,:meaning=>'Completed',:description=>'Completed',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_todo_event_statuscompleted.save
    irm_todo_event_statuswaitting= Irm::LookupValue.new(:lookup_type=>'IRM_TODO_EVENT_STATUS',:lookup_code=>'WAITTING',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_todo_event_statuswaitting.lookup_values_tls.build(:lookup_value_id=>irm_todo_event_statuswaitting.id,:meaning=>'等待',:description=>'等待',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_todo_event_statuswaitting.lookup_values_tls.build(:lookup_value_id=>irm_todo_event_statuswaitting.id,:meaning=>'Waiting on someone else',:description=>'Waiting on someone else',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_todo_event_statuswaitting.save
    irm_todo_event_statusdeferred= Irm::LookupValue.new(:lookup_type=>'IRM_TODO_EVENT_STATUS',:lookup_code=>'DEFERRED',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_todo_event_statusdeferred.lookup_values_tls.build(:lookup_value_id=>irm_todo_event_statusdeferred.id,:meaning=>'延迟',:description=>'延迟',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_todo_event_statusdeferred.lookup_values_tls.build(:lookup_value_id=>irm_todo_event_statusdeferred.id,:meaning=>'Deferred',:description=>'Deferred',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_todo_event_statusdeferred.save
  end

  def self.down
  end
end
