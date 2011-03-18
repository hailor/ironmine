class Irm::Watcher < ActiveRecord::Base
  set_table_name :irm_watchers

  belongs_to :watchable, :polymorphic => true
  belongs_to :member,:polymorphic => true

  validates_uniqueness_of :member_id, :scope => [:member_type,:watchable_type, :watchable_id]
end