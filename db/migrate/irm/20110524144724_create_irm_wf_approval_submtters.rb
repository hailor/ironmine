class CreateIrmWfApprovalSubmtters < ActiveRecord::Migration
  def self.up
    create_table :irm_wf_approval_submitters do |t|
      t.integer "company_id",       :null => false
      t.integer "process_id",       :null => false
      t.string  "submitter_type",   :null => false,:limit=>30
      t.string  "submitter_id",     :null => false ,:limit=>30
      t.string   "status_code",     :limit => 30, :default=>"ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end

  def self.down
    drop_table :irm_wf_approval_submitters
  end
end
