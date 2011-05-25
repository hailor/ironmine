class CreateWfApprovalProcesses < ActiveRecord::Migration
  def self.up
    create_table :irm_wf_approval_processes,:force=>true do |t|
      t.integer  "company_id",           :null => false
      t.string :bo_code,:limit=>30,:null=>false
      t.integer :process_order
      t.string :name, :limit => 60, :null => false
      t.string :process_code,:limit=>30,:null=>false
      t.string :description, :limit => 150
      t.string :evaluate_entry_mode,:limit=>30,:null=>false
      t.string :next_approver_mode,:limit=>30
      t.string :record_editability,:limit=>30,:null=>false
      t.integer :mail_template_id,:null=>false
      t.string :display_history_flag,:limit => 1, :null => false, :default => "Y"
      t.string :allow_submitter_recall,:limit => 1, :null => false, :default => "N"
      t.string   "status_code",:limit => 30, :null => false, :default => "OFFLINE"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table :irm_wf_approval_steps,:force=>true do |t|
      t.integer  "company_id",           :null => false
      t.integer   :process_id,:null=>false
      t.integer   :step_number,:null=>false
      t.string    :name, :limit => 60, :null => false
      t.string    :step_code,:limit=>30, :null => false
      t.string    :description, :limit => 150
      t.string    :step_evaluate_mode,:limit=>30
      t.string    :step_evaluate_result,:limit=>30
      t.string    :approver_mode,:limit=>30, :null => false
      t.string    :multiple_approver_mode,:limit=>30, :null => false
      t.string    :allow_delegation_approve,:limit=>1, :null => false, :default => "N"
      t.string    :reject_behavior,:limit => 30, :null => false
      t.string    "status_code",:limit => 30, :null => false, :default => "ENABLED"
      t.integer   "created_by"
      t.integer   "updated_by"
      t.datetime  "created_at"
      t.datetime  "updated_at"
    end

    create_table :irm_wf_approval_step_approvers,:force=>true do |t|
      t.integer   "company_id",:null => false
      t.integer   :step_id,:null=>false
      t.string    :approver_type,:limit=>30, :null => false
      t.integer   :approver_id, :null => false
      t.string    "status_code",:limit => 30, :null => false, :default => "ENABLED"
      t.integer   "created_by"
      t.integer   "updated_by"
      t.datetime  "created_at"
      t.datetime  "updated_at"
    end

    create_table :irm_wf_approval_actions,:force=>true do |t|
      t.integer   "company_id",:null => false
      t.integer   :process_id,:limit=>30,:null=>false
      t.integer   :action_mode,:limit=>30,:null=>false
      t.integer   :step_id
      t.string    :action_type,:limit=>60, :null => false
      t.integer   :action_id, :null => false
      t.string    "status_code",:limit => 30, :null => false, :default => "ENABLED"
      t.integer   "created_by"
      t.integer   "updated_by"
      t.datetime  "created_at"
      t.datetime  "updated_at"
    end

  end

  def self.down
    drop_table :irm_wf_approval_processes
    drop_table :irm_wf_approval_steps
    drop_table :irm_wf_approval_step_approvers
    drop_table :irm_wf_approval_actions
  end
end
