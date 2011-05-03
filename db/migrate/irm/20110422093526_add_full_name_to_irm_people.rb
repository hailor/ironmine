class AddFullNameToIrmPeople < ActiveRecord::Migration
  def self.up
    add_column(:irm_people,:full_name,:string,:limit=>60,:after=>:last_name)
    add_column(:irm_people,:full_name_pinyin,:string,:limit=>60,:after=>:last_name)
  end

  def self.down
    remove_column(:irm_people,:full_name)
    remove_column(:irm_people,:full_name_pinyin)
  end
end
