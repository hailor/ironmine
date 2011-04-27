# -*- coding: utf-8 -*-
class InitFilterOperatorLookup < ActiveRecord::Migration
  def self.up
    rule_filter_operator=Irm::LookupType.new(:lookup_level=>'GLOBAL',:lookup_type=>'RULE_FILTER_OPERATOR',:status_code=>'ENABLED',:not_auto_mult=>true)
    rule_filter_operator.lookup_types_tls.build(:lookup_type_id=>rule_filter_operator.id,:meaning=>'规则过滤器操作符',:description=>'规则过滤器操作符',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    rule_filter_operator.lookup_types_tls.build(:lookup_type_id=>rule_filter_operator.id,:meaning=>'Rule Filter Operator',:description=>'Rule Filter Operator',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    rule_filter_operator.save

    rule_filter_operatore= Irm::LookupValue.new(:lookup_type=>'RULE_FILTER_OPERATOR',:lookup_code=>'E',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    rule_filter_operatore.lookup_values_tls.build(:lookup_value_id=>rule_filter_operatore.id,:meaning=>'等于',:description=>'等于',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    rule_filter_operatore.lookup_values_tls.build(:lookup_value_id=>rule_filter_operatore.id,:meaning=>'Equal',:description=>'Equal',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    rule_filter_operatore.save
    n= Irm::LookupValue.new(:lookup_type=>'RULE_FILTER_OPERATOR',:lookup_code=>'N',:start_date_active=>'2011-02-21',:status_code=>'ENABLED',:not_auto_mult=>true)
    n.lookup_values_tls.build(:lookup_value_id=>n.id,:meaning=>'不等于',:description=>'不等于',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    n.lookup_values_tls.build(:lookup_value_id=>n.id,:meaning=>'Not Equal',:description=>'Not Equal',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    n.save
    g= Irm::LookupValue.new(:lookup_type=>'RULE_FILTER_OPERATOR',:lookup_code=>'G',:start_date_active=>'2011-02-22',:status_code=>'ENABLED',:not_auto_mult=>true)
    g.lookup_values_tls.build(:lookup_value_id=>g.id,:meaning=>'大于',:description=>'大于',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    g.lookup_values_tls.build(:lookup_value_id=>g.id,:meaning=>'Greater Than',:description=>'Greater Than',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    g.save
    l= Irm::LookupValue.new(:lookup_type=>'RULE_FILTER_OPERATOR',:lookup_code=>'L',:start_date_active=>'2011-02-23',:status_code=>'ENABLED',:not_auto_mult=>true)
    l.lookup_values_tls.build(:lookup_value_id=>l.id,:meaning=>'小于',:description=>'小于',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    l.lookup_values_tls.build(:lookup_value_id=>l.id,:meaning=>'Letter Than',:description=>'Letter Than',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    l.save
    m= Irm::LookupValue.new(:lookup_type=>'RULE_FILTER_OPERATOR',:lookup_code=>'M',:start_date_active=>'2011-02-24',:status_code=>'ENABLED',:not_auto_mult=>true)
    m.lookup_values_tls.build(:lookup_value_id=>m.id,:meaning=>'大于或等于',:description=>'大于或等于',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    m.lookup_values_tls.build(:lookup_value_id=>m.id,:meaning=>'Greater than or equal to',:description=>'Greater than or equal to',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    m.save
    h= Irm::LookupValue.new(:lookup_type=>'RULE_FILTER_OPERATOR',:lookup_code=>'H',:start_date_active=>'2011-02-25',:status_code=>'ENABLED',:not_auto_mult=>true)
    h.lookup_values_tls.build(:lookup_value_id=>h.id,:meaning=>'小于或等于',:description=>'小于或等于',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    h.lookup_values_tls.build(:lookup_value_id=>h.id,:meaning=>'Less than or equal to',:description=>'Less than or equal to',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    h.save
    isnil= Irm::LookupValue.new(:lookup_type=>'RULE_FILTER_OPERATOR',:lookup_code=>'NIL',:start_date_active=>'2011-02-26',:status_code=>'ENABLED',:not_auto_mult=>true)
    isnil.lookup_values_tls.build(:lookup_value_id=>isnil.id,:meaning=>'为空值',:description=>'为空值',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    isnil.lookup_values_tls.build(:lookup_value_id=>isnil.id,:meaning=>'Is Null',:description=>'Is Null',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    isnil.save
    nnil= Irm::LookupValue.new(:lookup_type=>'RULE_FILTER_OPERATOR',:lookup_code=>'NNIL',:start_date_active=>'2011-02-27',:status_code=>'ENABLED',:not_auto_mult=>true)
    nnil.lookup_values_tls.build(:lookup_value_id=>nnil.id,:meaning=>'不为空值',:description=>'不为空值',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    nnil.lookup_values_tls.build(:lookup_value_id=>nnil.id,:meaning=>'Not Null',:description=>'Not Null',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    nnil.save
    bw= Irm::LookupValue.new(:lookup_type=>'RULE_FILTER_OPERATOR',:lookup_code=>'BW',:start_date_active=>'2011-02-28',:status_code=>'ENABLED',:not_auto_mult=>true)
    bw.lookup_values_tls.build(:lookup_value_id=>bw.id,:meaning=>'开始字符等于',:description=>'开始字符等于',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    bw.lookup_values_tls.build(:lookup_value_id=>bw.id,:meaning=>'Begin With',:description=>'Begin With',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    bw.save
    ew= Irm::LookupValue.new(:lookup_type=>'RULE_FILTER_OPERATOR',:lookup_code=>'EW',:start_date_active=>'2011-03-01',:status_code=>'ENABLED',:not_auto_mult=>true)
    ew.lookup_values_tls.build(:lookup_value_id=>ew.id,:meaning=>'结束字符等于',:description=>'结束字符等于',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    ew.lookup_values_tls.build(:lookup_value_id=>ew.id,:meaning=>'End With',:description=>'End With',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    ew.save
    u= Irm::LookupValue.new(:lookup_type=>'RULE_FILTER_OPERATOR',:lookup_code=>'U',:start_date_active=>'2011-03-02',:status_code=>'ENABLED',:not_auto_mult=>true)
    u.lookup_values_tls.build(:lookup_value_id=>u.id,:meaning=>'包括',:description=>'包括',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    u.lookup_values_tls.build(:lookup_value_id=>u.id,:meaning=>'Include',:description=>'Include',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    u.save
    x= Irm::LookupValue.new(:lookup_type=>'RULE_FILTER_OPERATOR',:lookup_code=>'X',:start_date_active=>'2011-03-03',:status_code=>'ENABLED',:not_auto_mult=>true)
    x.lookup_values_tls.build(:lookup_value_id=>x.id,:meaning=>'不包括',:description=>'不包括',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    x.lookup_values_tls.build(:lookup_value_id=>x.id,:meaning=>'Not Include',:description=>'Not Include',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    x.save
    isin= Irm::LookupValue.new(:lookup_type=>'RULE_FILTER_OPERATOR',:lookup_code=>'IN',:start_date_active=>'2011-03-04',:status_code=>'ENABLED',:not_auto_mult=>true)
    isin.lookup_values_tls.build(:lookup_value_id=>isin.id,:meaning=>'(日期)N天内',:description=>'(日期)N天内',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    isin.lookup_values_tls.build(:lookup_value_id=>isin.id,:meaning=>'Days in',:description=>'Days in',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    isin.save
  end

  def self.down
  end
end
