class AddImgToSystemParameters < ActiveRecord::Migration
  def self.up
    add_column :irm_system_parameters, :img_file_name, :string, :limit => 60, :after => :position
    add_column :irm_system_parameters, :img_content_type, :string, :limit => 60, :after => :position
    add_column :irm_system_parameters, :img_file_size, :integer, :after => :position
    add_column :irm_system_parameters, :img_updated_at, :datetime, :after => :position
  end

  def self.down
    remove_column :irm_system_parameters, :img_file_name
    remove_column :irm_system_parameters, :img_content_type
    remove_column :irm_system_parameters, :img_file_size
    remove_column :irm_system_parameters, :img_updated_at
  end
end
