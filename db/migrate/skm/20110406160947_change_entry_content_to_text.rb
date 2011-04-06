class ChangeEntryContentToText < ActiveRecord::Migration
  def self.up
    change_table :skm_entry_details do |t|
      t.change :entry_content, :text
    end
  end

  def self.down
    change_table :skm_entry_details do |t|
      t.change :entry_content, :string, :limit => 255
    end
  end
end
