class AddOsBroswer < ActiveRecord::Migration
  def self.up
    add_column :irm_login_records, :operate_system, :string, :limit => 30, :after => :user_agent
    add_column :irm_login_records, :browser, :string, :limit => 30, :after => :user_agent
  end

  def self.down
    remove_column :irm_login_records, :operate_system
    remove_column :irm_login_records, :browser, :string
  end
end
