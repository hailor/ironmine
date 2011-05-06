class Csi::SurveyMember < ActiveRecord::Base
  set_table_name :csi_survey_members

  query_extend


  belongs_to :survey

  validates_uniqueness_of :person_id,:scope=>[:survey_id],:if=>Proc.new{|i| i.source_id.nil?}
  validates_uniqueness_of :person_id,:scope=>[:survey_id,:source_id],:if=>Proc.new{|i| !i.source_id.nil?}


  scope :query_by_survey_id,lambda{|survey_id| where(:survey_id => survey_id)}
  scope :query_by_person_id,lambda{|person_id| where(:person_id => person_id)}
  scope :query_by_response_flag,lambda{|response_flag| where(:response_flag=>response_flag)}

  scope :query_by_end_date_active,where("#{table_name}.end_date_active >= now() or  IsNull(#{table_name}.end_date_active)")
  
  scope :query_by_person,lambda{|person_id|
    where(:person_id=>person_id)
  }


  scope :with_survey,lambda{
    joins("JOIN #{Csi::Survey.table_name} ON #{Csi::Survey.table_name}.id = #{table_name}.survey_id").
    select("#{Csi::Survey.table_name}.title, #{Csi::Survey.table_name}.closed_datetime")
  }

  def self.list_all
    select("#{table_name}.*").with_survey
  end


  def respond?
    Irm::Constant::SYS_YES.eql?(self.response_flag)
  end


end