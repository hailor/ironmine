class AddPersonToCsiSurveyResults < ActiveRecord::Migration
  def self.up
    add_column :csi_survey_results,:person_id,:integer,:after=>:company_id
    add_column :csi_survey_results,:response_batch,:string,:after=>:person_id
    add_column :csi_survey_results,:response_time,:string,:after=>:response_batch
    add_column :csi_survey_results,:ip_address,:string,:limit=>60,:after=>:person_id
    add_index "csi_survey_results", ["response_batch","subject_id"], :name => "CSI_SURVEY_RESULTS_N2"
  end

  def self.down
    remove_column :csi_survey_results,:person_id
    remove_column :csi_survey_results,:response_batch
    remove_column :csi_survey_results,:response_time
    remove_column :csi_survey_results,:ip_address
    remove_index "csi_survey_results",:name=>"CSI_SURVEY_RESULTS_N2"
  end
end
