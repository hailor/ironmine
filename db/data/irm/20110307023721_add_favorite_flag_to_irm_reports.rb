class AddFavoriteFlagToIrmReports < ActiveRecord::Migration
  def self.up
    add_column :irm_reports,:favorite_flag,:string,:limit=>1,:after=>:report_purpose
  end

  def self.down
    remove_column :irm_reports,:favorite_flag
  end
end
