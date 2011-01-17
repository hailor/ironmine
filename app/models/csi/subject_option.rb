class Csi::SubjectOption < ActiveRecord::Base
  set_table_name :csi_survey_subject_options

  belongs_to :survey_subject,:foreign_key=>"subject_id"

  scope :query_by_subject_id, lambda{|subject_id,option_type|
               joins(:survey_subject).
               where("#{table_name}.subject_id = ? and  #{Csi::SurveySubject.table_name}.input_type=?",
                     subject_id,option_type)
  }

  def self.delete_by_subject(subject_id)
    delete_all :subject_id=>subject_id
  end

end