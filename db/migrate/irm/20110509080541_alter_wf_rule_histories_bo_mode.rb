class AlterWfRuleHistoriesBoMode < ActiveRecord::Migration
  def self.up
    rename_column :irm_wf_rule_histories,"bo_model","bo_code"
  end

  def self.down
    rename_column :irm_wf_rule_histories,"bo_code","bo_model"
  end
end
