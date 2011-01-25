class AddImageFlagToAttachment < ActiveRecord::Migration
  def self.up
    add_column :irm_attachment_versions,:image_flag,:string,:limit=>1,:after=>:private_flag,:default=>"Y"
  end

  def self.down
    remove_column :irm_attachment_versions,:image_flag
  end
end
