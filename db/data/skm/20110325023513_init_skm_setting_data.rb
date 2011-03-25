class InitSkmSettingData < ActiveRecord::Migration
  def self.up
    setting = Skm::Setting.new(:sidebar_file_menu_flag => Irm::Constant::SYS_YES)
    setting.save
  end

  def self.down
  end
end
