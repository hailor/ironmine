class AddSupportGroupMember < ActiveRecord::Migration
  def self.up
    create_table "irm_support_group_members", :force => true do |t|
        t.integer  "person_id"
        t.integer  "support_group_code"
        t.string   "status_code",       :limit => 30,  :null => false
        t.integer  "created_by"
        t.integer  "updated_by"
        t.datetime "created_at"
        t.datetime "updated_at"
      end

      add_index "irm_support_group_members", ["person_id","support_group_code"], :name => "IRM_SUPPORT_GROUP_MEMBERS_N1"
  end

  def self.down
    drop_table :irm_support_group_members
  end
end
