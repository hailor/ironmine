class CreateGlobalSettingTable < ActiveRecord::Migration
  def self.up
    create_table "irm_global_setting", :force =>true do |t|
           t.string   "theme_name", :limit=>30
           t.string   "timezone",:limit=>30
           t.integer   "upload_file_limit"
           t.string   "logo_file_name", :limit => 60
           t.string  "logo_content_type", :limit => 60
           t.integer "logo_file_size"
           t.datetime "logo_updated_at"
           t.string   "status_code", :limit => 30
           t.integer  "created_by"
           t.integer  "updated_by"
           t.datetime "created_at"
           t.datetime "updated_at"
    end

    global_setting = Irm::GlobalSetting.new(:theme_name=>'default', :timezone=>'GTM+8', :upload_file_limit=>'1000', :status_code => 'ENABLE')
    global_setting.save
  end

  def self.down
    drop_table :irm_global_setting
  end
end
