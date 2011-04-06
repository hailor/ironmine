class AddSourceToSkmEntryHeader < ActiveRecord::Migration
  def self.up
    add_column :skm_entry_headers, :source_id, :integer, :after => :author_id
    add_column :skm_entry_headers, :source_type, :string, :limit => 30, :after => :author_id
  end

  def self.down
    remove_column :skm_entry_headers, :source_id
    remove_column :skm_entry_headers, :source_type
  end
end
