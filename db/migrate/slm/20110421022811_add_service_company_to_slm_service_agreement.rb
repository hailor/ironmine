class AddServiceCompanyToSlmServiceAgreement < ActiveRecord::Migration
  def self.up
    add_column :slm_service_agreements,:service_company_id,:integer
  end

  def self.down
    remove_column :slm_service_agreements,:service_company_id
  end
end
