# -*- coding: utf-8 -*-
class AddOperationalCatalogSegLookupData < ActiveRecord::Migration
  def self.up
    operational_catalog_seg_type=Irm::LookupType.new(:lookup_level=>'GLOBAL',
                                         :lookup_type=>'OPERATIONAL_CATALOG_SEG_TYPE',
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    operational_catalog_seg_type.lookup_types_tls.build(:lookup_type_id=>operational_catalog_seg_type.id,
                                            :meaning=>"服务类别Segment顺序",
                                            :description=>"服务类别Segment顺序",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    operational_catalog_seg_type.lookup_types_tls.build(:lookup_type_id=>operational_catalog_seg_type.id,
                                            :meaning=>"服务类别Segment顺序",
                                            :description=>"服务类别Segment顺序",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    operational_catalog_seg_type.save

    operational_catalog_seg_type_value1=Irm::LookupValue.new(:lookup_type=>'OPERATIONAL_CATALOG_SEG_TYPE',
                                         :lookup_code=>"OPERATIONAL_CATALOG_SEG_1",
                                         :start_date_active=>Time.now,
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    operational_catalog_seg_type_value1.lookup_values_tls.build(:lookup_value_id=>operational_catalog_seg_type_value1.id,
                                            :meaning=>"OPERATIONAL_CATALOG_SYSTEM",
                                            :description=>"OPERATIONAL_CATALOG_SYSTEM",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    operational_catalog_seg_type_value1.lookup_values_tls.build(:lookup_value_id=>operational_catalog_seg_type_value1.id,
                                            :meaning=>"OPERATIONAL_CATALOG_SYSTEM",
                                            :description=>"OPERATIONAL_CATALOG_SYSTEM",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    operational_catalog_seg_type_value1.save

    operational_catalog_seg_type_value2=Irm::LookupValue.new(:lookup_type=>'OPERATIONAL_CATALOG_SEG_TYPE',
                                         :lookup_code=>"OPERATIONAL_CATALOG_SEG_2",
                                         :start_date_active=>Time.now,
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    operational_catalog_seg_type_value2.lookup_values_tls.build(:lookup_value_id=>operational_catalog_seg_type_value2.id,
                                            :meaning=>"OPERATIONAL_CATALOG_MODULE",
                                            :description=>"OPERATIONAL_CATALOG_MODULE",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    operational_catalog_seg_type_value2.lookup_values_tls.build(:lookup_value_id=>operational_catalog_seg_type_value2.id,
                                            :meaning=>"OPERATIONAL_CATALOG_MODULE",
                                            :description=>"OPERATIONAL_CATALOG_MODULE",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    operational_catalog_seg_type_value2.save

    operational_catalog_seg_type_value3=Irm::LookupValue.new(:lookup_type=>'OPERATIONAL_CATALOG_SEG_TYPE',
                                         :lookup_code=>"OPERATIONAL_CATALOG_SEG_3",
                                         :start_date_active=>Time.now,
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    operational_catalog_seg_type_value3.lookup_values_tls.build(:lookup_value_id=>operational_catalog_seg_type_value3.id,
                                            :meaning=>"OPERATIONAL_CATALOG_FEATURE",
                                            :description=>"OPERATIONAL_CATALOG_FEATURE",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    operational_catalog_seg_type_value3.lookup_values_tls.build(:lookup_value_id=>operational_catalog_seg_type_value3.id,
                                            :meaning=>"OPERATIONAL_CATALOG_FEATURE",
                                            :description=>"OPERATIONAL_CATALOG_FEATURE",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    operational_catalog_seg_type_value3.save
  end

  def self.down
    operational_catalog_seg_type= Irm::LookupType.where(:lookup_type=>"OPERATIONAL_CATALOG_SEG_TYPE").first
    Irm::LookupTypesTl.where(:lookup_type_id => operational_catalog_seg_type.id).each do |t1|
      t1.delete
    end

    #delete lookup code
    Irm::LookupValue.where(:lookup_type=>"OPERATIONAL_CATALOG_SEG_TYPE").each do |lookup_code|
       Irm::LookupValuesTl.where(:lookup_value_id=>lookup_code.id).each do |lookup_code_tl|
         lookup_code_tl.delete
       end
       lookup_code.delete
    end    
  end
end
