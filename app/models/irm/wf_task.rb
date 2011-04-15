class Irm::WfTask < ActiveRecord::Base
  set_table_name :irm_wf_tasks
  has_event_calendar
  validates_presence_of :name
  validates_presence_of :start_at
  serialize :url, Hash
  serialize :rrule, Hash
  belongs_to :source, :polymorphic => true
  belongs_to :calendar

  query_extend

  before_save :before_save()

  scope :with_calendar, lambda{
    select("concat(p.first_name, p.last_name) assigned_name").
        joins(", #{Irm::Calendar.table_name} c").
        joins(", #{Irm::Person.table_name} p").
        where("p.id = c.assigned_to").
        where("c.id = #{table_name}.id")}

  scope :with_priority, lambda{
    select("lvt.meaning priority_name").
        joins(", #{Irm::LookupValue.table_name} lv, #{Irm::LookupValuesTl.table_name} lvt").
        where("lvt.language = ?", I18n.locale).
        where("lvt.lookup_value_id = lv.id").
        where("lv.lookup_type = ?", "IRM_WF_TASK_PRIORITY").
        where("lv.lookup_code = #{table_name}.priority")
  }

  scope :with_task_status, lambda{
    select("lvt.meaning priority_name").
        joins(", #{Irm::LookupValue.table_name} lv, #{Irm::LookupValuesTl.table_name} lvt").
        where("lvt.language = ?", I18n.locale).
        where("lvt.lookup_value_id = lv.id").
        where("lv.lookup_type = ?", "IRM_WF_TASK_STATUS").
        where("lv.lookup_code = #{table_name}.task_status")
  }

  def rrule_string
    ret = ""
    if !self.rrule.blank?
      self.rrule.each do |k, v|
        ret << ";" if !ret.blank?
        ret << k.to_s.upcase
        ret << "="
        ret << v.to_s.upcase
      end
    end
    ret
  end

  def occurrences
    occurrences_array = []
    if self.rrule && !self.rrule.blank?
      ical_task =   RiCal.Calendar do |cal|
                      cal.event do |event|
                        event.description = self.description
                        event.dtstart =  DateTime.parse(self.start_at.strftime("%FT%T%z")) #4712-01-01T00:00:00+00:00
                        event.dtend = DateTime.parse(self.end_at.strftime("%FT%T%z"))
                        event.location = self.location
                        event.rrule = self.rrule_string#"FREQ=MONTHLY;INTERVAL=1;UNTIL=20110430T045959Z;BYDAY=MO,SU"
                      end
                    end
      occurrences_array = ical_task.events.first.occurrences(:starting => self.start_at, :before => self.start_at + 10.months).map(&:start_time)
    end
    occurrences_array
  end

  def copy_recurrences
    self.occurrences.each do |o|
      next if o.strftime("%F") == self.start_at.strftime("%F")
      new_task = Irm::WfTask.new(self.attributes)
      new_task.start_at = DateTime.parse(o.strftime("%F") + "T"  + self.start_at.strftime("%T%z"))
      new_task.end_at = DateTime.parse(o.strftime("%F") + "T"  + self.end_at.strftime("%T%z"))
      new_task.created_at = Time.now
      new_task.updated_at = Time.now
      new_task.parent_id = self.id
      new_task.save
    end
  end

  def delete_recurrences(after = Time.now)

    after = self.start_at.strftime("%F") if self.start_at - after > 1.day

    if self.parent_id && !self.parent_id.blank?
      tasks = Irm::WfTask.where("parent_id = ? AND start_at > ? AND id <> ?", self.parent_id, after, self.id)
      tasks.each do |t|
        t.destroy
      end

      self.update_attribute(:parent_id, "")
    else
      tasks = Irm::WfTask.where("parent_id = ? AND start_at > ?", self.id, after)
      tasks.each do |t|
        t.destroy
      end
    end
  end

  private
  def before_save()
    if !self.priority || self.priority.blank?
      self.priority = "NORMAL"
    end

    if !self.task_status || self.task_status.blank?
      self.task_status = "NOT_STARTED"
    end
  end
end
