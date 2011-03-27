class AddSidebarFlagToSkmSetting < ActiveRecord::Migration
  def self.up
    add_column :skm_settings, :sidebar_flag, :string, :null => false, :limit => 1, :default => Irm::Constant::SYS_YES, :after => :company_id
  end

  def self.down
    remove_column :skm_settings, :sidebar_flag
  end
end
