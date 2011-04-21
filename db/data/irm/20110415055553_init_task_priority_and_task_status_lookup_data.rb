# -*- coding: utf-8 -*-
class InitTaskPriorityAndTaskStatusLookupData < ActiveRecord::Migration
  def self.up
    irm_wf_task_priority=Irm::LookupType.new(:lookup_level=>'GLOBAL',:lookup_type=>'IRM_WF_TASK_PRIORITY',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_wf_task_priority.lookup_types_tls.build(:lookup_type_id=>irm_wf_task_priority.id,:meaning=>'任务优先级',:description=>'任务优先级',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_wf_task_priority.lookup_types_tls.build(:lookup_type_id=>irm_wf_task_priority.id,:meaning=>'Task Priorities',:description=>'Task Priorities',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_wf_task_priority.save
    irm_wf_task_status=Irm::LookupType.new(:lookup_level=>'GLOBAL',:lookup_type=>'IRM_WF_TASK_STATUS',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_wf_task_status.lookup_types_tls.build(:lookup_type_id=>irm_wf_task_status.id,:meaning=>'任务状态',:description=>'任务状态',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_wf_task_status.lookup_types_tls.build(:lookup_type_id=>irm_wf_task_status.id,:meaning=>'Task Statuses',:description=>'Task Statuses',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_wf_task_status.save

    irm_wf_task_prioritynormal= Irm::LookupValue.new(:lookup_type=>'IRM_WF_TASK_PRIORITY',:lookup_code=>'NORMAL',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_wf_task_prioritynormal.lookup_values_tls.build(:lookup_value_id=>irm_wf_task_prioritynormal.id,:meaning=>'一般',:description=>'一般',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_wf_task_prioritynormal.lookup_values_tls.build(:lookup_value_id=>irm_wf_task_prioritynormal.id,:meaning=>'Normal',:description=>'Normal',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_wf_task_prioritynormal.save
    irm_wf_task_prioritylow= Irm::LookupValue.new(:lookup_type=>'IRM_WF_TASK_PRIORITY',:lookup_code=>'LOW',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_wf_task_prioritylow.lookup_values_tls.build(:lookup_value_id=>irm_wf_task_prioritylow.id,:meaning=>'低',:description=>'低',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_wf_task_prioritylow.lookup_values_tls.build(:lookup_value_id=>irm_wf_task_prioritylow.id,:meaning=>'Low',:description=>'Low',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_wf_task_prioritylow.save
    irm_wf_task_priorityhigh= Irm::LookupValue.new(:lookup_type=>'IRM_WF_TASK_PRIORITY',:lookup_code=>'HIGH',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_wf_task_priorityhigh.lookup_values_tls.build(:lookup_value_id=>irm_wf_task_priorityhigh.id,:meaning=>'高',:description=>'高',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_wf_task_priorityhigh.lookup_values_tls.build(:lookup_value_id=>irm_wf_task_priorityhigh.id,:meaning=>'High',:description=>'High',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_wf_task_priorityhigh.save
    irm_wf_task_statusnot_started= Irm::LookupValue.new(:lookup_type=>'IRM_WF_TASK_STATUS',:lookup_code=>'NOT_STARTED',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_wf_task_statusnot_started.lookup_values_tls.build(:lookup_value_id=>irm_wf_task_statusnot_started.id,:meaning=>'未开始',:description=>'未开始',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_wf_task_statusnot_started.lookup_values_tls.build(:lookup_value_id=>irm_wf_task_statusnot_started.id,:meaning=>'Not Started',:description=>'Not Started',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_wf_task_statusnot_started.save
    irm_wf_task_statusin_progress= Irm::LookupValue.new(:lookup_type=>'IRM_WF_TASK_STATUS',:lookup_code=>'IN_PROGRESS',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_wf_task_statusin_progress.lookup_values_tls.build(:lookup_value_id=>irm_wf_task_statusin_progress.id,:meaning=>'进行中',:description=>'进行中',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_wf_task_statusin_progress.lookup_values_tls.build(:lookup_value_id=>irm_wf_task_statusin_progress.id,:meaning=>'In Progress',:description=>'In Progress',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_wf_task_statusin_progress.save
    irm_wf_task_statuscompeted= Irm::LookupValue.new(:lookup_type=>'IRM_WF_TASK_STATUS',:lookup_code=>'COMPLETED',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_wf_task_statuscompeted.lookup_values_tls.build(:lookup_value_id=>irm_wf_task_statuscompeted.id,:meaning=>'已完成',:description=>'已完成',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_wf_task_statuscompeted.lookup_values_tls.build(:lookup_value_id=>irm_wf_task_statuscompeted.id,:meaning=>'Completed',:description=>'Completed',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_wf_task_statuscompeted.save
    irm_wf_task_statuswaitting= Irm::LookupValue.new(:lookup_type=>'IRM_WF_TASK_STATUS',:lookup_code=>'WAITTING',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_wf_task_statuswaitting.lookup_values_tls.build(:lookup_value_id=>irm_wf_task_statuswaitting.id,:meaning=>'等待',:description=>'等待',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_wf_task_statuswaitting.lookup_values_tls.build(:lookup_value_id=>irm_wf_task_statuswaitting.id,:meaning=>'Waiting on someone else',:description=>'Waiting on someone else',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_wf_task_statuswaitting.save
    irm_wf_task_statusdeferred= Irm::LookupValue.new(:lookup_type=>'IRM_WF_TASK_STATUS',:lookup_code=>'DEFERRED',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_wf_task_statusdeferred.lookup_values_tls.build(:lookup_value_id=>irm_wf_task_statusdeferred.id,:meaning=>'延迟',:description=>'延迟',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_wf_task_statusdeferred.lookup_values_tls.build(:lookup_value_id=>irm_wf_task_statusdeferred.id,:meaning=>'Deferred',:description=>'Deferred',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_wf_task_statusdeferred.save
  end

  def self.down
  end
end
