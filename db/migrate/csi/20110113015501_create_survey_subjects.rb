class CreateSurveySubjects < ActiveRecord::Migration
  def self.up
    create_table "csi_survey_subjects", :force => true do |t|
      t.integer  "company_id",              :null=> false
      t.integer  "survey_id",              :null=> false
      t.string   "name",:limit=>60,:null=>false
      t.string   "prompt",             :limit => 60
      t.string   "required_flag",:limit=>1
      t.string   "input_type",:limit=>30
      t.string   "uuid",:limit=>60
      t.integer   "seq_num"
      t.string   "other_input",:limit=>150
      t.string   "status_code",        :limit => 30, :default=>"ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "csi_survey_subjects", ["company_id","survey_id"], :name => "CSI_SURVEY_SUBJECTS_N1"
  end

  def self.down
    drop_table :csi_survey_subjects
  end
end
