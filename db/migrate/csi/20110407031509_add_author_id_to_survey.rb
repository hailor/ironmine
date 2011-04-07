class AddAuthorIdToSurvey < ActiveRecord::Migration
  def self.up
    add_column :csi_surveys, :author_id, :integer, :after => :same_ip_allow_flag
  end

  def self.down
    remove_column :csi_surveys, :author_id
  end
end
