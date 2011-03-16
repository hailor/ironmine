class RemoveRangCodeInSurveyRanges < ActiveRecord::Migration
  def self.up
    remove_column :csi_survey_ranges,:range_code
  end

  def self.down
  end
end
