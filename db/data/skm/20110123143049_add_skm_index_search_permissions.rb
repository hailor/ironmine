# -*- coding: utf-8 -*-
class AddSkmIndexSearchPermissions < ActiveRecord::Migration
  def self.up
    skm_header_index_search = Irm::Permission.new(:permission_code=>'SKM_ENTRY_HEADERS_IND_SEAR',
                                             :page_controller=>'skm/entry_headers',
                                             :page_action=>'index_search',
                                             :not_auto_mult=>true)
    skm_header_index_search.permissions_tls.build(:language=>'zh',:name=>'搜索文章',:description=>'搜索文章',:source_lang=>'en')
    skm_header_index_search.permissions_tls.build(:language=>'en',:name=>'Search',:description=>'Search',:source_lang=>'en')
    skm_header_index_search.save    
  end

  def self.down
  end
end
