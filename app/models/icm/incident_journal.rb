class Icm::IncidentJournal < ActiveRecord::Base
  set_table_name :icm_incident_journals

  belongs_to :incident_request

  has_many :incident_histories,:foreign_key => "journal_id"

  validates_presence_of :replied_by,:message_body


  # 查询出提交人
  scope :with_replied_by,lambda{
    joins("LEFT OUTER JOIN #{Irm::Person.table_name} replied ON  replied.id = #{table_name}.replied_by").
    select("#{Irm::Person.name_to_sql(nil,'replied','replied_name')}")
  }

  scope :query_by_request,lambda{|request_id|
    select("#{table_name}.*").where(:incident_request_id => request_id)
  }

  def self.list_all(request_id)
    query_by_request(request_id).with_replied_by
  end

end
