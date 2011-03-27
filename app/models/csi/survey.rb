class Csi::Survey < ActiveRecord::Base
  set_table_name :csi_surveys

  query_extend

  validates_presence_of :title
  validates_uniqueness_of :title

  has_many :survey_subjects

  scope :query_by_person_id,lambda{|person_id| where(:person_id=>person_id)}
  scope :query_wrap_info,lambda{|language| select("#{table_name}.*,v1.meaning status_meaning").
                                                   joins(",irm_lookup_values_vl v1").
                                                   where("v1.lookup_type='SYSTEM_STATUS_CODE' AND v1.lookup_code = #{table_name}.status_code AND "+
                                                         "v1.language=?",language)}

  scope :query_recently_ten_reply,lambda{
    select("#{table_name}.id, #{table_name}.title title, sr.updated_at updated_at").
      joins(",#{Csi::SurveySubject.table_name} ss, #{Csi::SurveyResult.table_name} sr").
      where("ss.survey_id = #{table_name}.id").
      where("sr.subject_id = ss.id").
      where("sr.updated_at = (SELECT MAX(srr.updated_at) FROM #{Csi::SurveyResult.table_name} srr WHERE srr.subject_id = ss.id)").
      order("sr.updated_at DESC")
  }

  scope :query_recently_ten_update,lambda{
    select("#{table_name}.id, #{table_name}.title title, #{table_name}.updated_at updated_at").order("#{table_name}.updated_at DESC")

  }

  after_create :generate_survey_code


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

  def self.find_recently_ten
    recently_reply = query_recently_ten_reply
    recently_updated = query_recently_ten_update

    recently = recently_reply.uniq + recently_updated.uniq
    recently = recently.sort{|x, y| y[:updated_at] <=> x[:updated_at] }

    recently.each do |r|
      r.attributes.except(:updated_at)
    end
    recently.uniq
  end

  private
  def generate_survey_code
    self.survey_code = "CSI"+ 1000000.to_s + (id % 1000000).to_s
    self.update_attribute(:survey_code,self.survey_code)
  end

end
