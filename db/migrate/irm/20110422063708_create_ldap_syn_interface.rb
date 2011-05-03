class CreateLdapSynInterface < ActiveRecord::Migration
 def self.up
   create_table :irm_ldap_syn_interface do |t|
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
   end
 end

   def self.down
     drop_table :irm_ldap_syn_interface
   end
 end

