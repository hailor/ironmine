class AddIcmGroupAssignmentsTables < ActiveRecord::Migration
  def self.up
    create_table "icm_group_assignments", :force => true do |t|
      t.integer :company_id
      t.integer :organization_id
      t.string :support_group_code, :limit => 30
      t.string :event_type, :limit => 30
      t.integer :customer_company_id
      t.integer :customer_organization_id
      t.integer :customer_department_id
      t.string :customer_site_group_code, :limit => 30
      t.string :customer_site_code, :limit => 30
      t.integer :customer_person_id
      t.string :status_code, :limit => 30, :null => false
      t.integer :created_by
      t.integer :updated_by
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
  end
end
