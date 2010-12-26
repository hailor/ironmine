# -*- coding: utf-8 -*-
class AddOperationalCatalogsIdFlexData < ActiveRecord::Migration
  def self.up
    id_flex = Irm::IdFlex.new(:id_flex_code => "OPERATIONAL_CATALOG", :id_flex_name => "Operational Catalog Id Flexes", :status_code => "ENABLED")
    id_flex.save

    id_flex_structure = Irm::IdFlexStructure.new(:id_flex_code => "OPERATIONAL_CATALOG", :id_flex_num => 100, :id_flex_structure_code => "OPE_CATALOG_ICM", :status_code => "ENABLED",:not_auto_mult=>true)
    id_flex_structure.id_flex_structures_tls.build(:id_flex_structure_name => "Operational Catalog ICM", :language => "zh", :source_lang => "zh", :status_code => "ENABLED")
    id_flex_structure.id_flex_structures_tls.build(:id_flex_structure_name => "Operational Catalog ICM", :language => "en", :source_lang => "zh", :status_code => "ENABLED")
    id_flex_structure.save

    id_flex_segment1 = Irm::IdFlexSegment.new(:id_flex_code => "OPERATIONAL_CATALOG", :id_flex_num => 100, :segment_num => 10,
                                              :segment_name => "segment1", :status_code => "ENABLED", :flex_value_set_name => "OPERATIONAL_CATALOG_SYSTEM",:not_auto_mult=>true)
    id_flex_segment1.id_flex_segments_tls.build(:segment_name => "segment1",:form_left_prompt => "系统", :status_code => "ENABLED", :language => "zh", :source_lang => "zh")
    id_flex_segment1.id_flex_segments_tls.build(:segment_name => "segment1",:form_left_prompt => "系统", :status_code => "ENABLED", :language => "en", :source_lang => "zh")
    id_flex_segment1.save

    id_flex_segment2 = Irm::IdFlexSegment.new(:id_flex_code => "OPERATIONAL_CATALOG", :id_flex_num => 100,:segment_num => 20,
                                              :segment_name => "segment2", :status_code => "ENABLED", :flex_value_set_name => "OPERATIONAL_CATALOG_MODULE",:not_auto_mult=>true)
    id_flex_segment2.id_flex_segments_tls.build(:segment_name => "segment2",:form_left_prompt => "模块", :status_code => "ENABLED", :language => "zh", :source_lang => "zh")
    id_flex_segment2.id_flex_segments_tls.build(:segment_name => "segment2",:form_left_prompt => "模块", :status_code => "ENABLED", :language => "en", :source_lang => "zh")
    id_flex_segment2.save

    id_flex_segment3 = Irm::IdFlexSegment.new(:id_flex_code => "OPERATIONAL_CATALOG", :id_flex_num => 100,:segment_num => 30,
                                              :segment_name => "segment3", :status_code => "ENABLED", :flex_value_set_name => "OPERATIONAL_CATALOG_FEATURE",:not_auto_mult=>true)
    id_flex_segment3.id_flex_segments_tls.build(:segment_name => "segment3",:form_left_prompt => "功能", :status_code => "ENABLED", :language => "zh", :source_lang => "zh")
    id_flex_segment3.id_flex_segments_tls.build(:segment_name => "segment3",:form_left_prompt => "功能", :status_code => "ENABLED", :language => "en", :source_lang => "zh")
    id_flex_segment3.save
  end

  def self.down
  end
end
