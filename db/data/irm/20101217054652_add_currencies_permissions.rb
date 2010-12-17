class AddCurrenciesPermissions < ActiveRecord::Migration
  def self.up
    irm_currencies_index = Irm::Permission.new(:permission_code=>'IRM_CURRENCIES_INDEX',
                                                   :page_controller=>'irm/currencies',
                                                   :page_action=>'index',
                                                   :not_auto_mult=>true)
    irm_currencies_index.permissions_tls.build(:language=>'zh',:name=>'设置币种',:description=>'设置币种',:source_lang=>'en')
    irm_currencies_index.permissions_tls.build(:language=>'en',:name=>'Currency',:description=>'Currency',:source_lang=>'en')
    irm_currencies_index.save

    irm_currencies_new = Irm::Permission.new(:permission_code=>'IRM_CURRENCIES_NEW',
                                                   :page_controller=>'irm/currencies',
                                                   :page_action=>'new',
                                                   :not_auto_mult=>true)
    irm_currencies_new.permissions_tls.build(:language=>'zh',:name=>'新建币种',:description=>'新建币种',:source_lang=>'en')
    irm_currencies_new.permissions_tls.build(:language=>'en',:name=>'New Currency',:description=>'New Currency',:source_lang=>'en')
    irm_currencies_new.save

    irm_currencies_edit = Irm::Permission.new(:permission_code=>'IRM_CURRENCIES_EDIT',
                                                   :page_controller=>'irm/currencies',
                                                   :page_action=>'edit',
                                                   :not_auto_mult=>true)
    irm_currencies_edit.permissions_tls.build(:language=>'zh',:name=>'编辑币种',:description=>'编辑币种',:source_lang=>'en')
    irm_currencies_edit.permissions_tls.build(:language=>'en',:name=>'Edit Currency',:description=>'Edit Currency',:source_lang=>'en')
    irm_currencies_edit.save

    irm_currencies_create = Irm::Permission.new(:permission_code=>'IRM_CURRENCIES_CREATE',
                                                   :page_controller=>'irm/currencies',
                                                   :page_action=>'create',
                                                   :not_auto_mult=>true)
    irm_currencies_create.permissions_tls.build(:language=>'zh',:name=>'保存币种',:description=>'保存币种',:source_lang=>'en')
    irm_currencies_create.permissions_tls.build(:language=>'en',:name=>'Create Currency',:description=>'Create Currency',:source_lang=>'en')
    irm_currencies_create.save

    irm_currencies_update = Irm::Permission.new(:permission_code=>'IRM_CURRENCIES_UPDATE',
                                                   :page_controller=>'irm/currencies',
                                                   :page_action=>'update',
                                                   :not_auto_mult=>true)
    irm_currencies_update.permissions_tls.build(:language=>'zh',:name=>'更新币种',:description=>'更新币种',:source_lang=>'en')
    irm_currencies_update.permissions_tls.build(:language=>'en',:name=>'Update Currency',:description=>'Update Currency',:source_lang=>'en')
    irm_currencies_update.save

    irm_currencies_lang_edit = Irm::Permission.new(:permission_code=>'IRM_CURRENCIES_LANG_EDIT',
                                                   :page_controller=>'irm/currencies',
                                                   :page_action=>'multilingual_edit',
                                                   :not_auto_mult=>true)
    irm_currencies_lang_edit.permissions_tls.build(:language=>'zh',:name=>'编辑币种多语言',:description=>'编辑币种多语言',:source_lang=>'en')
    irm_currencies_lang_edit.permissions_tls.build(:language=>'en',:name=>'Edit Currency Multilingual',:description=>'Edit Currency Multilingual',:source_lang=>'en')
    irm_currencies_lang_edit.save


    irm_currencies_lang_update = Irm::Permission.new(:permission_code=>'IRM_CURRENCIES_LANG_UPDATE',
                                                   :page_controller=>'irm/currencies',
                                                   :page_action=>'multilingual_update',
                                                   :not_auto_mult=>true)
    irm_currencies_lang_update.permissions_tls.build(:language=>'zh',:name=>'更新币种多语言',:description=>'更新币种多语言',:source_lang=>'en')
    irm_currencies_lang_update.permissions_tls.build(:language=>'en',:name=>'Update Currency Multilingual',:description=>'Update Currency Multilingual',:source_lang=>'en')
    irm_currencies_lang_update.save

    irm_currencies_get_data = Irm::Permission.new(:permission_code=>'IRM_CURRENCIES_GET_DATA',
                                                   :page_controller=>'irm/currencies',
                                                   :page_action=>'get_data',
                                                   :not_auto_mult=>true)
    irm_currencies_get_data.permissions_tls.build(:language=>'zh',:name=>'获取币种',:description=>'获取币种',:source_lang=>'en')
    irm_currencies_get_data.permissions_tls.build(:language=>'en',:name=>'Get Currency',:description=>'Get Currency',:source_lang=>'en')
    irm_currencies_get_data.save
  end

  def self.down
    #
    lookup_types_permissions=Irm::Permission.query_by_page_controller("irm/currencies")
    lookup_types_permissions.each do |permission|
       language_permissions=Irm::PermissionsTl.query_by_permission_id(permission.id)
       language_permissions.each do |language_permission|
          language_permission.delete
       end
       permission.delete
    end
  end
end
