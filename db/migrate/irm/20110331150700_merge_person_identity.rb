class MergePersonIdentity < ActiveRecord::Migration
  def self.up
    add_column(:irm_people,:login_name,:string,:limit => 30,:after=>:identity_id)
    add_column(:irm_people,:hashed_password,:string,:limit => 30,:after=>:identity_id)
    add_column(:irm_people,:auth_source_id,:string,:limit => 30,:after=>:identity_id)
    add_column(:irm_people,:language_code,:string,:limit => 30,:after=>:identity_id)
    add_column(:irm_people,:type,:string,:limit => 30,:after=>:identity_id)
    add_column(:irm_people,:last_login_at,:string,:limit => 30,:after=>:identity_id)
    add_column(:irm_people,:delegate_approver,:string,:limit => 30,:after=>:identity_id)
    add_column(:irm_people,:manager,:string,:limit => 30,:after=>:identity_id)
    add_column(:irm_people,:approve_request_mail,:string,:limit => 30,:after=>:identity_id)
    change_column(:irm_people,:last_name,:string,:limit=>30,:null => true)
    change_column(:irm_people,:hashed_password,:string,:limit=>60)
  end

  def self.down
    remove_column(:login_name,:irm_people)
    remove_column(:irm_people,:hashed_password)
    remove_column(:irm_people,:auth_source_id)
    remove_column(:irm_people,:language_code)
    remove_column(:irm_people,:type)
    remove_column(:irm_people,:language_code)
    remove_column(:irm_people,:last_login_at)
    remove_column(:irm_people,:delegate_approver)
    remove_column(:irm_people,:manager)
    remove_column(:irm_people,:approve_request_mail)
  end
end
