class AddAuthSourcePermissions < ActiveRecord::Migration
  def self.up
    irm_auth_sources_index = Irm::Permission.new(:permission_code=>'IRM_AUTH_SOURCES_INDEX',
                                             :page_controller=>'irm/auth_sources',
                                             :page_action=>'index',
                                             :not_auto_mult=>true)
    irm_auth_sources_index.permissions_tls.build(:language=>'zh',:name=>'认证源',:description=>'认证源',:source_lang=>'en')
    irm_auth_sources_index.permissions_tls.build(:language=>'en',:name=>'Auth Sources',:description=>'Auth Sources',:source_lang=>'en')
    irm_auth_sources_index.save

    irm_auth_sources_edit = Irm::Permission.new(:permission_code=>'IRM_AUTH_SOURCES_EDIT',
                                             :page_controller=>'irm/auth_sources',
                                             :page_action=>'edit',
                                             :not_auto_mult=>true)
    irm_auth_sources_edit.permissions_tls.build(:language=>'zh',:name=>'编辑认证源',:description=>'编辑认证源',:source_lang=>'en')
    irm_auth_sources_edit.permissions_tls.build(:language=>'en',:name=>'Edit Auth Source',:description=>'Edit Auth Source',:source_lang=>'en')
    irm_auth_sources_edit.save

    irm_auth_sources_new = Irm::Permission.new(:permission_code=>'IRM_AUTH_SOURCES_NEW',
                                             :page_controller=>'irm/auth_sources',
                                             :page_action=>'new',
                                             :not_auto_mult=>true)
    irm_auth_sources_new.permissions_tls.build(:language=>'zh',:name=>'创建认证源',:description=>'创建认证源',:source_lang=>'en')
    irm_auth_sources_new.permissions_tls.build(:language=>'en',:name=>'Create Auth Source',:description=>'Create Auth Source',:source_lang=>'en')
    irm_auth_sources_new.save    
  end

  def self.down
  end
end
