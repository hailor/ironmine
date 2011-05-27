class Csi::Survey < ActiveRecord::Base
  set_table_name :csi_surveys

  query_extend
  acts_as_recently_objects(:title => "title",
                           :target_controller => "csi/surveys")

  validates_presence_of :title
  validates_uniqueness_of :title

  validates_presence_of :due_dates,:if=>Proc.new{|i| i.with_incident_request.eql?(Irm::Constant::SYS_YES)}
  validates_presence_of :closed_datetime,:if=>Proc.new{|i| i.with_incident_request.eql?(Irm::Constant::SYS_NO)}


  has_many :todo_events, :as => :source
  has_many :survey_subjects
  has_many :survey_members
  has_many :survey_ranges
  scope :query_by_person_id,lambda{|person_id| where(:person_id=>person_id)}
  scope :query_wrap_info,lambda{|language| select("#{table_name}.*,v1.meaning status_meaning, DATE_FORMAT(#{table_name}.created_at, '%Y-%m-%d') published_at").
                                                   joins(",irm_lookup_values_vl v1").
                                                   where("v1.lookup_type='SYSTEM_STATUS_CODE' AND v1.lookup_code = #{table_name}.status_code AND "+
                                                         "v1.language=?",language)}

  acts_as_searchable
  scope :with_person_count, lambda{
    select(" 0 person_count")
  }

  scope :with_allow_author, lambda{
    select(" ' ' allow_author_only")
  }

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


  def self.search(query)
    self.where("#{table_name}.title like ?","%#{query}%")
  end

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

  def current_author?
    if (self.author_id&&Irm::Person.current.id.eql?(self.author_id)) || (Irm::Person.current.login_name=="admin")
      Irm::Constant::SYS_YES
    else
      Irm::Constant::SYS_NO
    end
  end

  def to_s
    self.title
  end

  def joined_count
    Csi::SurveyMember.query_by_survey_id(self.id).where(:response_flag=>Irm::Constant::SYS_YES).count
  end


  def generate_member
    return if Irm::Constant::SYS_YES.eql?(self.with_incident_request)
    exists_member_ids = survey_members.collect{|i| i.person_id}
    self.survey_ranges.sort_by{|i| i.required_flag}.each do |sr|
      person_ids = sr.person_ids
      person_ids.each do |pid|
        if exists_member_ids.include?(pid)
          sm = Csi::SurveyMember.where(:survey_id=>self.id,:person_id=>pid).first
          sm.update_attributes(:required_flag=>sr.required_flag,:end_date_active=>self.closed_datetime) if sm
        else
          Csi::SurveyMember.create(:survey_id=>self.id,:person_id=>pid,:required_flag=>sr.required_flag,:response_flag=>Irm::Constant::SYS_NO,:end_date_active=>self.closed_datetime)
        end
      end
      exists_member_ids = exists_member_ids + person_ids
      exists_member_ids.uniq
    end
  end

  def clear_member
    Csi::SurveyMember.delete_all(["survey_id = ? AND response_flag = ?",self.id,Irm::Constant::SYS_NO])
  end

  def self.current_accessible(companies = [])
    Csi::SurveyMember.list_all.query_by_person(Irm::Person.current.id).collect(&:survey_id)
  end


  private
  def generate_survey_code
    self.survey_code = "CSI"+ 1000000.to_s + (id % 1000000).to_s
    self.update_attribute(:survey_code, self.survey_code)
  end
end
