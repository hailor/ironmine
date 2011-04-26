class CreateWfFieldUpdate < ActiveRecord::Migration
  def self.up
    create_table "irm_wf_field_updates", :force => true do |t|
      t.integer  "company_id",              :null=> false
      t.string   "bo_code", :limit => 30
      t.string   "name" ,:limit=>60
      t.string   "field_update_code" ,:limit=>30
      t.string   "descrption",:limit=>150
      t.string   "update_attribute_name",:limit=>60
      t.string   "new_value_option",:limit=>30
      t.string   "new_value_formula",:limit=>30
      t.string   "status_code",        :limit => 30, :default=>"ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
    
    add_index "irm_wf_field_updates", ["bo_code","name","field_update_code"], :name => "IRM_WF_FIELD_UPDATEDS_N1"
  end

  def self.down
    drop_table :irm_wf_field_updates    
  end
end
