class CreateViewIrmLanguagesVl < ActiveRecord::Migration
  def self.up
    execute('CREATE OR REPLACE VIEW irm_languages_vl AS SELECT t.*,tl.id lang_id,tl.description,tl.language,tl.source_lang
                                             FROM irm_languages  t,irm_languages_tl tl
                                             WHERE t.id = tl.language_id') 
  end

  def self.down
     execute('drop view irm_languages_vl')
  end
end
