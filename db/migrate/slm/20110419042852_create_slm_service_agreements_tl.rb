class CreateSlmServiceAgreementsTl < ActiveRecord::Migration
  def self.up
    create_table :slm_service_agreements_tl , :force => true do |t|
      t.integer  :company_id,              :null=> false
      t.integer :service_agreement_id
      t.string :name,:limit=>30
      t.string :description,:limit=>150,:null=>false
      t.string :language,:limit=>30,:null=>false
      t.string :source_lang,:limit=>30,:null=>false
      t.string :status_code,:limit=>30,:null=>false
      t.integer :created_by
      t.integer :updated_by
      t.date :created_at
      t.date :updated_at
    end

    execute('CREATE OR REPLACE VIEW slm_service_agreements_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM slm_service_agreements  t,slm_service_agreements_tl tl
                                             WHERE t.id = tl.service_agreement_id')

  end

  def self.down
    drop_table :slm_service_agreements_tl
    execute ("drop view slm_service_agreements_vl")
  end
end
