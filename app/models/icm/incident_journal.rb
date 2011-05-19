class Icm::IncidentJournal < ActiveRecord::Base
  set_table_name :icm_incident_journals

  belongs_to :incident_request


  has_many :incident_histories,:foreign_key => "journal_id"

  validates_presence_of :replied_by
  validates_presence_of :message_body,:message=>I18n.t(:label_icm_incident_journal_message_body_not_blank)

  acts_as_recently_objects(:title => "title",
                           :target => "incident_request",
                           :target_controller => "icm/incident_journals",
                           :target_action => "new",
                           :target_id => "id",
                           :target_id_column => "request_id")

  # 查询出提交人
  scope :with_replied_by,lambda{
    joins("LEFT OUTER JOIN #{Irm::Person.table_name} replied ON  replied.id = #{table_name}.replied_by").
    select("#{Irm::Person.name_to_sql(nil,'replied','replied_name')},replied.avatar_file_name ,replied.avatar_updated_at")
  }

  scope :query_by_request,lambda{|request_id|
    select("#{table_name}.*").where(:incident_request_id => request_id)
  }

  scope :select_all,lambda{select("#{table_name}.*")}

  def self.list_all(request_id)
    query_by_request(request_id).with_replied_by
  end

  def self.generate_journal(incident_request,request_attributes,journal_attributes)
    incident_request_bak = incident_request.dup
    incident_journal = incident_request.incident_journals.build(journal_attributes)
    return nil unless incident_request.update_attributes(request_attributes)
    request_attributes.each do |key,value|
        ovalue = incident_request_bak.send(key)
        nvalue = incident_request.send(key)
          Icm::IncidentHistory.create({:journal_id=>incident_journal.id,
                                       :property_key=>key.to_s,
                                       :old_value=>ovalue,
                                       :new_value=>nvalue}) if !ovalue.eql?(nvalue)
    end
    return incident_journal
  end

end
