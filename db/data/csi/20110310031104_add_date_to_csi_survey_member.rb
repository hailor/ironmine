class AddDateToCsiSurveyMember < ActiveRecord::Migration
  def self.up
    add_column :csi_survey_members,:end_date_active,:date,:after=>"response_flag"
    add_column :csi_survey_members,:survey_range_id,:integer,:after=>"company_id"
  end

  def self.down
    remove_column :csi_survey_members,:end_date_active
    remove_column :csi_survey_members,:survey_range_id
  end
end
