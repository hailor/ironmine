class Csi::Survey < ActiveRecord::Base
  set_table_name :csi_surveys

  validates_presence_of :title
  validates_uniqueness_of :title

  has_many :survey_subjects

  scope :query_by_person_id,lambda{|person_id| where(:person_id=>person_id)}
  scope :query_common,where("1=1")

  before_create :generate_survey_code


  def total_page
    @total_page ||= (self.survey_subjects.select{|f| f.input_type == 'page'}.length + 1)
  end

  def find_subjects_by_page(page)
    subjects = self.survey_subjects.sort {|f1, f2| f1.seq_num <=> f2.seq_num}
    pages = subjects.select{|f| f.input_type == 'page'}
    pages.insert(0, nil)
    pages << nil

    if pages.length > 2
      start = pages[(page) -1].nil? ? 0 : pages[(page) -1].seq_num
      stop  = pages[page].nil? ? 65535 : pages[page].seq_num
      subjects.select {|f| f.seq_num > start && f.seq_num < stop}
    else
      subjects
    end
  end

  private
  def generate_survey_code
    self.survey_code = "CSI"+ 1000000.to_s + (id % 1000000).to_s
  end

end
