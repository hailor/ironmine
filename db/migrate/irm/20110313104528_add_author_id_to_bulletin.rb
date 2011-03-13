class AddAuthorIdToBulletin < ActiveRecord::Migration
  def self.up
    add_column :irm_bulletins, :author_id, :integer, :after => :content
  end


  def self.down
    remove_column :irm_bulletins, :author_id
  end
end
