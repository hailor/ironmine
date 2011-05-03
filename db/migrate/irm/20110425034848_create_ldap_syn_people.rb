class CreateLdapSynPeople < ActiveRecord::Migration
  def self.up
    create_table :irm_ldap_syn_people do |t|
      t.string   :ldap_name,                    :limit => 100
      t.string   :ldap_dn,                      :limit => 150
      t.integer  :auth_source_id
      t.string   :filter,                       :limit => 200
      t.string   :description,                  :limit => 150
      t.integer  :company_id
      t.integer  :organization_id
      t.integer  :department_id
      t.string   :vip_flag,                     :limit => 1,   :default => "N"
      t.string   :unrestricted_access_flag,     :limit => 30
      t.string   :assignment_availability_flag, :limit => 1,   :default => "N"
      t.string   :region_code,                  :limit => 30
      t.string   :site_group_code,              :limit => 30
      t.string   :site_code,                    :limit => 30
      t.string   :function_group_code,          :limit => 30
      t.string   :notification_lang,            :limit => 30
      t.string   :notification_flag,            :limit => 30
      t.integer  :created_by
      t.integer  :updated_by
      t.date     :created_at
      t.date     :updated_at
    end
  end

  def self.down
    drop_table :irm_ldap_syn_people
  end
end
