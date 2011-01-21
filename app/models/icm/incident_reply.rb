class Icm::IncidentReply
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :support_group_id, :support_person_id, :incident_status_code


  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def attributes=(attributes)
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def attributes
    attrs = {}
    [:support_group_id,:support_person_id,:incident_status_code].each do |key|
      value = send(key)
      attrs.merge!({key=>value}) if(value&&!value.blank?)
    end
    attrs
  end

  def persisted?
    false
  end
end