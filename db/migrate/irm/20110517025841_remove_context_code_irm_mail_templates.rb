class RemoveContextCodeIrmMailTemplates < ActiveRecord::Migration
  def self.up
    remove_column :irm_mail_templates ,:context_code
    remove_column :irm_mail_templates,:from
    execute('CREATE OR REPLACE VIEW irm_mail_templates_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.subject,tl.mail_body,tl.parsed_template,tl.description,tl.language,tl.source_lang
                                             FROM irm_mail_templates  t,irm_mail_templates_tl tl
                                             WHERE t.id = tl.template_id')
  end

  def self.down
    add_column :irm_mail_templates ,:context_code,:string
    add_column :irm_mail_templates,:from,:string
    execute('CREATE OR REPLACE VIEW irm_mail_templates_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.subject,tl.mail_body,tl.parsed_template,tl.description,tl.language,tl.source_lang
                                             FROM irm_mail_templates  t,irm_mail_templates_tl tl
                                             WHERE t.id = tl.template_id')
  end
end
