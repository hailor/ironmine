# -*- coding: utf-8 -*-
class AddPersonTitleLookupcode < ActiveRecord::Migration
  def self.up
    irm_person_title=Irm::LookupType.new(:lookup_level=>'GLOBAL',:lookup_type=>'IRM_PERSON_TITLE',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_person_title.lookup_types_tls.build(:lookup_type_id=>irm_person_title.id,:meaning=>'人员称谓',:description=>'人员称谓',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_person_title.lookup_types_tls.build(:lookup_type_id=>irm_person_title.id,:meaning=>'person title',:description=>'person title',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_person_title.save

    irm_person_titleperson_title_mr= Irm::LookupValue.new(:lookup_type=>'IRM_PERSON_TITLE',:lookup_code=>'PERSON_TITLE_MR',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_person_titleperson_title_mr.lookup_values_tls.build(:lookup_value_id=>irm_person_titleperson_title_mr.id,:meaning=>'先生',:description=>'先生',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_person_titleperson_title_mr.lookup_values_tls.build(:lookup_value_id=>irm_person_titleperson_title_mr.id,:meaning=>'Mr.',:description=>'Mr.',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_person_titleperson_title_mr.save

    irm_person_titleperson_title_ms= Irm::LookupValue.new(:lookup_type=>'IRM_PERSON_TITLE',:lookup_code=>'PERSON_TITLE_MS',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_person_titleperson_title_ms.lookup_values_tls.build(:lookup_value_id=>irm_person_titleperson_title_ms.id,:meaning=>'女士',:description=>'女士',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_person_titleperson_title_ms.lookup_values_tls.build(:lookup_value_id=>irm_person_titleperson_title_ms.id,:meaning=>'Ms.',:description=>'Ms.',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_person_titleperson_title_ms.save

    irm_person_titleperson_title_ms= Irm::LookupValue.new(:lookup_type=>'IRM_PERSON_TITLE',:lookup_code=>'PERSON_TITLE_MS',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_person_titleperson_title_ms.lookup_values_tls.build(:lookup_value_id=>irm_person_titleperson_title_ms.id,:meaning=>'女士',:description=>'女士',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_person_titleperson_title_ms.lookup_values_tls.build(:lookup_value_id=>irm_person_titleperson_title_ms.id,:meaning=>'Ms.',:description=>'Ms.',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_person_titleperson_title_ms.save

    irm_person_titleperson_title_mrs= Irm::LookupValue.new(:lookup_type=>'IRM_PERSON_TITLE',:lookup_code=>'PERSON_TITLE_MRS',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_person_titleperson_title_mrs.lookup_values_tls.build(:lookup_value_id=>irm_person_titleperson_title_mrs.id,:meaning=>'夫人',:description=>'夫人',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_person_titleperson_title_mrs.lookup_values_tls.build(:lookup_value_id=>irm_person_titleperson_title_mrs.id,:meaning=>'Mrs.',:description=>'Mrs.',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_person_titleperson_title_mrs.save

    irm_person_titleperson_title_dr= Irm::LookupValue.new(:lookup_type=>'IRM_PERSON_TITLE',:lookup_code=>'PERSON_TITLE_DR',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_person_titleperson_title_dr.lookup_values_tls.build(:lookup_value_id=>irm_person_titleperson_title_dr.id,:meaning=>'博士',:description=>'博士',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_person_titleperson_title_dr.lookup_values_tls.build(:lookup_value_id=>irm_person_titleperson_title_dr.id,:meaning=>'Dr.',:description=>'Dr.',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_person_titleperson_title_dr.save
  end

  def self.down
    irm_person_title=Irm::LookupType.where(:lookup_level=>'GLOBAL',:lookup_type=>'IRM_PERSON_TITLE')
    irm_person_title.destroy if irm_person_title
  end
end
