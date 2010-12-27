# -*- coding: utf-8 -*-
class InitPersonMenu < ActiveRecord::Migration
  def self.up
    organization_site = Irm::MenuEntry.new(:menu_code=>'IRM_ORGANIZATION_MENU',
                                         :permission_code=>'IRM_SITE_GROUP_INDEX',
                                         :display_sequence=>50,
                                         :not_auto_mult=>true)
    organization_site.menu_entries_tls.build(:language=>'zh',:name=>'地点',:description=>'地点',:source_lang=>'en')
    organization_site.menu_entries_tls.build(:language=>'en',:name=>'SiteGroups',:description=>'SiteGroups',:source_lang=>'en')
    organization_site.save


    organization_support = Irm::MenuEntry.new(:menu_code=>'IRM_ORGANIZATION_MENU',
                                         :permission_code=>'IRM_SUPPORT_GROUP_INDEX',
                                         :display_sequence=>60,
                                         :not_auto_mult=>true)
    organization_support.menu_entries_tls.build(:language=>'zh',:name=>'支持组',:description=>'支持组',:source_lang=>'en')
    organization_support.menu_entries_tls.build(:language=>'en',:name=>'SupportGroups',:description=>'SupportGroups',:source_lang=>'en')
    organization_support.save

    permission_person = Irm::MenuEntry.new(:menu_code=>'IRM_PERMISSION_MENU',
                                         :permission_code=>'IRM_PEOPLE_INDEX',
                                         :display_sequence=>20,
                                         :not_auto_mult=>true)
    permission_person.menu_entries_tls.build(:language=>'zh',:name=>'人员',:description=>'人员',:source_lang=>'en')
    permission_person.menu_entries_tls.build(:language=>'en',:name=>'People',:description=>'People',:source_lang=>'en')
    permission_person.save
  end

  def self.down
  end
end
