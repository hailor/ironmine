# -*- coding: utf-8 -*-
class InitWfMailAlertRecipientLookup < ActiveRecord::Migration
  def self.up
    wf_mail_alert_recipient_type=Irm::LookupType.new(:lookup_level=>'GLOBAL',:lookup_type=>'WF_MAIL_ALERT_RECIPIENT_TYPE',:status_code=>'ENABLED',:not_auto_mult=>true)
    wf_mail_alert_recipient_type.lookup_types_tls.build(:lookup_type_id=>wf_mail_alert_recipient_type.id,:meaning=>'邮件警告收件人类型',:description=>'邮件警告收件人类型',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    wf_mail_alert_recipient_type.lookup_types_tls.build(:lookup_type_id=>wf_mail_alert_recipient_type.id,:meaning=>'Mail alert recipient',:description=>'Mail alert recipient',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    wf_mail_alert_recipient_type.save

    wf_mail_alert_recipient_typerelated_person= Irm::LookupValue.new(:lookup_type=>'WF_MAIL_ALERT_RECIPIENT_TYPE',:lookup_code=>'RELATED_PERSON',:start_date_active=>'2011-05-11',:status_code=>'ENABLED',:not_auto_mult=>true)
    wf_mail_alert_recipient_typerelated_person.lookup_values_tls.build(:lookup_value_id=>wf_mail_alert_recipient_typerelated_person.id,:meaning=>'相关人员',:description=>'相关人员',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    wf_mail_alert_recipient_typerelated_person.lookup_values_tls.build(:lookup_value_id=>wf_mail_alert_recipient_typerelated_person.id,:meaning=>'Related Person',:description=>'Related Person',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    wf_mail_alert_recipient_typerelated_person.save
    wf_mail_alert_recipient_typeperson= Irm::LookupValue.new(:lookup_type=>'WF_MAIL_ALERT_RECIPIENT_TYPE',:lookup_code=>'PERSON',:start_date_active=>'2011-05-11',:status_code=>'ENABLED',:not_auto_mult=>true)
    wf_mail_alert_recipient_typeperson.lookup_values_tls.build(:lookup_value_id=>wf_mail_alert_recipient_typeperson.id,:meaning=>'人员',:description=>'人员',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    wf_mail_alert_recipient_typeperson.lookup_values_tls.build(:lookup_value_id=>wf_mail_alert_recipient_typeperson.id,:meaning=>'Person',:description=>'Person',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    wf_mail_alert_recipient_typeperson.save
    wf_mail_alert_recipient_typerole= Irm::LookupValue.new(:lookup_type=>'WF_MAIL_ALERT_RECIPIENT_TYPE',:lookup_code=>'ROLE',:start_date_active=>'2011-05-11',:status_code=>'ENABLED',:not_auto_mult=>true)
    wf_mail_alert_recipient_typerole.lookup_values_tls.build(:lookup_value_id=>wf_mail_alert_recipient_typerole.id,:meaning=>'角色',:description=>'角色',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    wf_mail_alert_recipient_typerole.lookup_values_tls.build(:lookup_value_id=>wf_mail_alert_recipient_typerole.id,:meaning=>'Role',:description=>'Role',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    wf_mail_alert_recipient_typerole.save
  end

  def self.down
  end
end
