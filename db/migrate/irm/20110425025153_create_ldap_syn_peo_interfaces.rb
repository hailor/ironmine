class CreateLdapSynPeoInterfaces < ActiveRecord::Migration
  def self.up
    create_table :irm_ldap_syn_peo_interfaces do |t|
      t.integer  :process_id
      t.integer  :company_id
      t.integer  :organization_id
      t.integer  :department_id
      t.string   :title,                        :limit => 30
      t.string   :first_name,                   :limit => 30
      t.string   :last_name,                    :limit => 30
      t.string   :job_title,                    :limit => 30
      t.string   :vip_flag,                     :limit => 1,   :default => "N"
      t.string   :support_staff_flag,           :limit => 1,   :default => "N"
      t.string   :assignment_availability_flag, :limit => 1,   :default => "N"
      t.string   :email_address,                :limit => 150
      t.string   :home_phone,                   :limit => 30
      t.string   :home_address,                 :limit => 30
      t.string   :mobile_phone,                 :limit => 30
      t.string   :fax_number,                   :limit => 30
      t.string   :bussiness_phone,              :limit => 30
      t.string   :region_code,                  :limit => 30
      t.string   :site_group_code,              :limit => 30
      t.string   :site_code,                    :limit => 30
      t.string   :function_group_code,          :limit => 30
      t.string   :avatar_path,                  :limit => 150
      t.string   :avatar_file_name,             :limit => 30
      t.string   :avatar_content_type,          :limit => 30
      t.integer  :avatar_file_size
      t.datetime :avatar_updated_at
      t.integer  :identity_id
      t.string   :approve_request_mail,         :limit => 30
      t.string   :manager,                      :limit => 30
      t.string   :delegate_approver,            :limit => 30
      t.string   :last_login_at,                :limit => 30
      t.string   :type,                         :limit => 30
      t.string   :language_code,                :limit => 30
      t.string   :auth_source_id,               :limit => 30
      t.string   :hashed_password,              :limit => 60
      t.string   :login_name,                   :limit => 30
      t.string   :unrestricted_access_flag,     :limit => 30
      t.string   :notification_lang,            :limit => 30
      t.string   :notification_flag,            :limit => 30
      t.string   :capacity_rating,              :limit => 30
      t.integer  :open_tickets
      t.string   :task_capacity_rating,         :limit => 30
      t.integer  :open_tasks
      t.datetime :last_assigned_date
      t.string   :dept_dn,                      :limit => 200
      t.string   :ldap_dn,                      :limit => 200
      t.string   :status_code,                  :limit => 30,  :default => "ENABLED"
      t.integer  :created_by
      t.integer  :updated_by
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :irm_ldap_syn_peo_interface
  end
end
