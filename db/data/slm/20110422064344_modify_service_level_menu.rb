class ModifyServiceLevelMenu < ActiveRecord::Migration
  def self.up
     agreement_menu = Irm::MenuEntry.query_by_menu_code("SLM_ADMIN_SETTING_MENU").
                                     query_by_sub_menu_code("SLM_ADMIN_AGREEMENT_MENU").first
     agreement_menu_tls = Irm::MenuEntriesTl.query_by_menu_entry_id(agreement_menu.id)
     agreement_menu.destroy
     agreement_menu_tls.each do |t|
       t.destroy
     end

     update_agreement_menu = Irm::MenuEntry.query_by_menu_code("SLM_ADMIN_AGREEMENT_MENU").
                                     query_by_page_controller("slm/service_agreements").first
     update_agreement_menu.update_attribute(:menu_code,"SLM_ADMIN_CATALOG_MENU")
  end

  def self.down
  end
end
