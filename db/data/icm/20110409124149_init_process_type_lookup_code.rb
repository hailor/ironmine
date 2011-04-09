# -*- coding: utf-8 -*-
class InitProcessTypeLookupCode < ActiveRecord::Migration
  def self.up
    rule_setting_process_type =Irm::LookupType.new(:lookup_level=>'GLOBAL',
                                         :lookup_type=>'ICM_ASSIGN_PROCESS_TYPE',
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    rule_setting_process_type.lookup_types_tls.build(:lookup_type_id=>rule_setting_process_type.id,
                                            :meaning=>"ICM分配流程",
                                            :description=>"ICM分配流程",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    rule_setting_process_type.lookup_types_tls.build(:lookup_type_id=>rule_setting_process_type.id,
                                            :meaning=>"ICM dispatch process",
                                            :description=>"ICM dispatch process",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")

    rule_setting_process_type.save
    #Enabled
    normal_process =Irm::LookupValue.new(:lookup_type=>'ICM_ASSIGN_PROCESS_TYPE',
                                             :lookup_code=>"MINI_OPEN_TASK",
                                             :start_date_active=>Time.now,
                                             :status_code=>'ENABLED',
                                             :not_auto_mult=>true)
    normal_process.lookup_values_tls.build(:lookup_value_id=>normal_process.id,
                                            :meaning=>"最少任务",
                                            :description=>"最少任务",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    normal_process.lookup_values_tls.build(:lookup_value_id=>normal_process.id,
                                            :meaning=>"Minimum Open Task",
                                            :description=>"Minimum Open Task",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")

    normal_process.save

    #Enabled
    l_process =Irm::LookupValue.new(:lookup_type=>'ICM_ASSIGN_PROCESS_TYPE',
                                             :lookup_code=>"LONGEST_TIME_NOT_ASSIGN",
                                             :start_date_active=>Time.now,
                                             :status_code=>'ENABLED',
                                             :not_auto_mult=>true)
    l_process.lookup_values_tls.build(:lookup_value_id=>l_process.id,
                                            :meaning=>"最久未分配",
                                            :description=>"最久未分配",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    l_process.lookup_values_tls.build(:lookup_value_id=>l_process.id,
                                            :meaning=>"Longest Time not Assign",
                                            :description=>"Longest Time not Assign",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")

    l_process.save
    Icm::RuleSetting.delete_all
  end

  def self.down
    #delete lookup type
    rule_setting_process_type = Irm::LookupType.where(:lookup_type=>"ICM_ASSIGN_PROCESS_TYPE").first
    rule_setting_process_type.destroy if rule_setting_process_type

    #delete lookup code
    normal_process = Irm::LookupValue.where(:lookup_type=>"ICM_ASSIGN_PROCESS_TYPE",:lookup_code=>"MINI_OPEN_TASK").first
    normal_process.destroy if normal_process

    l_process = Irm::LookupValue.where(:lookup_type=>"ICM_ASSIGN_PROCESS_TYPE",:lookup_code=>"LONGEST_TIME_NOT_ASSIGN").first
    l_process.destroy if l_process


  end
end
