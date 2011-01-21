class Csi::SurveySubject < ActiveRecord::Base
  set_table_name :csi_survey_subjects

  belongs_to :survey
  has_many :subject_options,:foreign_key=>"subject_id"

  TYPES = [['text', 'string'], ['paragraph_text', 'text'],
              ['multi_choice', 'radio'], ['checkboxes', 'check'],
              ['choose_from_a_list', 'drop'],
              ['page_break', 'page']]



  scope :query_by_subject_id,lambda{|subject_id|
                        select("#{table_name}.required_flag").
                        where(:id=>subject_id)
  }

  scope :query_by_survey_id,lambda{|survey_id| where(:survey_id=>survey_id)}

end
