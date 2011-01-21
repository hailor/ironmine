# -*- coding: utf-8 -*-
class InitPriorityUrgenceImpactData < ActiveRecord::Migration
  def self.up
    Icm::UrgenceCode.delete_all
    Icm::UrgenceCodesTl.delete_all
    Icm::ImpactRange.delete_all
    Icm::ImpactRangesTl.delete_all
    Icm::PriorityCode.delete_all
    Icm::PriorityCodesTl.delete_all
    ug_normal = Icm::UrgenceCode.new(:urgency_code=>'GLOBAL_NORMAL',
                                   :company_id=>1,
                                   :default_flag=>'Y',
                                   :display_sequence=>10,
                                   :weight_values=>10,
                                   :not_auto_mult=>true)
    ug_normal.urgence_codes_tls.build(:language=>'zh',:name=>'一般',:description=>'一般',:source_lang=>'en')
    ug_normal.urgence_codes_tls.build(:language=>'en',:name=>'Normal',:description=>'Normal',:source_lang=>'en')
    ug_normal.save


    ug_urgent = Icm::UrgenceCode.new(:urgency_code=>'GLOBAL_URGENT',
                                     :company_id=>1,
                                   :default_flag=>'N',
                                   :display_sequence=>20,
                                   :weight_values=>20,
                                   :not_auto_mult=>true)
    ug_urgent.urgence_codes_tls.build(:language=>'zh',:name=>'紧急',:description=>'紧急',:source_lang=>'en')
    ug_urgent.urgence_codes_tls.build(:language=>'en',:name=>'Urgent',:description=>'Urgent',:source_lang=>'en')
    ug_urgent.save

    ug_vurgent = Icm::UrgenceCode.new(:urgency_code=>'GLOBAL_VERY_URGENT',
                                      :company_id=>1,
                                   :default_flag=>'N',
                                   :display_sequence=>30,
                                   :weight_values=>30,
                                   :not_auto_mult=>true)
    ug_vurgent.urgence_codes_tls.build(:language=>'zh',:name=>'非常紧急',:description=>'非常紧急',:source_lang=>'en')
    ug_vurgent.urgence_codes_tls.build(:language=>'en',:name=>'Very urgent',:description=>'Very urgent',:source_lang=>'en')
    ug_vurgent.save

    ip_low = Icm::ImpactRange.new(:impact_code=>'GLOBAL_LOW',
                                   :company_id=>1,
                                   :default_flag=>'Y',
                                   :display_sequence=>10,
                                   :weight_values=>10,
                                   :not_auto_mult=>true)
    ip_low.impact_ranges_tls.build(:language=>'zh',:name=>'低',:description=>'低',:source_lang=>'en')
    ip_low.impact_ranges_tls.build(:language=>'en',:name=>'Low',:description=>'Low',:source_lang=>'en')
    ip_low.save

    ip_medium = Icm::ImpactRange.new(:impact_code=>'GLOBAL_MEDIUM',
                                     :company_id=>1,
                                   :default_flag=>'N',
                                   :display_sequence=>20,
                                   :weight_values=>20,
                                   :not_auto_mult=>true)
    ip_medium.impact_ranges_tls.build(:language=>'zh',:name=>'中',:description=>'中',:source_lang=>'en')
    ip_medium.impact_ranges_tls.build(:language=>'en',:name=>'Medium',:description=>'Medium',:source_lang=>'en')
    ip_medium.save

    ip_high = Icm::ImpactRange.new(:impact_code=>'GLOBAL_HIGH',
                                   :company_id=>1,
                                   :default_flag=>'N',
                                   :display_sequence=>30,
                                   :weight_values=>30,
                                   :not_auto_mult=>true)
    ip_high.impact_ranges_tls.build(:language=>'zh',:name=>'高',:description=>'高',:source_lang=>'en')
    ip_high.impact_ranges_tls.build(:language=>'en',:name=>'High',:description=>'High',:source_lang=>'en')
    ip_high.save

    pri_low = Icm::PriorityCode.new(:priority_code=>'GLOBAL_LOW',
                                    :company_id=>1,
                                   :high_weight_value=>20,
                                   :low_weight_value=>0,
                                   :not_auto_mult=>true)
    pri_low.priority_codes_tls.build(:language=>'zh',:name=>'低',:description=>'低',:source_lang=>'en')
    pri_low.priority_codes_tls.build(:language=>'en',:name=>'Low',:description=>'Low',:source_lang=>'en')
    pri_low.save

    pri_medium = Icm::PriorityCode.new(:priority_code=>'GLOBAL_MEDIUM',
                                       :company_id=>1,
                                   :high_weight_value=>40,
                                   :low_weight_value=>20,
                                   :not_auto_mult=>true)
    pri_medium.priority_codes_tls.build(:language=>'zh',:name=>'中',:description=>'中',:source_lang=>'en')
    pri_medium.priority_codes_tls.build(:language=>'en',:name=>'Medium',:description=>'Medium',:source_lang=>'en')
    pri_medium.save

    pri_high = Icm::PriorityCode.new(:priority_code=>'GLOBAL_HIGH',
                                     :company_id=>1,
                                   :high_weight_value=>60,
                                   :low_weight_value=>40,
                                   :not_auto_mult=>true)
    pri_high.priority_codes_tls.build(:language=>'zh',:name=>'高',:description=>'高',:source_lang=>'en')
    pri_high.priority_codes_tls.build(:language=>'en',:name=>'High',:description=>'High',:source_lang=>'en')
    pri_high.save



  end

  def self.down
    Icm::UrgenceCode.delete_all
    Icm::UrgenceCodesTl.delete_all
    Icm::ImpactRange.delete_all
    Icm::ImpactRangesTl.delete_all
    Icm::PriorityCode.delete_all
    Icm::PriorityCodesTl.delete_all

  end
end
