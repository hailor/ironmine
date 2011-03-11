# -*- coding: utf-8 -*-
class ModifyLabelDescriptionData < ActiveRecord::Migration
  def self.up
     system_report_lookup_value =  Irm::LookupValue.query_by_lookup_type("IRM_REPORT_CATEGORY").
                                      query_by_lookup_code("SYSTEM_GLOBAL").first
     if system_report_lookup_value.present?
        lookup_values_en = Irm::LookupValuesTl.query_by_lookup_value_id(system_report_lookup_value.id,"en").first
        lookup_values_en.update_attributes({:meaning=>"System Report",:description=>"System Report"})
     end

     person_report1 =Irm::Report.query_by_report_code("IRM_PERSON_LOGIN_SUMMARY").first
     if person_report1.present?
         person_report_tl_en = Irm::ReportsTl.query_by_report_id(person_report1.id).query_by_language("en").first
         person_report_tl_en.update_attributes({:name=>"Person Login Summary Report",
                                                :description=>"Person Login Summary Report"})
     end

     person_report2 =Irm::Report.query_by_report_code("SKM_ENTRY_SUBMIT_SUMMARY").first
     if person_report2.present?
         person_report_tl_en = Irm::ReportsTl.query_by_report_id(person_report2.id).query_by_language("en").first
         person_report_tl_en.update_attributes({:name=>"Service Knowledge Entry Summary Report",
                                                :description=>"Service Knowledge Entry Summary Report"})
     end

     survey_menu_entry1 = Irm::MenuEntry.query_by_menu_code("IRM_SERVICE_OPERATION_MENU").
                                         query_by_sub_menu_code("IRM_SOC_SURVEY_MENU").first
     if survey_menu_entry1.present?
         survey_menu_entry_en1 = Irm::MenuEntriesTl.query_by_menu_entry_id(survey_menu_entry1.id).
                                                     query_by_language("zh").first
         survey_menu_entry_en1.update_attributes({:name=>"调查问卷",:description=>"调查问卷"})
     end

     survey_menu_entry2 = Irm::MenuEntry.query_by_menu_code("IRM_SOC_SURVEY_MENU").
                                         query_by_permission_code("CSI_SURVEY_SUBJECTS_INDEX").first

     if survey_menu_entry2.present?
         survey_menu_entry_en2 = Irm::MenuEntriesTl.query_by_menu_entry_id(survey_menu_entry2.id).
                                                     query_by_language("zh").first
         survey_menu_entry_en2.update_attributes({:name=>"调查问卷主题",:description=>"调查问卷主题"})
     end

     survey_menu_entry3 = Irm::MenuEntry.query_by_menu_code("IRM_SOC_SURVEY_MENU").
                                         query_by_permission_code("CSI_SURVEYS_INDEX").first
     if survey_menu_entry3.present?
         survey_menu_entry_en3 = Irm::MenuEntriesTl.query_by_menu_entry_id(survey_menu_entry3.id).
                                                     query_by_language("zh").first
         survey_menu_entry_en3.update_attributes({:name=>"调查问卷",:description=>"调查问卷"})     
     end
  end

  def self.down
  end
end
