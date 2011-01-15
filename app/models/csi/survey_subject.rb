class Csi::SurveySubject < ActiveRecord::Base
  set_table_name :csi_survey_subjects

  belongs_to :survey


  TYPES = [['text', 'string'], ['paragraph_text', 'text'],
              ['multi_choice', 'radio'], ['checkboxes', 'check'],
              ['choose_from_a_list', 'drop'],
              ['page_break', 'page']]

end
