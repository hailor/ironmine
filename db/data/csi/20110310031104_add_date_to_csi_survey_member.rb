class AddDateToCsiSurveyMember < ActiveRecord::Migration
  def self.up
    add_column :csi_survey_members,:end_date_active,:date,:after=>"response_flag"
  end

  def self.down
    remove_column :csi_survey_members,:end_date_active
  end
end
