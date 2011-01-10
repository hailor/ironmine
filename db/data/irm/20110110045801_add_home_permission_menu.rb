class AddHomePermissionMenu < ActiveRecord::Migration
  def self.up
    irm_home_index = Irm::Permission.new(:permission_code=>'IRM_HOME_INDEX',
                                             :page_controller=>'irm/home',
                                             :page_action=>'index',
                                             :not_auto_mult=>true)
    irm_home_index.permissions_tls.build(:language=>'zh',:name=>'服务运营中心主页',:description=>'服务运营中心主页',:source_lang=>'en')
    irm_home_index.permissions_tls.build(:language=>'en',:name=>'Home page',:description=>'Home page',:source_lang=>'en')
    irm_home_index.save

    home_page = Irm::MenuEntry.new(:menu_code=>'IRM_SOC_HOME_PAGE_MENU',
                                         :permission_code=>'IRM_HOME_INDEX',
                                         :display_sequence=>10,
                                         :not_auto_mult=>true)
    home_page.menu_entries_tls.build(:language=>'zh',:name=>'主页',:description=>'主页',:source_lang=>'en')
    home_page.menu_entries_tls.build(:language=>'en',:name=>'Home Page',:description=>'Home Page',:source_lang=>'en')
    home_page.save
  end

  def self.down
  end
end
