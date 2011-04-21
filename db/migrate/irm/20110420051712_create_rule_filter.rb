class CreateRuleFilter < ActiveRecord::Migration
  def self.up
    create_table "irm_rule_filters", :force => true do |t|
      t.integer  "company_id",           :null => false
      t.string   "bo_code",              :limit => 30, :null => false
      t.string   "filter_type",          :limit => 30, :null => false
      t.string   "filter_name",          :limit => 150
      t.string   "filter_code",          :limit => 30
      t.integer  "source_id"
      t.string   "source_type",          :limit => 60
      t.string   "source_code",          :limit => 30
      t.integer  "own_id"
      t.string   "default_flag",         :limit => 1,  :default => "N"
      t.string   "restrict_visibility",  :limit => 1,  :default => "N"
      t.string   "raw_condition_clause", :limit =>150
      t.string   "condition_clause",     :limit =>1000
      t.string   "status_code",          :limit => 30, :null => false
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "irm_rule_filters", ["filter_code","source_code"], :name => "IRM_RULE_FILTERS_N1"
    add_index "irm_rule_filters", ["source_id","source_type"], :name => "IRM_RULE_FILTERS_N2"

    create_table "irm_rule_filter_criterions", :force => true do |t|
      t.integer  "company_id",           :null => false
      t.string   "rule_filter_id",       :limit => 30, :null => false
      t.string   "attribute_name",       :limit => 30, :null => false
      t.integer  "seq_num",              :null => false
      t.string   "operator_code",        :limit => 30
      t.string   "filter_value",         :limit => 150
      t.string   "status_code",          :limit => 30, :null => false
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "irm_rule_filter_criterions", ["rule_filter_id"], :name => "IRM_RULE_FILTER_CRITERIONS_N1"

  end

  def self.down
    drop_table(:irm_rule_filters)
    drop_table(:irm_rule_filter_criterions)
  end
end
