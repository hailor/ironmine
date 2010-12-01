class CreateModuleOrgPersonTables < ActiveRecord::Migration
  def self.up
    create_table "irm_identities", :force => true do |t|
      t.string   "login_name",         :limit => 30, :null => false
      t.string   "hashed_password",    :limit => 60, :null => false
      t.string   "full_name",          :limit => 30
      t.string   "email",              :limit => 60, :null => false
      t.integer  "auth_source_id"
      t.string   "type",               :limit => 60
      t.string   "status_code",        :limit => 30, :default=>"ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "irm_identities", ["login_name"], :name => "IRM_IDENTITIES_U1", :unique => true

    create_table "irm_people", :force => true do |t|
      t.integer "company_id",                    :null=>false
      t.integer "organization_id"
      t.integer "department_id"
      t.string  "title",                         :limit => 30
      t.string  "first_name",                    :limit => 30, :null => false
      t.string  "last_name",                     :limit => 30, :null => false
      t.string  "job_title",                     :limit => 30
      t.string  "vip_flag",                      :limit => 1,   :default=>"N"
      t.string  "support_staff_flag",            :limit => 1,   :default=>"N"
      t.string  "assignment_availability_flag",  :limit => 1,   :default=>"N"
      t.string  "email_address",                 :limit => 150
      t.string  "home_phone",                    :limit => 30
      t.string  "home_address",                  :limit => 30
      t.string  "mobile_phone",                  :limit => 30
      t.string  "fax_number",                    :limit => 30
      t.string  "bussiness_phone",               :limit => 30
      t.string  "region_code",                   :limit => 30
      t.string  "site_group_code",               :limit => 30
      t.string  "site_code",                     :limit => 30
      t.string  "function_group_code",           :limit => 30
      t.string  "avatar_path",                   :limit => 150
      t.string  "avatar_file_name",              :limit => 30
      t.string  "avatar_content_type",           :limit => 30
      t.integer "avatar_file_size"
      t.datetime "avatar_updated_at"
      t.integer "identity_id",                   :null => false
      t.string  "unrestricted_access_flag",      :limit => 30
      t.string  "notification_lang",             :limit => 30
      t.string  "notification_flag",             :limit => 30
      t.string  "capacity_rating",               :limit => 30
      t.integer "open_tickets"                
      t.string  "task_capacity_rating",          :limit => 30
      t.integer "open_tasks"
      t.string   "status_code",                  :limit => 30, :default=>"ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end


    add_index "irm_people", ["identity_id"],:name => "IRM_PEOPLE_N1"
    add_index "irm_people", ["company_id"], :name => "IRM_PEOPLE_N2"

    create_table "irm_companies", :force => true do |t|
      t.string "short_name",        :limit => 30,:null => false
      t.string "company_type",      :limit => 30,:null => false
      t.string "time_zone",         :limit => 30
      t.string "currency_code",     :limit => 30
      t.string "cost_center_code",  :limit => 30
      t.string "budget_code",       :limit => 30
      t.string "hotline",           :limit => 30
      t.string "home_page",         :limit => 60
      t.string   "type",               :limit => 60
      t.string   "status_code",     :limit => 30, :default=>"ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "irm_companies", ["short_name"],:name => "IRM_COMPANIES_U1", :unique => true

    create_table "irm_companies_tl", :force => true do |t|
      t.integer   "company_id",    :null=>false
      t.string    "name",          :limit=>30,:null=>false
      t.string    "description",   :limit=>150
      t.string    "language",      :limit=>30
      t.string    "source_lang",   :limit=>30
      t.string    "status_code",   :limit => 30, :default=>"ENABLED"
      t.integer   "created_by"
      t.integer   "updated_by"
      t.datetime  "created_at"
      t.datetime  "updated_at"
    end
    
    add_index "irm_companies_tl", ["company_id", "language"], :name => "IRM_COMPANIES_TL_U1", :unique => true

    create_table "irm_company_accesses", :force => true do |t|
      t.integer "person_id",              :null => false
      t.integer "accessable_company_id",  :null => false
      t.string   "status_code",           :limit => 30, :default=>"ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "irm_company_accesses", ["person_id","accessable_company_id"],:name => "IRM_COMPANY_ACCESSES_U1", :unique => true



    execute('CREATE OR REPLACE VIEW irm_companies_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_companies  t,irm_companies_tl tl
                                             WHERE t.id = tl.company_id') 

    create_table "irm_organizations", :force => true do |t|
      t.integer "company_id",       :null => false
      t.string  "short_name",       :limit => 30,:null => false
      t.string   "status_code",     :limit => 30, :default=>"ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
    
    add_index "irm_organizations", ["company_id", "short_name"], :name => "IRM_ORGANIZATIONS_U1", :unique => true

    create_table "irm_organizations_tl", :force => true do |t|
      t.integer   "company_id",       :null => false
      t.integer   "organization_id",  :null=>false
      t.string    "name",          :limit=>30,:null=>false
      t.string    "description",   :limit=>150
      t.string    "language",      :limit=>30
      t.string    "source_lang",   :limit=>30
      t.string    "status_code",   :limit => 30, :default=>"ENABLED"
      t.integer   "created_by"
      t.integer   "updated_by"
      t.datetime  "created_at"
      t.datetime  "updated_at"
    end

    add_index "irm_organizations_tl", ["organization_id", "language"], :name => "IRM_ORGANIZATIONS_TL_U1", :unique => true

    execute('CREATE OR REPLACE VIEW irm_organizations_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                                 FROM irm_organizations t,irm_organizations_tl tl
                                                 WHERE t.id = tl.organization_id')

    create_table "irm_departments", :force => true do |t|
      t.integer "company_id",       :null => false
      t.integer "organization_id",  :null => false
      t.string  "short_name",       :limit => 30,:null => false
      t.string   "status_code",     :limit => 30, :default=>"ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "irm_departments", ["organization_id","short_name"], :name => "IRM_DEPARTMENTS_U1",:unique=>true

    create_table "irm_departments_tl", :force => true do |t|
      t.integer   "company_id",       :null => false
      t.integer   "department_id",    :null=>false
      t.string    "name",          :limit=>30,:null=>false
      t.string    "description",   :limit=>150
      t.string    "language",      :limit=>30
      t.string    "source_lang",   :limit=>30
      t.string    "status_code",   :limit => 30, :default=>"ENABLED"
      t.integer   "created_by"
      t.integer   "updated_by"
      t.datetime  "created_at"
      t.datetime  "updated_at"
    end

    add_index "irm_departments_tl", ["department_id", "language"], :name => "IRM_DEPARTMENTS_TL_U1", :unique => true

    execute('CREATE OR REPLACE VIEW irm_departments_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                                 FROM irm_departments t,irm_departments_tl tl
                                                 WHERE t.id = tl.department_id')

    create_table "irm_regions", :force => true do |t|
      t.string  "region_code",      :limit => 30,:null => false
      t.string   "status_code",     :limit => 30, :default=>"ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "irm_regions", ["region_code"], :name => "IRM_REGIONS_U1",:unique=>true    

    create_table "irm_regions_tl", :force => true do |t|
      t.integer   "region_id",    :null=>false
      t.string    "name",          :limit=>30,:null=>false
      t.string    "description",   :limit=>150
      t.string    "language",      :limit=>30
      t.string    "source_lang",   :limit=>30
      t.string    "status_code",   :limit => 30, :default=>"ENABLED"
      t.integer   "created_by"
      t.integer   "updated_by"
      t.datetime  "created_at"
      t.datetime  "updated_at"
    end

    add_index "irm_regions_tl", ["region_id", "language"], :name => "IRM_REGIONS_TL_U1", :unique => true

    execute('CREATE OR REPLACE VIEW irm_regions_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                           FROM irm_regions t,irm_regions_tl tl
                                           WHERE t.id = tl.region_id')

    create_table "irm_site_groups", :force => true do |t|
      t.string  "region_code",      :limit => 30,:null => false
      t.string  "group_code",       :limit => 30,:null => false
      t.string   "status_code",     :limit => 30, :default=>"ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "irm_site_groups", ["region_code","group_code"], :name => "IRM_SITE_GROUPS_U1", :unique => true

    create_table "irm_site_groups_tl", :force => true do |t|
      t.integer   "site_group_id",    :null=>false
      t.string    "name",          :limit=>30,:null=>false
      t.string    "description",   :limit=>150
      t.string    "language",      :limit=>30
      t.string    "source_lang",   :limit=>30
      t.string    "status_code",   :limit => 30, :default=>"ENABLED"
      t.integer   "created_by"
      t.integer   "updated_by"
      t.datetime  "created_at"
      t.datetime  "updated_at"
    end

    add_index "irm_site_groups_tl", ["site_group_id", "language"], :name => "IRM_SITE_GROUPS_TL_U1", :unique => true

    execute('CREATE OR REPLACE VIEW irm_site_groups_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                           FROM irm_site_groups t,irm_site_groups_tl tl
                                           WHERE t.id = tl.site_group_id')


    create_table "irm_sites", :force => true do |t|
      t.string  "site_group_code",  :limit => 30,:null => false
      t.string  "site_code",        :limit => 30,:null => false
      t.string  "address_line",     :limit=>150
      t.string  "country",          :limit=>30
      t.string  "state_code" ,      :limit=>30
      t.string  "city",             :limit=>30
      t.string  "postal_code",      :limit=>30
      t.string  "timezone_code",    :limit=>30      
      t.string   "status_code",     :limit => 30, :default=>"ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "irm_sites", ["site_group_code","site_code"], :name => "IRM_SITES_U1",:unique=>true

    create_table "irm_sites_tl", :force => true do |t|
      t.integer   "site_id",    :null=>false
      t.string    "name",          :limit=>30,:null=>false
      t.string    "description",   :limit=>150
      t.string    "language",      :limit=>30
      t.string    "source_lang",   :limit=>30
      t.string    "status_code",   :limit => 30, :default=>"ENABLED"
      t.integer   "created_by"
      t.integer   "updated_by"
      t.datetime  "created_at"
      t.datetime  "updated_at"
    end

    add_index "irm_sites_tl", ["site_id", "language"], :name => "IRM_SITES_TL_U1", :unique => true

    execute('CREATE OR REPLACE VIEW irm_sites_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                           FROM irm_sites t,irm_sites_tl tl
                                           WHERE t.id = tl.site_id')

    create_table "irm_locations", :force => true do |t|
      t.integer  "company_id",      :null => false
      t.string   "site_code",       :limit => 30,:null => false
      t.string   "status_code",     :limit => 30, :default=>"ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "irm_locations", ["company_id","site_code"], :name => "IRM_LOCATIONS_U1",:unique=>true
  end

  def self.down
    drop_table :irm_companies
    drop_table :irm_companies_tl
    drop_table :irm_company_accesses
    execute('drop view irm_companies_vl')
    drop_table :irm_departments
    drop_table :irm_departments_tl
    execute('drop view irm_departments_vl')
    drop_table :irm_identities
    drop_table :irm_locations
    drop_table :irm_organizations
    drop_table :irm_organizations_tl
    execute('drop view irm_organizations_vl')
    drop_table :irm_people
    drop_table :irm_regions
    drop_table :irm_regions_tl
    execute('drop view irm_regions_vl')
    drop_table :irm_site_groups
    drop_table :irm_site_groups_tl
    execute('drop view irm_site_groups_vl')
    drop_table :irm_sites
    drop_table :irm_sites_tl
    execute('drop view irm_sites_vl')
  end
end
