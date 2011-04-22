class CreateSlmTable < ActiveRecord::Migration
  def self.up
    create_table "slm_service_categories", :force => true do |t|
      t.integer  "company_id",              :null=> false
      t.string   "category_code",:limit=>30
      t.string   "status_code",        :limit => 30, :default=>"ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "slm_service_categories", ["company_id","category_code"], :name => "SLM_SERVICE_CATEGORIES_N1"

    create_table :slm_service_categories_tl , :force => true do |t|
      t.integer  :company_id,              :null=> false
      t.integer :service_category_id
      t.string :name,:limit=>30
      t.string :description,:limit=>150,:null=>false
      t.string :language,:limit=>30,:null=>false
      t.string :source_lang,:limit=>30,:null=>false
      t.string :status_code,:limit=>30,:null=>false
      t.integer :created_by
      t.integer :updated_by
      t.date :created_at
      t.date :updated_at
    end

    add_index "slm_service_categories_tl", ["service_category_id","language"], :name => "SLM_SERVICE_CATEGORIES_TL_N1"

    execute('CREATE OR REPLACE VIEW slm_service_categories_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM slm_service_categories  t,slm_service_categories_tl tl
                                             WHERE t.id = tl.service_category_id')


    create_table :slm_service_catalogs, :force => true do |t|
      t.integer  "company_id",              :null=> false
      t.string   "catalog_code",:limit=>30
      t.string   "service_category_code",:limit=>30
      t.string   "priority_code",:limit=>30
      t.string   "external_system_code",:limit=>30
      t.date     "active_start_date"
      t.date     "active_end_date"
      t.integer  "service_owner_id"
      t.string   "slm_code" ,:limit=>30
      t.string   "statistics_api" ,:limit=>60
      t.string   "status_code",        :limit => 30, :default=>"ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "slm_service_catalogs", ["company_id","catalog_code"], :name => "SLM_SERVICE_CATALOGS_N1"

    create_table :slm_service_catalogs_tl , :force => true do |t|
      t.integer  :company_id,              :null=> false
      t.integer :service_catalog_id
      t.string :name,:limit=>30
      t.string :description,:limit=>150,:null=>false
      t.string :language,:limit=>30,:null=>false
      t.string :source_lang,:limit=>30,:null=>false
      t.string :status_code,:limit=>30,:null=>false
      t.integer :created_by
      t.integer :updated_by
      t.date :created_at
      t.date :updated_at
    end

    add_index "slm_service_catalogs_tl", ["service_catalog_id","language"], :name => "SLM_SERVICE_CATALOGS_TL_N1"

    execute('CREATE OR REPLACE VIEW slm_service_catalogs_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM slm_service_catalogs  t,slm_service_catalogs_tl tl
                                             WHERE t.id = tl.service_catalog_id')


    create_table :slm_service_members,:force=>true do |t|
      t.integer  :company_id,              :null=> false
      t.integer  :service_catalog_id
      t.integer  :service_company_id
      t.integer  :service_organization_id
      t.integer  :service_department_id
      t.integer  :service_person_id
      t.integer  :service_contract_id
      t.string   :description
      t.string   :status_code,:limit=>30,:null=>false
      t.integer  :created_by
      t.integer  :updated_by
      t.date     :created_at
      t.date     :updated_at
    end

    add_index "slm_service_members", ["service_catalog_id","service_company_id","service_organization_id",
               "service_department_id","service_person_id","service_contract_id"], :name => "SLM_SERVICE_MEMBERS_N1"


    create_table :slm_service_breaks,:force=>true do |t|
      t.integer  :company_id,              :null=> false
      t.integer :service_catalog_id
      t.integer :seq_number
      t.date    :start_date
      t.date    :end_date
      t.string  :description,:limit=>150
      t.string  :status_code,:limit=>30,:null=>false
      t.integer :created_by
      t.integer :updated_by
      t.date    :created_at
      t.date    :updated_at
    end

    add_index "slm_service_breaks", ["service_catalog_id","seq_number"], :name => "SLM_SERVICE_BREAKS_N1"


    create_table :slm_service_agreements,:force=>true do |t|
      t.integer  :company_id,              :null=> false
      t.string   :agreement_code,:limit=>30
      t.date     :active_start_date
      t.date     :active_end_date
      t.integer  :response_time
      t.integer  :resolve_time
      t.string   :business_object_code,:limit=>30
      t.string   :rule_filter_code,:limit=>30
      t.string   :response_escalation_enabled,:limit=>1
      t.string   :rs_first_escalation_mode ,:limit=>30
      t.integer  :rs_first_elapse_time
      t.string   :rs_first_assignee_type
      t.string   :rs_first_escalation_assignee
      t.string   :first_escalation_enabled	,:limit=>1
      t.string   :first_escalation_mode		,:limit=>30
      t.integer  :first_elapse_time
      t.string   :first_assignee_type		,:limit=>30
      t.string   :first_escalation_assignee	,:limit=>30
      t.string   :second_escalation_enabled	,:limit=>1
      t.string   :second_escalation_mode		,:limit=>30
      t.integer  :second_elapse_time
      t.string   :second_assignee_type		,:limit=>30
      t.string   :second_escalation_assignee	,:limit=>30
      t.string   :third_escalation_enabled	,:limit=>1
      t.string   :third_escalation_mode		,:limit=>30
      t.integer  :third_elapse_time
      t.string   :third_assignee_type		,:limit=>30
      t.string   :third_escalation_assignee	,:limit=>30
      t.string   :fourth_escalation_enabled	,:limit=>1
      t.string   :fourth_escalation_mode		,:limit=>30
      t.integer  :fourth_elapse_time
      t.string   :fourth_assignee_type		,:limit=>30
      t.string   :fourth_escalation_assignee	,:limit=>30
      t.string   :status_code,:limit=>30,:null=>false
      t.integer  :created_by
      t.integer  :updated_by
      t.date     :created_at
      t.date     :updated_at
    end

    add_index "slm_service_agreements", ["agreement_code"], :name => "SLM_SERVICE_AGREEMENTS_N1"


    

  end

  def self.down
    drop_table :slm_service_categories
    drop_table :slm_service_categories_tl
    execute("drop view slm_service_categories_vl")
    drop_table :slm_service_catalogs
    drop_table :slm_service_catalogs_tl
    execute("drop view slm_service_catalogs_vl")
    drop_table :slm_service_members
    drop_table :slm_service_breaks
    drop_table :slm_service_agreements
  end
end
