class Irm::CalendarTask < ActiveRecord::Base
  set_table_name :irm_calendar_tasks
  has_event_calendar
  validates_presence_of :name
  validates_uniqueness_of :name
  serialize :url, Hash
  belongs_to :source, :polymorphic => true

  def set_url(url_options)

  end
end
