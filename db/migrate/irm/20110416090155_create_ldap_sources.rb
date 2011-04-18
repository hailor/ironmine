class CreateLdapSources < ActiveRecord::Migration
  #add_column(:irm_people,:last_assigned_date,:datetime,:after=>:open_tasks,:null=>true)
  def self.up
    #ldap源表
    create_table :irm_ldap_sources do |t|
      t.string :type	   ,:limit=>30
      t.string :name	   ,:limit=>150 ,:null=>false
      t.string :host	   ,:limit=>150 ,:null=>false
      t.integer :port                 ,:null=>false
      t.string :account	 ,:limit=>60  ,:null=>false
      t.string :account_password,:limit=>	60 ,:null=>false
      t.string :base_dn	,:limit=>255
      t.integer :company_id,:null=>false
      t.string :description,:limit=>150
      t.string :status_code,:limit=>30,:null=>false
      t.integer :created_by
      t.integer :updated_by
      t.date :created_at
      t.date :updated_at
    end

    #ldap验证头表
    create_table :irm_ldap_auth_headers do |t|
      t.integer :ldap_source_id ,:null=>false
      t.string  :auth_code ,:limit=>60,:null=>false
      t.string  :auth_cn ,:limit=>255,:null=>false
      t.integer :company_id,:null=>false
      t.string :description,:limit=>150
      t.string :status_code,:limit=>30,:null=>false
      t.integer :created_by
      t.integer :updated_by
      t.date :created_at
      t.date :updated_at
    end

    #ldap验证头属性表
    create_table :irm_ldap_auth_attributes do |t|
      t.integer	:ldap_auth_header_id	,:null=>false
	    t.string  :local_attr,:limit=>60,:null=>false
	    t.string  :attr_type,:limit=>20
	    t.string  :ldap_attr,:limit=>60,:null=>false
      t.integer :company_id,:null=>false
      t.string :description,:limit=>150
      t.string :status_code,:limit=>30,:null=>false
      t.integer :created_by
      t.integer :updated_by
      t.date :created_at
      t.date :updated_at
    end

    #ldap同步头表
    create_table :irm_ldap_syn_headers do |t|
      t.integer :ldap_source_id,:null=>false
      t.string :syn_type,:limit=>30,:null=>false
      t.string :syn_cn	,:limit=>255,:null=>false
      t.integer :ldap_auth_header_id
      t.string :multi_language_flag,:limit=>1,:null=>false
      t.integer :company_id,:null=>false
      t.string :description,:limit=>150
      t.string :status_code,:limit=>30,:null=>false
      t.integer :created_by
      t.integer :updated_by
      t.date :created_at
      t.date :updated_at
    end

    #ldap同步表属性
    create_table :irm_ldap_syn_attributes do |t|
      t.integer :ldap_syn_header_id,:null=>false
      t.string :local_attr	,:limit=>60,:null=>false
      t.string :attr_type	,:limit=>30,:null=>false
      t.string :ldap_attr	,:limit=>60,:null=>false
      t.string :null_able	,:limit=>1,:null=>false
      t.integer :company_id,:null=>false
      t.string :description,:limit=>150
      t.string :status_code,:limit=>30,:null=>false
      t.integer :created_by
      t.integer :updated_by
      t.date :created_at
      t.date :updated_at
    end

  end

  def self.down
    drop_table :irm_ldap_sources
    drop_table :irm_ldap_auth_headers
    drop_table :irm_ldap_auth_attributes
    drop_table :irm_ldap_syn_headers
    drop_table :irm_ldap_syn_attributes
  end
end
