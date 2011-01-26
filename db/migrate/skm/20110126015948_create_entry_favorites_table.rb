class CreateEntryFavoritesTable < ActiveRecord::Migration
  def self.up
    create_table :skm_entry_favorites, :force => true do |t|
      t.integer "company_id", :null => false
      t.integer "entry_header_id", :null => false
      t.integer "person_id", :null => false
      t.string   "status_code", :limit => 30, :default=>"ENABLED", :null => false
      t.integer  "created_by", :null => false
      t.integer  "updated_by", :null => false
      t.datetime "created_at", :null => false
      t.datetime "updated_at", :null => false
    end
  end

  def self.down
  end
end
