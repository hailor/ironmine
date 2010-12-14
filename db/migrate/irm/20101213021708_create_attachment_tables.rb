class CreateAttachmentTables < ActiveRecord::Migration
  def self.up
    create_table "irm_attachments", :force => true do |t|
        t.integer  "company_id", :null => false
        t.string   "description", :limit => 240
        t.string   "private_flag", :limit => 1
        t.integer  "latest_version_id"
        t.string  "file_name", :limit => 150
        t.integer "file_category"
        t.integer "file_size"
        t.string  "file_type", :limit => 30
        t.string  "status_code", :limit => 30
        t.integer  "created_by"
        t.integer  "updated_by"
        t.datetime "created_at"
        t.datetime "updated_at"
    end

    create_table "irm_attachment_versions" do |t|
        t.integer  "company_id", :null => false
        t.integer "attachment_id", :null=> false
        t.string  "description", :limit => 240
        t.string  "private_flag", :limit => 1
        t.integer "category_id"
        t.string  "source_type", :limit => 30
        t.integer "source_id"
        t.string  "data_file_name", :limit => 150
        t.string "data_content_type", :limit => 30
        t.integer "data_file_size"
        t.datetime "data_updated_at"
        t.integer  "created_by"
        t.integer  "updated_by"
        t.datetime "created_at"
        t.datetime "updated_at"      
    end
  end

  def self.down
    drop_table :irm_attachments
    drop_table :irm_attachment_versions
  end
end
