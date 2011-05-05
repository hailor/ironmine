class Irm::TodoTask < ActiveRecord::Base
  set_table_name :irm_todo_tasks

  validates_presence_of :name
  validates_presence_of :start_at
  serialize :url, Hash
  serialize :rrule, Hash
  belongs_to :source, :polymorphic => true
  belongs_to :calendar

  query_extend

  scope :with_all, lambda{select("#{table_name}.*")}

  scope :with_calendar, lambda{
    select("concat(p.first_name, p.last_name) assigned_name, assigned_to assigned_to").
        joins(", #{Irm::Calendar.table_name} c").
        joins(", #{Irm::Person.table_name} p").
        where("p.id = c.assigned_to").
        where("c.id = #{table_name}.calendar_id")}

  scope :with_priority, lambda{
    select("lvt2.meaning priority_name").
        joins(", #{Irm::LookupValue.table_name} lv2, #{Irm::LookupValuesTl.table_name} lvt2").
        where("lvt2.language = ?", I18n.locale).
        where("lvt2.lookup_value_id = lv2.id").
        where("lv2.lookup_type = ?", "IRM_TODO_EVENT_PRIORITY").
        where("lv2.lookup_code = #{table_name}.priority")
  }

  scope :with_task_status, lambda{
    select("lvt.meaning task_status_name").
        joins(", #{Irm::LookupValue.table_name} lv, #{Irm::LookupValuesTl.table_name} lvt").
        where("lvt.language = ?", I18n.locale).
        where("lvt.lookup_value_id = lv.id").
        where("lv.lookup_type = ?", "IRM_TODO_EVENT_STATUS").
        where("lv.lookup_code = #{table_name}.task_status")
  }

  scope :with_open, lambda{
    where("#{table_name}.task_status <> ?", "COMPLETED")
  }

  scope :with_overdue, lambda{
    where("#{table_name}.due_date < ?", Time.strptime(Time.now.strftime("%F"), "%F"))
  }

  scope :with_in7day, lambda{
    where("#{table_name}.due_date >= ? AND #{table_name}.due_date < ?",
          Time.strptime(Time.now.strftime("%F"), "%F"),
          Time.strptime(Time.now.strftime("%F"), "%F") + 7.days)
  }

  scope :uncompleted, lambda{
    where("#{table_name}.task_status <> ?", "COMPLETED")
  }

  scope :with_today, lambda{
    where("#{table_name}.due_date >= ? AND #{table_name}.due_date < ?",
          Time.strptime(Time.now.strftime("%F"), "%F"),
          Time.strptime(Time.now.strftime("%F"), "%F") + 1.day)
  }

  scope :assigned_to, lambda{|person_id|
    where("c.assigned_to = ?", person_id)
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
                      cal.event do |todo|
                        todo.description = self.description
                        todo.dtstart =  DateTime.parse(self.start_at.strftime("%FT%T%z")) #4712-01-01T00:00:00+00:00
                        todo.dtend = DateTime.parse(self.start_at.strftime("%FT%T%z"))
                        todo.rrule = self.rrule_string#"FREQ=MONTHLY;INTERVAL=1;UNTIL=20110430T045959Z;BYDAY=MO,SU"
                      end
      end
      occurrences_array = ical_task.events.first.occurrences(:starting => self.start_at, :before => self.start_at + 10.months).map(&:start_time)
    end
    occurrences_array
  end

  def copy_recurrences
    self.occurrences.each do |o|
      next if o.strftime("%F") == self.start_at.strftime("%F")
      new_task = Irm::TodoTask.new(self.attributes)
      new_task.start_at = DateTime.parse(o.strftime("%F") + "T"  + self.start_at.strftime("%T%z"))
      new_task.due_date = new_task.start_at + 1.day
      new_task.created_at = Time.now
      new_task.updated_at = Time.now
      new_task.parent_id = self.id
      new_task.save
    end
  end

  def delete_recurrences(after = Time.now)

    after = self.start_at.strftime("%F") if self.start_at - after > 1.day

    if self.parent_id && !self.parent_id.blank?
      tasks = Irm::TodoTask.where("parent_id = ? AND start_at > ? AND id <> ?", self.parent_id, after, self.id)
      tasks.each do |t|
        t.destroy
      end

      self.update_attribute(:parent_id, "")
    else
      tasks = Irm::TodoTask.where("parent_id = ? AND start_at > ?", self.id, after)
      tasks.each do |t|
        t.destroy
      end
    end
  end
end