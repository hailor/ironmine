# -*- coding: utf-8 -*-
class InitIncidentPhaseStatus < ActiveRecord::Migration
  def self.up
    Icm::IncidentPhase.delete_all
    Icm::IncidentPhasesTl.delete_all
    Icm::IncidentStatus.delete_all
    Icm::IncidentStatusesTl.delete_all
    ip_record_info = Icm::IncidentPhase.new(:phase_code=>'RECORD_INFO',
                                   :display_sequence=>10,
                                   :not_auto_mult=>true)
    ip_record_info.incident_phases_tls.build(:language=>'zh',:name=>'记录信息',:description=>'记录信息',:source_lang=>'en')
    ip_record_info.incident_phases_tls.build(:language=>'en',:name=>'Record info',:description=>'Record info',:source_lang=>'en')
    ip_record_info.save


    ip_investigation = Icm::IncidentPhase.new(:phase_code=>'INVESTIGATION_DIAGNOSIS',
                                   :display_sequence=>20,
                                   :not_auto_mult=>true)
    ip_investigation.incident_phases_tls.build(:language=>'zh',:name=>'调查和诊断',:description=>'调查和诊断',:source_lang=>'en')
    ip_investigation.incident_phases_tls.build(:language=>'en',:name=>'Investigation diagnosis',:description=>'Investigation diagnosis',:source_lang=>'en')
    ip_investigation.save

    ip_solve = Icm::IncidentPhase.new(:phase_code=>'SOLVE_RECOVER',
                                   :display_sequence=>30,
                                   :not_auto_mult=>true)
    ip_solve.incident_phases_tls.build(:language=>'zh',:name=>'解决和恢复',:description=>'解决和恢复',:source_lang=>'en')
    ip_solve.incident_phases_tls.build(:language=>'en',:name=>'Solve recover',:description=>'Solve recover',:source_lang=>'en')
    ip_solve.save

    ip_close = Icm::IncidentPhase.new(:phase_code=>'CLOSE_INCIDENT',
                                   :display_sequence=>40,
                                   :not_auto_mult=>true)
    ip_close.incident_phases_tls.build(:language=>'zh',:name=>'关闭事故单',:description=>'关闭事故单',:source_lang=>'en')
    ip_close.incident_phases_tls.build(:language=>'en',:name=>'Close incident',:description=>'Close incident',:source_lang=>'en')
    ip_close.save

    is_new = Icm::IncidentStatus.new(:incident_status_code=>'NEW_INCIDENT',
                                   :phase_code =>'RECORD_INFO',
                                   :display_sequence=>10,
                                   :default_flag=>'Y',
                                   :not_auto_mult=>true)
    is_new.incident_statuses_tls.build(:language=>'zh',:name=>'新建',:description=>'新建',:source_lang=>'en')
    is_new.incident_statuses_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    is_new.save

    is_confirm = Icm::IncidentStatus.new(:incident_status_code=>'CONFIRM_INCIDENT_INFO',
                                   :phase_code =>'RECORD_INFO',
                                   :display_sequence=>20,
                                   :default_flag=>'Y',
                                   :not_auto_mult=>true)
    is_confirm.incident_statuses_tls.build(:language=>'zh',:name=>'确认事故信息',:description=>'确认事故信息',:source_lang=>'en')
    is_confirm.incident_statuses_tls.build(:language=>'en',:name=>'Confirm the incident information',:description=>'Confirm the incident information',:source_lang=>'en')
    is_confirm.save

    is_diagnosis = Icm::IncidentStatus.new(:incident_status_code=>'INVESTIGATION_DIAGNOSIS',
                                   :phase_code =>'INVESTIGATION_DIAGNOSIS',
                                   :display_sequence=>30,
                                   :default_flag=>'Y',
                                   :not_auto_mult=>true)
    is_diagnosis.incident_statuses_tls.build(:language=>'zh',:name=>'调查诊断',:description=>'调查诊断',:source_lang=>'en')
    is_diagnosis.incident_statuses_tls.build(:language=>'en',:name=>'Investigation and diagnosis',:description=>'Investigation and diagnosis',:source_lang=>'en')
    is_diagnosis.save

    is_solve = Icm::IncidentStatus.new(:incident_status_code=>'SOLVE_RECOVER',
                                   :phase_code =>'SOLVE_RECOVER',
                                   :display_sequence=>40,
                                   :default_flag=>'Y',
                                   :not_auto_mult=>true)
    is_solve.incident_statuses_tls.build(:language=>'zh',:name=>'解决和恢复',:description=>'解决和恢复',:source_lang=>'en')
    is_solve.incident_statuses_tls.build(:language=>'en',:name=>'Solve recover',:description=>'Solve recover',:source_lang=>'en')
    is_solve.save

    is_close = Icm::IncidentStatus.new(:incident_status_code=>'CLOSE_INCIDENT',
                                   :phase_code =>'CLOSE_INCIDENT',
                                   :display_sequence=>40,
                                   :default_flag=>'Y',
                                   :not_auto_mult=>true)
    is_close.incident_statuses_tls.build(:language=>'zh',:name=>'关闭',:description=>'关闭',:source_lang=>'en')
    is_close.incident_statuses_tls.build(:language=>'en',:name=>'Closed',:description=>'Closed',:source_lang=>'en')
    is_close.save
    
  end

  def self.down
    Icm::IncidentPhase.delete_all
    Icm::IncidentPhasesTl.delete_all
    Icm::IncidentStatus.delete_all
    Icm::IncidentStatusesTl.delete_all    
  end
end
