class CreateIrmLanguages < ActiveRecord::Migration
  def self.up
    create_table "irm_languages", :force =>true do |t|
           t.string   "language_code", :limit=>30,:null=>false
           t.string   "installed_flag",:limit=>1,:null=>false
           t.string   "source_code",:limit=>30,:null=>false
           t.integer  "created_by"
           t.integer  "updated_by"
           t.datetime "created_at"
           t.datetime "updated_at"
    end
    
    add_index "irm_languages", ["language_code"], :unique=>true,:name => "IRM_LANGUAGES_U1"

    create_table "irm_languages_tl",  :force =>true do |t|
           t.string   "language_id", :limit=>30,:null=>false
           t.string   "description", :limit=>150,:null=>false
           t.string   "language"  , :limit=>30,:null=>false
           t.string   "source_lang" , :limit=>30,:null=>false
           t.string   "source_code",:limit=>30,:null=>false
           t.integer  "created_by"
           t.integer  "updated_by"
           t.datetime "created_at"
           t.datetime "updated_at"
    end

    add_index "irm_languages_tl", ["language_id","language"], :unique=>true,:name => "IRM_LANGUAGES_TL_N1"
  end

  def self.down
    drop_table :irm_languages
    drop_table :irm_languages_tl
  end
end
