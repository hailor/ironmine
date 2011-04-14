class Irm::Calendar < ActiveRecord::Base
  set_table_name :irm_calendars
  validates_presence_of :name
  has_many :wf_tasks

  query_extend

  def self.current_calendar(person_id)
    cal = Irm::Calendar.where(:assigned_to => person_id, :current => Irm::Constant::SYS_YES).enabled.first
    unless cal
      cal = Irm::Calendar.new(:assigned_to => person_id, :name => "Default", :status_code => Irm::Constant::ENABLED)
      cal.save
      cal.set_current
    end
    cal
  end

  def set_current
    cals = Irm::Calendar.where(:assigned_to => self.assigned_to)
    cals.each do |c|
      c.update_attribute(:current, Irm::Constant::SYS_NO)
    end
    self.update_attribute(:current, Irm::Constant::SYS_YES)
  end

  def self.current
    cal = Irm::Calendar.where(:assigned_to => Irm::Person.current.id, :current => Irm::Constant::SYS_YES).enabled.first
    cal
  end
end
