class ModifyIrmLanguages < ActiveRecord::Migration
  def self.up
    rename_column :irm_languages,:source_code,:status_code
    rename_column :irm_languages_tl,:source_code,:status_code
  end

  def self.down
    rename_column :irm_languages_tl,:status_code,:source_code
    rename_column :irm_languages,:status_code,:source_code
  end
end
