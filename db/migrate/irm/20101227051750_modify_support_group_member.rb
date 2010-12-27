class ModifySupportGroupMember < ActiveRecord::Migration
  def self.up
    change_column :irm_support_group_members,:support_group_code,:string,:limit=>30
  end

  def self.down
    change_column :irm_support_group_members,:support_group_code,:integer
  end
end
