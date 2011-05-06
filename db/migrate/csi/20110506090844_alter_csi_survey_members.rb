class AlterCsiSurveyMembers < ActiveRecord::Migration
  def self.up
    remove_column :csi_survey_members,:survey_range_id
    add_column :csi_survey_members,:source_id,:integer,:after=>:person_id
    add_column :csi_survey_members,:source_type,:string,:after=>:person_id
  end

  def self.down
    add_column :csi_survey_members,:survey_range_id,:integer
    remove_column :csi_survey_members,:source_id
    remove_column :csi_survey_members,:source_type
  end
end
