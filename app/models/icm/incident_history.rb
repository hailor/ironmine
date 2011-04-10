class Icm::IncidentHistory < ActiveRecord::Base
  set_table_name :icm_incident_histories

  belongs_to :incident_journal,:primary_key => "journal_id"

  def meaning
    return @history_meaning if @history_meaning
    title = I18n.t(("label_icm_incident_request_" + self.property_key.gsub(/\_id$/, "")).to_sym)
    old_meaning = nil
    new_meaning = nil
    old_meaning = I18n.t(:null_string) if self.old_value.nil?||self.old_value.blank?
    new_meaning = I18n.t(:null_string) if self.new_value.nil?||self.new_value.blank?
    case self.property_key
      when "support_person_id"
        if old_meaning.nil?
          real_value = Irm::Person.query_person_name(self.old_value).first
          old_meaning = real_value[:person_name] if real_value
        end
        if new_meaning.nil?
          real_value = Irm::Person.query_person_name(self.new_value).first
          new_meaning = real_value[:person_name] if real_value
        end
      when "support_group_id"
        if old_meaning.nil?
          real_value = Irm::SupportGroup.multilingual_colmun.find(self.old_value)
          old_meaning = real_value[:name] if real_value
        end
        if new_meaning.nil?
          real_value = Irm::SupportGroup.multilingual_colmun.find(self.new_value)
          new_meaning = real_value[:name] if real_value
        end
      when "incident_status_code"
        if old_meaning.nil?
          real_value = Icm::IncidentStatus.multilingual_colmun.find_by_incident_status_code(self.old_value)
          old_meaning = real_value[:name] if real_value
        end
        if new_meaning.nil?
          real_value = Icm::IncidentStatus.multilingual_colmun.find_by_incident_status_code(self.new_value)
          new_meaning = real_value[:name] if real_value
        end
      when "close_reason_code"
        if old_meaning.nil?
          real_value = Icm::CloseReason.multilingual_colmun.find_by_close_code(self.old_value)
          old_meaning = real_value[:name] if real_value
        end
        if new_meaning.nil?
          real_value = Icm::CloseReason.multilingual_colmun.find_by_close_code(self.new_value)
          new_meaning = real_value[:name] if real_value
        end
    end
    old_meaning = I18n.t(:null_string) if old_meaning.nil?
    new_meaning = I18n.t(:null_string) if new_meaning.nil?
    @history_meaning = {:title=>title,:new_meaning=>new_meaning,:old_meaning=>old_meaning}
    return @history_meaning
  end

  def to_s
    "#{meaning[:title]}: #{meaning[:old_meaning]} ==> #{meaning[:new_meaning]}"
  end
end
