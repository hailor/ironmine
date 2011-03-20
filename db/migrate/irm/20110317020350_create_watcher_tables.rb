class CreateWatcherTables < ActiveRecord::Migration
  def self.up
    create_table "irm_watchers", :force => true do |t|
      t.integer  "company_id"
      t.integer  "watchable_id"
      t.string   "watchable_type",     :limit => 30
      t.integer  "member_id"
      t.string   "member_type",       :limit => 30
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "irm_watchers", ["company_id","watchable_id","watchable_type"],:name => "IRM_WATCHERS_N1"
    add_index "irm_watchers", ["company_id","member_id","watchable_id","member_type"],:name => "IRM_WATCHERS_N2"

  end

  def self.down
    drop_table "irm_watchers"
  end
end
