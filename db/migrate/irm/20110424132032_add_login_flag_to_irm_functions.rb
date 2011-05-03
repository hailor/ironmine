class AddLoginFlagToIrmFunctions < ActiveRecord::Migration
  def self.up
    add_column(:irm_functions,:login_flag,:string,:limit=>1,:default=>"N",:after=>:public_flag)
  end

  def self.down
    remove_column(:irm_functions,:login_flag)
  end
end
