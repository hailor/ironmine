class AddAdditionColumnToSystemPara < ActiveRecord::Migration
  def self.up
    add_column :irm_system_parameters, :position, :text, :after => :value
    add_column :irm_system_parameters, :validation_type, :string, :limit =>30, :after => :value
    add_column :irm_system_parameters, :validation_content, :text, :after => :value
    add_column :irm_system_parameters, :validation_format, :text, :after => :value
  end

  def self.down
  end
end
