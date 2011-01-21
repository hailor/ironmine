class Icm::IncidentHistory < ActiveRecord::Base
  set_table_name :icm_incident_histories

  belongs_to :incident_journal,:primary_key => "journal_id"
end
