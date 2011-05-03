class Recreateldaptable < ActiveRecord::Migration
  def self.up

    drop_table "irm_ldap_auth_headers"
    drop_table "irm_ldap_auth_attributes"
    drop_table "irm_ldap_syn_headers"
    drop_table "irm_ldap_syn_attributes"
    drop_table "irm_ldap_syn_interface"
    drop_table "irm_ldap_syn_peo_interface"
    drop_table "irm_ldap_syn_people"


    create_table "irm_ldap_auth_headers", :force => true do |t|
      t.integer "ldap_source_id",                :null => false
      t.string  "name",           :limit => 60,  :null => false
      t.string  "auth_cn",                       :null => false
      t.integer "company_id",                    :null => false
      t.string  "description",    :limit => 150
      t.string  "status_code",    :limit => 30,  :null => false
      t.integer "created_by"
      t.integer "updated_by"
      t.date    "created_at"
      t.date    "updated_at"
    end

    create_table "irm_ldap_auth_attributes", :force => true do |t|
      t.integer "ldap_auth_header_id",                :null => false
      t.string  "local_attr",          :limit => 60,  :null => false
      t.string  "attr_type",           :limit => 60
      t.string  "ldap_attr",           :limit => 60,  :null => false
      t.integer "company_id",                         :null => false
      t.string  "description",         :limit => 150
      t.string  "status_code",         :limit => 30,  :null => false
      t.integer "created_by"
      t.integer "updated_by"
      t.date    "created_at"
      t.date    "updated_at"
    end


    create_table "irm_ldap_syn_headers", :force => true do |t|
      t.string  "name",           :limit => 60,                   :null => false
      t.integer "ldap_source_id",                                 :null => false
      t.string  "base_dn",        :limit => 150
      t.string  "comp_filter",    :limit => 150
      t.string  "comp_object",    :limit => 30,                   :null => false
      t.integer "comp_level",                    :default => 1
      t.string  "comp_desc",      :limit => 150
      t.string  "comp_syn_flag",  :limit => 1,   :default => "Y"
      t.string  "org_filter",     :limit => 150
      t.string  "org_object",     :limit => 30,                   :null => false
      t.string  "org_syn_flag",   :limit => 1,   :default => "Y"
      t.integer "org_level",                     :default => 2
      t.string  "org_desc",       :limit => 150
      t.string  "dept_filter",    :limit => 150
      t.string  "dept_object",    :limit => 30,                   :null => false
      t.string  "dept_syn_flag",  :limit => 1,   :default => "Y"
      t.integer "dept_level",                    :default => 3
      t.string  "dept_desc",      :limit => 150
      t.string  "peo_syn_flag",   :limit => 1,   :default => "N"
      t.integer "peo_level",                     :default => 4
      t.integer "syn_people_id"
      t.integer "company_id",                                     :null => false
      t.string  "status_code",    :limit => 30
      t.integer "created_by"
      t.integer "updated_by"
      t.date    "created_at"
      t.date    "updated_at"
      t.string  "language",       :limit => 30
      t.string  "source_lang",    :limit => 30
      t.string  "syn_status",     :limit => 20
    end


    create_table "irm_ldap_syn_attributes", :force => true do |t|
      t.integer "ldap_syn_header_id",                :null => false
      t.string  "local_attr",         :limit => 60,  :null => false
      t.string  "local_attr_type",    :limit => 30
      t.string  "ldap_attr",          :limit => 60,  :null => false
      t.string  "ldap_attr_type",     :limit => 30
      t.string  "object_type",        :limit => 30,  :null => false
      t.string  "null_able",          :limit => 10,  :null => false
      t.string  "language_code",      :limit => 10
      t.integer "company_id",                        :null => false
      t.string  "description",        :limit => 150
      t.string  "status_code",        :limit => 30,  :null => false
      t.integer "created_by"
      t.integer "updated_by"
      t.date    "created_at"
      t.date    "updated_at"
    end

    create_table "irm_ldap_syn_interface", :force => true do |t|
      t.integer  "process_id"
      t.string   "comp_short_name",       :limit => 30
      t.string   "comp_company_type",     :limit => 30
      t.string   "comp_time_zone",        :limit => 30
      t.string   "comp_currency_code",    :limit => 30
      t.string   "comp_cost_center_code", :limit => 30
      t.string   "comp_budget_code",      :limit => 30
      t.string   "comp_hotline",          :limit => 30
      t.string   "comp_home_page",        :limit => 60
      t.integer  "comp_support_manager"
      t.string   "comp_type",             :limit => 60
      t.string   "comp_name",             :limit => 150
      t.string   "comp_description",      :limit => 240
      t.string   "comp_status_code",      :limit => 30
      t.string   "comp_dn",               :limit => 150
      t.string   "org_short_name",        :limit => 30
      t.string   "org_status_code",       :limit => 30
      t.string   "org_name",              :limit => 150
      t.string   "org_description",       :limit => 240
      t.string   "org_dn",                :limit => 150
      t.string   "dept_short_name",       :limit => 30
      t.string   "dept_status_code",      :limit => 30
      t.string   "dept_name",             :limit => 150
      t.string   "dept_description",      :limit => 240
      t.string   "dept_dn",               :limit => 150
      t.string   "language",              :limit => 30
      t.string   "source_lang",           :limit => 30
      t.string   "process_status",        :limit => 30
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "company_id"
      t.integer  "organization_id"
      t.integer  "department_id"
    end


    create_table "irm_ldap_syn_peo_interface", :force => true do |t|
      t.integer  "process_id"
      t.integer  "company_id"
      t.integer  "organization_id"
      t.integer  "department_id"
      t.string   "title",                        :limit => 30
      t.string   "first_name",                   :limit => 30
      t.string   "last_name",                    :limit => 30
      t.string   "job_title",                    :limit => 30
      t.string   "vip_flag",                     :limit => 1,   :default => "N"
      t.string   "support_staff_flag",           :limit => 1,   :default => "N"
      t.string   "assignment_availability_flag", :limit => 1,   :default => "N"
      t.string   "email_address",                :limit => 150
      t.string   "home_phone",                   :limit => 30
      t.string   "home_address",                 :limit => 30
      t.string   "mobile_phone",                 :limit => 30
      t.string   "fax_number",                   :limit => 30
      t.string   "bussiness_phone",              :limit => 30
      t.string   "region_code",                  :limit => 30
      t.string   "site_group_code",              :limit => 30
      t.string   "site_code",                    :limit => 30
      t.string   "function_group_code",          :limit => 30
      t.string   "avatar_path",                  :limit => 150
      t.string   "avatar_file_name",             :limit => 30
      t.string   "avatar_content_type",          :limit => 30
      t.integer  "avatar_file_size"
      t.datetime "avatar_updated_at"
      t.integer  "identity_id"
      t.string   "approve_request_mail",         :limit => 30
      t.string   "manager",                      :limit => 30
      t.string   "delegate_approver",            :limit => 30
      t.string   "last_login_at",                :limit => 30
      t.string   "type",                         :limit => 30
      t.string   "language_code",                :limit => 30
      t.string   "auth_source_id",               :limit => 30
      t.string   "hashed_password",              :limit => 60
      t.string   "login_name",                   :limit => 30
      t.string   "unrestricted_access_flag",     :limit => 30
      t.string   "notification_lang",            :limit => 30
      t.string   "notification_flag",            :limit => 30
      t.string   "capacity_rating",              :limit => 30
      t.integer  "open_tickets"
      t.string   "task_capacity_rating",         :limit => 30
      t.integer  "open_tasks"
      t.datetime "last_assigned_date"
      t.string   "ldap_dn",                      :limit => 200
      t.string   "status_code",                  :limit => 30,  :default => "ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "irm_ldap_syn_people", :force => true do |t|
      t.string  "ldap_name",                    :limit => 100
      t.string  "ldap_dn",                      :limit => 150
      t.integer "auth_source_id"
      t.string  "filter",                       :limit => 200
      t.string  "description",                  :limit => 155
      t.integer "company_id"
      t.integer "organization_id"
      t.integer "department_id"
      t.string  "vip_flag",                     :limit => 1,   :default => "N"
      t.string  "unrestricted_access_flag",     :limit => 30
      t.string  "assignment_availability_flag", :limit => 1,   :default => "N"
      t.string  "region_code",                  :limit => 30
      t.string  "site_group_code",              :limit => 30
      t.string  "site_code",                    :limit => 30
      t.string  "function_group_code",          :limit => 30
      t.string  "notification_lang",            :limit => 30
      t.string  "notification_flag",            :limit => 30
      t.integer "created_by"
      t.integer "updated_by"
      t.date    "created_at"
      t.date    "updated_at"
    end
  end

  def self.down
  end
end
