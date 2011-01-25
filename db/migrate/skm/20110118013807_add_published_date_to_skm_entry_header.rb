class AddPublishedDateToSkmEntryHeader < ActiveRecord::Migration
  def self.up
    add_column :skm_entry_headers, "published_date", :datetime, :after => :version_number
  end

  def self.down
    remove_column :skm_entry_headers, "published_date"
  end
end