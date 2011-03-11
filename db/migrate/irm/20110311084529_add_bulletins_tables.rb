class AddBulletinsTables < ActiveRecord::Migration
  def self.up
    create_table "irm_bulletins", :force => true do |t| 
      t.integer "company_id", :null => false
      t.string "title", :limit => 150, :null => false
      t.string "summary", :limit => 240
      t.string "content", :limit => 3000
      t.string "important_code", :limit => 30
      t.string "sticky_flag", :limit => 30
      t.string "highlight_flag", :limit => 30
      t.integer "page_views"
      t.string "status_code", :limit => 30, :default => "ENABLED"
      t.integer  :created_by
      t.integer  :updated_by
      t.datetime :created_at
      t.datetime :updated_at     
    end

    create_table "irm_bulletin_accesses", :force => true do |t|
      t.integer "company_id", :null => false
      t.integer "bulletin_id", :null => false
      t.string "access_type", :null => false
      t.integer "access_id", :null => false
      t.string "status_code", :limit => 30, :default => "ENABLED"
      t.integer  :created_by
      t.integer  :updated_by
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table "irm_bulletins"
    drop_table "irm_bulletin_accesses"
  end
end
