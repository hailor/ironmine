class CreatePersonRolesTable < ActiveRecord::Migration
  def self.up
    create_table :irm_person_roles, :force => true do |t|
      t.integer :company_id, :null => false
      t.integer :person, :null => false
      t.integer :role, :null => false
      t.string :status_code, :limit => 30, :null => false, :default => "ENABLED"
      t.integer  :created_by
      t.integer  :updated_by
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :irm_person_roles
  end
end
