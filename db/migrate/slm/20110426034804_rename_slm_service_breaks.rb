class RenameSlmServiceBreaks < ActiveRecord::Migration
  def self.up
     rename_column :slm_service_breaks,:start_date,:start_time
     rename_column :slm_service_breaks,:end_date,:end_time
    change_column   :slm_service_breaks,:start_time,:string,:limit=>30
    change_column   :slm_service_breaks,:end_time,:string,:limit=>30
  end

  def self.down
    rename_column :slm_service_breaks,:start_time,:start_date
     rename_column :slm_service_breaks,:end_time,:end_date
  end
end
