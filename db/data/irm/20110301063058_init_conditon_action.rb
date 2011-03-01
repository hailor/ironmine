# -*- coding: utf-8 -*-
class InitConditonAction < ActiveRecord::Migration
  def self.up
    incident_request_new = Irm::Condition.new(:context_code=>"INCIDENT_REQUEST",:condition_code=>"INCIDENT_REQUEST_NEW",:not_auto_mult=>true)
    incident_request_new.conditions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建事故单',:description=>'新建事故单')
    incident_request_new.conditions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New incident request',:description=>'New incident request')
    incident_request_new.save

    send_mail_action = Irm::Action.new(:action_code=>"SEND_MAIL",:handler=>"Irm::Actions::SendMail",:not_auto_mult=>true)
    send_mail_action.conditions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'发送邮件',:description=>'发送邮件')
    send_mail_action.conditions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Send email',:description=>'Send email')
    send_mail_action.save
  end

  def self.down
  end
end
