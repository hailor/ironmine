class CreateEntryOperateHistories < ActiveRecord::Migration
  def self.up
    create_table :skm_entry_operate_histories do |t|
      t.integer  "id", :null => false
      t.string   "operate_code",:null => false
      t.integer  "incident_id"
      t.integer  "entry_id"
      t.integer  "version_number"
      t.integer  "company_id"
      t.string   "search_key", :limit=>50
      t.integer  "result_count"
      t.integer  "var_num1"
      t.integer  "var_num2"
      t.integer  "var_num3"
      t.string   "var_str1", :limit=>50
      t.string   "var_str2", :limit=>50
      t.string   "var_str3", :limit=>50
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end

  def self.down
    drop_table :entry_operate_histories
  end
end
