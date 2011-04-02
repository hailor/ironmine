class AddControllerActonToReports < ActiveRecord::Migration
  def self.up
    change_column(:irm_reports,:permission_code,:string,:limit=>30,:null => true)
    add_column(:irm_reports,:page_action,:string,:limit=>30,:after=>:permission_code)
    add_column(:irm_reports,:page_controller,:string,:limit=>30,:after=>:permission_code)
  end

  def self.down
    remove_column(:irm_reports,:page_action)
    remove_column(:irm_reports,:page_controller)
  end
end
