class ModifyIrmPeople < ActiveRecord::Migration
  def self.up
    change_column :irm_people,:identity_id,:integer,:null=>true
  end

  def self.down
    change_column :irm_people,:identity_id,:null=>false
  end
end
