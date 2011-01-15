class Csi::Survey < ActiveRecord::Base
  set_table_name :csi_surveys

  validates_presence_of :title
  validates_uniqueness_of :title

  has_many :survey_subjects

  scope :query_by_person_id,lambda{|person_id| where(:person_id=>person_id)}
  scope :query_common,where("1=1")


  def init_survey_code
    nil
  end

end
