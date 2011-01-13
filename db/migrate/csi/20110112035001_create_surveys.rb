class CreateSurveys < ActiveRecord::Migration
  def self.up
    create_table "csi_surveys", :force => true do |t|
      t.integer  "company_id",              :null=> false
      t.string   "title",:limit=>60,:null=>false
      t.string   "description",             :limit => 15
      t.string   "email_notify",:limit=>1
      t.string   "notify_url",:limit=>150
      t.string   "notify_type",:limit=>30
      t.string   "thanks_message",:limit=>1000
      t.string   "publish_response",:limit=>1
      t.string   "comment_flag",:limit=>1
      t.string   "password",:limit=>30
      t.date   "closed_datetime"
      t.string   "same_ip_allow_flag",:limit=>1
      t.string   "status_code",        :limit => 30, :default=>"ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "csi_surveys", ["company_id","title"], :name => "CSI_SURVEYS_N1"
  end

  def self.down
    drop_table :csi_surveys
  end
end
