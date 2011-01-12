class AddIdFlexMenuAndPermissions < ActiveRecord::Migration
  def self.up
    irm_idflex_index = Irm::Permission.new(:permission_code=>'IRM_ID_FLEXES_INDEX',
                                             :page_controller=>'irm/id_flexes',
                                             :page_action=>'index',
                                             :not_auto_mult=>true)
    irm_idflex_index.permissions_tls.build(:language=>'zh',:name=>'弹性域首页',:description=>'',:source_lang=>'en')
    irm_idflex_index.permissions_tls.build(:language=>'en',:name=>'Flex Index',:description=>'',:source_lang=>'en')
    irm_idflex_index.save

    irm_idflex_edit = Irm::Permission.new(:permission_code=>'IRM_ID_FLEXES_EDIT',
                                             :page_controller=>'irm/id_flexes',
                                             :page_action=>'edit',
                                             :not_auto_mult=>true)
    irm_idflex_edit.permissions_tls.build(:language=>'zh',:name=>'编辑弹性域',:description=>'',:source_lang=>'en')
    irm_idflex_edit.permissions_tls.build(:language=>'en',:name=>'Edit Flex',:description=>'',:source_lang=>'en')
    irm_idflex_edit.save

    irm_idflex_new = Irm::Permission.new(:permission_code=>'IRM_ID_FLEXES_NEW',
                                             :page_controller=>'irm/id_flexes',
                                             :page_action=>'new',
                                             :not_auto_mult=>true)
    irm_idflex_new.permissions_tls.build(:language=>'zh',:name=>'创建弹性域',:description=>'', :source_lang=>'en')
    irm_idflex_new.permissions_tls.build(:language=>'en',:name=>'Create Flex',:description=>'', :source_lang=>'en')
    irm_idflex_new.save

    irm_idflex_show = Irm::Permission.new(:permission_code=>'IRM_ID_FLEXES_SHOW',
                                             :page_controller=>'irm/id_flexes',
                                             :page_action=>'show',
                                             :not_auto_mult=>true)
    irm_idflex_show.permissions_tls.build(:language=>'zh',:name=>'查看弹性域',:description=>'', :source_lang=>'en')
    irm_idflex_show.permissions_tls.build(:language=>'en',:name=>'Show Flex',:description=>'', :source_lang=>'en')
    irm_idflex_show.save    
    
    idflex_index_page = Irm::MenuEntry.new(:menu_code=>'IRM_COMMON_SETTING_MENU',
                                         :permission_code=>'IRM_ID_FLEXES_INDEX',
                                         :display_sequence=>80,
                                         :not_auto_mult=>true)
    idflex_index_page.menu_entries_tls.build(:language=>'zh',:name=>'设置弹性域',:description=>'',:source_lang=>'en')
    idflex_index_page.menu_entries_tls.build(:language=>'en',:name=>'Set Flexes',:description=>'',:source_lang=>'en')
    idflex_index_page.save
#################################################################################################################################################
    irm_idflexstr_index = Irm::Permission.new(:permission_code=>'IRM_ID_FLEX_STRUCTS_INDEX',
                                             :page_controller=>'irm/id_flex_structures',
                                             :page_action=>'index',
                                             :not_auto_mult=>true)
    irm_idflexstr_index.permissions_tls.build(:language=>'zh',:name=>'弹性域结构首页',:description=>'',:source_lang=>'en')
    irm_idflexstr_index.permissions_tls.build(:language=>'en',:name=>'Flex Structure Index',:description=>'',:source_lang=>'en')
    irm_idflexstr_index.save

    irm_idflexstr_edit = Irm::Permission.new(:permission_code=>'IRM_ID_FLEX_STRUCTS_EDIT',
                                             :page_controller=>'irm/id_flex_structures',
                                             :page_action=>'edit',
                                             :not_auto_mult=>true)
    irm_idflexstr_edit.permissions_tls.build(:language=>'zh',:name=>'编辑弹性域结构',:description=>'',:source_lang=>'en')
    irm_idflexstr_edit.permissions_tls.build(:language=>'en',:name=>'Edit Flex Structure',:description=>'',:source_lang=>'en')
    irm_idflexstr_edit.save

    irm_idflexstr_new = Irm::Permission.new(:permission_code=>'IRM_ID_FLEX_STRUCTS_NEW',
                                             :page_controller=>'irm/id_flex_structures',
                                             :page_action=>'new',
                                             :not_auto_mult=>true)
    irm_idflexstr_new.permissions_tls.build(:language=>'zh',:name=>'创建弹性域结构',:description=>'', :source_lang=>'en')
    irm_idflexstr_new.permissions_tls.build(:language=>'en',:name=>'Create Flex Structure',:description=>'', :source_lang=>'en')
    irm_idflexstr_new.save

    irm_idflexstr_show = Irm::Permission.new(:permission_code=>'IRM_ID_FLEX_STRUCTS_SHOW',
                                             :page_controller=>'irm/id_flex_structures',
                                             :page_action=>'show',
                                             :not_auto_mult=>true)
    irm_idflexstr_show.permissions_tls.build(:language=>'zh',:name=>'查看弹性域结构',:description=>'', :source_lang=>'en')
    irm_idflexstr_show.permissions_tls.build(:language=>'en',:name=>'Show Flex Structure',:description=>'', :source_lang=>'en')
    irm_idflexstr_show.save

    idflexstr_index_page = Irm::MenuEntry.new(:menu_code=>'IRM_COMMON_SETTING_MENU',
                                         :permission_code=>'IRM_ID_FLEX_STRUCTS_INDEX',
                                         :display_sequence=>90,
                                         :not_auto_mult=>true)
    idflexstr_index_page.menu_entries_tls.build(:language=>'zh',:name=>'设置弹性域结构',:description=>'',:source_lang=>'en')
    idflexstr_index_page.menu_entries_tls.build(:language=>'en',:name=>'Set Flex Structures',:description=>'',:source_lang=>'en')
    idflexstr_index_page.save
#################################################################################################################################################
    irm_idflexseg_index = Irm::Permission.new(:permission_code=>'IRM_ID_FLEX_SEGMENT_INDEX',
                                             :page_controller=>'irm/id_flex_segments',
                                             :page_action=>'index',
                                             :not_auto_mult=>true)
    irm_idflexseg_index.permissions_tls.build(:language=>'zh',:name=>'弹性域段值首页',:description=>'',:source_lang=>'en')
    irm_idflexseg_index.permissions_tls.build(:language=>'en',:name=>'Flex Segment Index',:description=>'',:source_lang=>'en')
    irm_idflexseg_index.save

    irm_idflexseg_edit = Irm::Permission.new(:permission_code=>'IRM_ID_FLEX_SEGMENT_EDIT',
                                             :page_controller=>'irm/id_flex_segments',
                                             :page_action=>'edit',
                                             :not_auto_mult=>true)
    irm_idflexseg_edit.permissions_tls.build(:language=>'zh',:name=>'编辑弹性域段值',:description=>'',:source_lang=>'en')
    irm_idflexseg_edit.permissions_tls.build(:language=>'en',:name=>'Edit Flex Segment',:description=>'',:source_lang=>'en')
    irm_idflexseg_edit.save

    irm_idflexseg_new = Irm::Permission.new(:permission_code=>'IRM_ID_FLEX_SEGMENT_NEW',
                                             :page_controller=>'irm/id_flex_segments',
                                             :page_action=>'new',
                                             :not_auto_mult=>true)
    irm_idflexseg_new.permissions_tls.build(:language=>'zh',:name=>'创建弹性域段值',:description=>'', :source_lang=>'en')
    irm_idflexseg_new.permissions_tls.build(:language=>'en',:name=>'Create Flex Segment',:description=>'', :source_lang=>'en')
    irm_idflexseg_new.save

    irm_idflexseg_show = Irm::Permission.new(:permission_code=>'IRM_ID_FLEX_SEGMENT_SHOW',
                                             :page_controller=>'irm/id_flex_segments',
                                             :page_action=>'show',
                                             :not_auto_mult=>true)
    irm_idflexseg_show.permissions_tls.build(:language=>'zh',:name=>'查看弹性域段值',:description=>'', :source_lang=>'en')
    irm_idflexseg_show.permissions_tls.build(:language=>'en',:name=>'Show Flex Segment',:description=>'', :source_lang=>'en')
    irm_idflexseg_show.save

    idflexseg_index_page = Irm::MenuEntry.new(:menu_code=>'IRM_COMMON_SETTING_MENU',
                                         :permission_code=>'IRM_ID_FLEX_SEGMENT_INDEX',
                                         :display_sequence=>100,
                                         :not_auto_mult=>true)
    idflexseg_index_page.menu_entries_tls.build(:language=>'zh',:name=>'设置弹性域段值',:description=>'',:source_lang=>'en')
    idflexseg_index_page.menu_entries_tls.build(:language=>'en',:name=>'Set Flex Segments',:description=>'',:source_lang=>'en')
    idflexseg_index_page.save
  end

  def self.down
  end
end
