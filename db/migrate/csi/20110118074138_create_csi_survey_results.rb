class CreateCsiSurveyResults < ActiveRecord::Migration
  def self.up
    create_table "csi_survey_results", :force => true do |t|
      t.integer  "company_id",              :null=> false
      t.integer  "subject_id"
      t.string   "option_type",:limit=>30
      t.string   "subject_result", :limit=>1000
      t.string   "status_code",        :limit => 30, :default=>"ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "csi_survey_results", ["company_id","subject_id"], :name => "CSI_SURVEY_RESULTS_N1"
  end

  def self.down
    drop_table :csi_survey_results
  end
end
