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
      t.string  :name ,:limit=>60,:null=>false
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
      t.string :name    ,:limit=>60
      t.string :base_dn    	,:limit=>150
      t.string :comp_filter	,:limit=>150
      t.string :comp_object	,:limit=>30,:null=>false
      t.string :comp_syn_flag,:limit=>1,:default=>'Y'
      t.integer :comp_level   ,:default=>1
      t.string :comp_desc	  ,:limit=>150
      t.string :org_filter	,:limit=>150
      t.string :org_object	,:limit=>30,:null=>false
      t.string :org_syn_flag,:limit=>1,:default=>'Y'
      t.integer :org_level ,:default=>2
      t.string :org_desc	  ,:limit=>150
      t.string :dept_filter	,:limit=>150
      t.string :dept_object	,:limit=>30,:null=>false
      t.string :dept_syn_flag,:limit=>1,:default=>'Y'
      t.integer :dept_level,:default=>3
      t.string  :dept_desc	  ,:limit=>150
      t.string  :peo_syn_flag,:limit=>1,:default=>'N'
      t.integer :peo_level,:default=>4
      t.integer :syn_people_id
      t.integer :company_id,:null=>false
      t.string  :status_code,:limit=>30
      t.integer :created_by
      t.integer :updated_by
      t.date    :created_at
      t.date    :updated_at
    end

    #ldap同步表属性
    create_table :irm_ldap_syn_attributes do |t|
      t.integer :ldap_syn_header_id,:null=>false
      t.string :local_attr	,:limit=>60,:null=>false
      t.string :local_attr_type	,:limit=>30
      t.string :ldap_attr	,:limit=>60,:null=>false
      t.string :ldap_attr_type	,:limit=>30
      t.string :object_type , :limit=>60
      t.string :null_able	,:limit=>10
      t.string :language_code	,:limit=>10
      t.integer :company_id,:null=>false
      t.string :description,:limit=>150
      t.string :status_code,:limit=>30
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
