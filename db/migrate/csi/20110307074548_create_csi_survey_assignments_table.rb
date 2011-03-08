class CreateCsiSurveyAssignmentsTable < ActiveRecord::Migration
  def self.up
    #关于survey的调查范围规则
    create_table "csi_survey_ranges", :force => true do |t|
      t.integer  "company_id"
      t.string   "range_code",:limit=>30
      t.string   "required_flag",:limit=>1
      t.string   "range_type",:limit=>30
      t.integer  "range_company_id"
      t.integer  "range_organization_id"
      t.integer  "range_department_id"
      t.integer  "role_id"
      t.integer  "site_id"
      t.string   "status_code",        :limit => 30, :default=>"ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "csi_survey_ranges", ["company_id","range_type","range_company_id"], :name => "CSI_SURVEY_RANGES_N1"
    add_index "csi_survey_ranges", ["company_id","range_type","role_id"], :name => "CSI_SURVEY_RANGES_N2"
    add_index "csi_survey_ranges", ["company_id","range_type","site_id"], :name => "CSI_SURVEY_RANGES_N3"

    #建立当survey和person_id之间关联关系，从而方便在个人首页
    #进行显示
    create_table "csi_survey_members",:force=>true do |t|
      t.integer  "company_id"
      t.integer  "survey_id"
      t.integer  "person_id"
      t.string   "required_flag",      :limit => 1
      t.string   "response_flag",      :limit => 1      
      t.string   "status_code",        :limit => 30, :default=>"ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "csi_survey_members", ["company_id","survey_id"], :name => "CSI_SURVEY_MEMBERS_N1"
    add_index "csi_survey_members", ["company_id","person_id"], :name => "CSI_SURVEY_MEMBERS_N2"
    add_index "csi_survey_members", ["company_id","survey_id","person_id"], :name => "CSI_SURVEY_MEMBERS_N3"
    add_index "csi_survey_members", ["company_id","person_id","respond_flag"], :name => "CSI_SURVEY_MEMBERS_N4"

  end
  
  def self.down
    drop_table :csi_survey_ranges
    drop_table :csi_assignment_members
  end
end
