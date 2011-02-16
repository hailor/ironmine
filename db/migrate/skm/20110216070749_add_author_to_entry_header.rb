class AddAuthorToEntryHeader < ActiveRecord::Migration
  def self.up
    add_column :skm_entry_headers, :author_id, :integer, :after => :published_date
  end

  def self.down
    remove_column :skm_entry_headers, :author_id
  end
end
