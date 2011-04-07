class AddResultOnlyAuthorToSurvey < ActiveRecord::Migration
  def self.up
    add_column :csi_surveys, :result_only_author, :string, :limit => 1, :default => "N", :after => :same_ip_allow_flag
  end

  def self.down
    remove_column :csi_surveys, :result_only_author
  end
end
