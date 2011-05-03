class CreateWfRules < ActiveRecord::Migration
  def self.up
    create_table "irm_wf_rules", :force => true do |t|
      t.integer  "company_id",           :null => false
      t.string   "bo_code",              :limit => 30, :null => false
      t.string   "rule_code",            :limit => 30, :null => false
      t.string   "name",                 :limit => 60, :null => false
      t.string   "description",          :limit => 150
      t.string   "evaluate_criteria_rule",:limit => 30, :null => false
      t.string   "evaluate_rule_mode"   ,:limit => 30, :null => false
      t.string   "status_code",          :limit => 30, :null => false, :default => "OFFLINE"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "irm_wf_rules", ["bo_code"], :name => "IRM_WF_RULE_N1"
    add_index "irm_wf_rules", ["rule_code"], :name => "IRM_WF_RULE_N2"

    create_table "irm_wf_rule_time_triggers", :force => true do |t|
      t.integer  "company_id",           :null => false
      t.integer  "rule_id",              :null => false
      t.string   "name",                 :limit => 60
      t.string   "description",          :limit => 150
      t.string   "trigger_mode",         :limit => 30, :null => false
      t.string   "time_unit",            :limit => 60, :null => false
      t.integer  "time_lead",            :limit => 150
      t.string   "trigger_data_object",  :limit => 30, :null => false
      t.string   "status_code",          :limit => 30, :null => false, :default => "ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "irm_wf_rule_time_triggers", ["rule_id"], :name => "IRM_WF_RULE_TIME_TRIGGERS_N1"

    create_table "irm_wf_rule_actions", :force => true do |t|
      t.integer  "company_id",           :null => false
      t.integer  "rule_id",              :null => false
      t.string   "action_mode",          :limit => 30
      t.string   "action_type",          :limit => 60 , :null => false
      t.integer   "action_reference_id", :null => false
      t.integer   "time_trigger_id"
      t.string   "status_code",          :limit => 30, :null => false, :default => "ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "irm_wf_rule_actions", ["rule_id"], :name => "IRM_WF_RULE_ACTIONS_N1"

    create_table "irm_wf_rule_histories", :force => true do |t|
      t.integer  "company_id",           :null => false
      t.integer  "event_id"
      t.integer  "rule_id",              :null => false
      t.string   "bo_model",             :limit => 30
      t.integer  "bo_id",                :limit => 60 , :null => false
      t.string   "status_code",          :limit => 30, :null => false, :default => "ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "irm_wf_rule_histories", ["event_id","rule_id"], :name => "IRM_WF_RULE_HISTORIES_N1"
  end

  def self.down
    drop_table :irm_wf_rules
    drop_table :irm_wf_rule_time_triggers
    drop_table :irm_wf_rule_actions
    drop_table :irm_wf_rule_histories
  end
end
