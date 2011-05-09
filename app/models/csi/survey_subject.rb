class Csi::SurveySubject < ActiveRecord::Base
  set_table_name :csi_survey_subjects

  belongs_to :survey
  has_many :subject_options, :foreign_key=>"subject_id"
  has_many :survey_results, :foreign_key => "subject_id"
  validates_presence_of :name,:seq_num

  TYPES = [['text', 'string'], ['paragraph_text', 'text'],
              ['multi_choice', 'radio'], ['checkboxes', 'check'],
              ['choose_from_a_list', 'drop'],
              ['page_break', 'page']]



  scope :query_by_subject_id,lambda{|subject_id|
                        select("#{table_name}.required_flag").
                        where(:id=>subject_id)
  }

  scope :query_by_choice_input,where("input_type not in ('string','text')")

  scope :order_by_id_desc,order("id desc")
  
  scope :query_by_survey_id,lambda{|survey_id| where(:survey_id=>survey_id)}

  def self.get_max_seq_num(survey_id)
     next_seq_num = self.query_by_survey_id(survey_id).maximum("seq_num")
     if next_seq_num.blank?
       next_seq_num = 10
     else
       next_seq_num = (next_seq_num/10.round + 1)*10       
     end
     next_seq_num
  end

  #acts_as_recently_objects(:title => "title",
  #                         :target_controller => "csi/surveys",
  #                         :target => "survey")
end
