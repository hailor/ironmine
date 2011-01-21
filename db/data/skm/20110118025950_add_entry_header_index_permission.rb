class AddEntryHeaderIndexPermission < ActiveRecord::Migration
  def self.up
    skm_header_index = Irm::Permission.new(:permission_code=>'SKM_ENTRY_HEADERS_INDEX',
                                             :page_controller=>'skm/entry_headers',
                                             :page_action=>'index',
                                             :not_auto_mult=>true)
    skm_header_index.permissions_tls.build(:language=>'zh',:name=>'知识库文章首页',:description=>'知识库文章首页',:source_lang=>'en')
    skm_header_index.permissions_tls.build(:language=>'en',:name=>'SKM Entries Index',:description=>'SKM Entries Index',:source_lang=>'en')
    skm_header_index.save    
  end

  def self.down
  end
end
