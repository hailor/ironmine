class InitBaseSettingMenu < ActiveRecord::Migration
  def self.up
    organization_company = Irm::MenuEntry.new(:menu_code=>'IRM_ORGANIZATION_MENU',
                                         :permission_code=>'IRM_COMPANIES_INDEX',
                                         :display_sequence=>10,
                                         :not_auto_mult=>true)
    organization_company.menu_entries_tls.build(:language=>'zh',:name=>'公司',:description=>'公司',:source_lang=>'en')
    organization_company.menu_entries_tls.build(:language=>'en',:name=>'Companies',:description=>'Companies',:source_lang=>'en')
    organization_company.save

    organization_organization = Irm::MenuEntry.new(:menu_code=>'IRM_ORGANIZATION_MENU',
                                         :permission_code=>'IRM_ORGANIZATIONS_INDEX',
                                         :display_sequence=>20,
                                         :not_auto_mult=>true)
    organization_organization.menu_entries_tls.build(:language=>'zh',:name=>'组织',:description=>'公司',:source_lang=>'en')
    organization_organization.menu_entries_tls.build(:language=>'en',:name=>'Organizations',:description=>'Organizations',:source_lang=>'en')
    organization_organization.save

    organization_department = Irm::MenuEntry.new(:menu_code=>'IRM_ORGANIZATION_MENU',
                                         :permission_code=>'IRM_DEPARTMENTS_INDEX',
                                         :display_sequence=>30,
                                         :not_auto_mult=>true)
    organization_department.menu_entries_tls.build(:language=>'zh',:name=>'部门',:description=>'部门',:source_lang=>'en')
    organization_department.menu_entries_tls.build(:language=>'en',:name=>'Departments',:description=>'Departments',:source_lang=>'en')
    organization_department.save

    organization_region = Irm::MenuEntry.new(:menu_code=>'IRM_ORGANIZATION_MENU',
                                         :permission_code=>'IRM_REGIONS_INDEX',
                                         :display_sequence=>40,
                                         :not_auto_mult=>true)
    organization_region.menu_entries_tls.build(:language=>'zh',:name=>'区域',:description=>'区域',:source_lang=>'en')
    organization_region.menu_entries_tls.build(:language=>'en',:name=>'Regions',:description=>'Regions',:source_lang=>'en')
    organization_region.save


    permission_ideitnty = Irm::MenuEntry.new(:menu_code=>'IRM_PERMISSION_MENU',
                                         :permission_code=>'IRM_IDENTITIES_INDEX',
                                         :display_sequence=>10,
                                         :not_auto_mult=>true)
    permission_ideitnty.menu_entries_tls.build(:language=>'zh',:name=>'帐号',:description=>'帐号',:source_lang=>'en')
    permission_ideitnty.menu_entries_tls.build(:language=>'en',:name=>'Identity',:description=>'Identity',:source_lang=>'en')
    permission_ideitnty.save

    permission_permission = Irm::MenuEntry.new(:menu_code=>'IRM_PERMISSION_MENU',
                                         :permission_code=>'IRM_PERMISSIONS_INDEX',
                                         :display_sequence=>30,
                                         :not_auto_mult=>true)
    permission_permission.menu_entries_tls.build(:language=>'zh',:name=>'权限',:description=>'权限',:source_lang=>'en')
    permission_permission.menu_entries_tls.build(:language=>'en',:name=>'Permission',:description=>'Permission',:source_lang=>'en')
    permission_permission.save

    permission_function = Irm::MenuEntry.new(:menu_code=>'IRM_PERMISSION_MENU',
                                         :permission_code=>'IRM_FUNCTIONS_INDEX',
                                         :display_sequence=>40,
                                         :not_auto_mult=>true)
    permission_function.menu_entries_tls.build(:language=>'zh',:name=>'功能',:description=>'功能',:source_lang=>'en')
    permission_function.menu_entries_tls.build(:language=>'en',:name=>'Functions',:description=>'Functions',:source_lang=>'en')
    permission_function.save

    permission_function_group = Irm::MenuEntry.new(:menu_code=>'IRM_PERMISSION_MENU',
                                         :permission_code=>'IRM_FUNCTION_GROUPS_INDEX',
                                         :display_sequence=>50,
                                         :not_auto_mult=>true)
    permission_function_group.menu_entries_tls.build(:language=>'zh',:name=>'功能组',:description=>'功能组',:source_lang=>'en')
    permission_function_group.menu_entries_tls.build(:language=>'en',:name=>'Function groups',:description=>'Function groups',:source_lang=>'en')
    permission_function_group.save

    public_value_set = Irm::MenuEntry.new(:menu_code=>'IRM_PUBLIC_MENU',
                                         :permission_code=>'IRM_VALUE_SETS_INDEX',
                                         :display_sequence=>10,
                                         :not_auto_mult=>true)
    public_value_set.menu_entries_tls.build(:language=>'zh',:name=>'值集',:description=>'值集',:source_lang=>'en')
    public_value_set.menu_entries_tls.build(:language=>'en',:name=>'Value sets',:description=>'Value sets',:source_lang=>'en')
    public_value_set.save

    public_lookup_type = Irm::MenuEntry.new(:menu_code=>'IRM_PUBLIC_MENU',
                                         :permission_code=>'IRM_LOOKUP_TYPES_INDEX',
                                         :display_sequence=>20,
                                         :not_auto_mult=>true)
    public_lookup_type.menu_entries_tls.build(:language=>'zh',:name=>'快速编码',:description=>'快速编码',:source_lang=>'en')
    public_lookup_type.menu_entries_tls.build(:language=>'en',:name=>'Lookup types',:description=>'Lookup types',:source_lang=>'en')
    public_lookup_type.save

  end

  def self.down
  end
end
