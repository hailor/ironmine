class ModifyCsiSurveysDescription < ActiveRecord::Migration
  def self.up
    change_column :csi_surveys,:description,:string,:limit=>150
  end

  def self.down
    change_column :csi_surveys,:description,:string,:limit=>15
  end
end
