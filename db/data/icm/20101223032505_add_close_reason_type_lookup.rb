# -*- coding: utf-8 -*-
class AddCloseReasonTypeLookup < ActiveRecord::Migration
  def self.up
    icm_close_type =Irm::LookupType.new(:lookup_level=>'GLOBAL',
                                         :lookup_type=>'ICM_CLOSE_REASON_TYPE',
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    icm_close_type.lookup_types_tls.build(:meaning=>"ICM关闭事件类型",
                                            :description=>"ICM关闭事件类型",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    icm_close_type.lookup_types_tls.build(:meaning=>"ICM close reason type",
                                            :description=>"ICM close reason type",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")

    icm_close_type.save
    #Enabled
    problem_reprot =Irm::LookupValue.new(:lookup_type=>'ICM_CLOSE_REASON_TYPE',
                                             :lookup_code=>"PROBLEM_REPORT",
                                             :start_date_active=>Time.now,
                                             :status_code=>'ENABLED',
                                             :not_auto_mult=>true)
    problem_reprot.lookup_values_tls.build(:meaning=>"错误报告",
                                            :description=>"错误报告",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    problem_reprot.lookup_values_tls.build(:meaning=>"Problem Report",
                                            :description=>"Problem Report",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")

    problem_reprot.save

  end

  def self.down
    #delete lookup type
    icm_close_type = Irm::LookupType.where(:lookup_type=>"ICM_CLOSE_REASON_TYPE").first
    icm_close_type.destroy if icm_close_type

    #delete lookup code
    problem_reprot = Irm::LookupValue.where(:lookup_type=>"ICM_CLOSE_REASON_TYPE",:lookup_code=>"PROBLEM_REPORT").first
    problem_reprot.destroy if problem_reprot

  end
end
