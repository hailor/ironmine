# -*- coding: utf-8 -*-
class AddCmsHomePermissionMenu < ActiveRecord::Migration
  def self.up
    cms_home_index = Irm::Permission.new(:permission_code=>'CMS_HOME_INDEX',
                                             :page_controller=>'cms/home',
                                             :page_action=>'index',
                                             :not_auto_mult=>true)
    cms_home_index.permissions_tls.build(:language=>'zh',:name=>'CMS主页',:description=>'CMS主页',:source_lang=>'en')
    cms_home_index.permissions_tls.build(:language=>'en',:name=>'Home page',:description=>'Home page',:source_lang=>'en')
    cms_home_index.save

    home_page = Irm::MenuEntry.new(:menu_code=>'IRM_CM_HOME_PAGE_MENU',
                                         :permission_code=>'CMS_HOME_INDEX',
                                         :display_sequence=>10,
                                         :not_auto_mult=>true)
    home_page.menu_entries_tls.build(:language=>'zh',:name=>'主页',:description=>'主页',:source_lang=>'en')
    home_page.menu_entries_tls.build(:language=>'en',:name=>'Home Page',:description=>'Home Page',:source_lang=>'en')
    home_page.save    
  end

  def self.down
  end
end
