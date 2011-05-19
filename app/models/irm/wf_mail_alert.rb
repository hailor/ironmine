class Irm::WfMailAlert < ActiveRecord::Base
  set_table_name :irm_wf_mail_alerts

  has_many :wf_mail_recipients

  attr_accessor :recipient
  validates_presence_of :mail_alert_code,:name,:bo_code,:mail_template_code
  validates_uniqueness_of :mail_alert_code, :if => Proc.new { |i| !i.mail_alert_code.present? }
  validates_uniqueness_of :name, :if => Proc.new { |i| !i.name.present? }
  validates_format_of :mail_alert_code, :with => /^[A-Z0-9_]*$/ ,:if=>Proc.new{|i| i.mail_alert_code.present?}

  query_extend

  scope :with_bo,lambda{|language|
    joins("LEFT OUTER JOIN #{Irm::BusinessObject.view_name} bo ON bo.business_object_code = #{table_name}.bo_code and bo.language='#{language}'").
    select("bo.name bo_name")
  }

  scope :with_mail_template,lambda{|language|
    joins("LEFT OUTER JOIN #{Irm::MailTemplate.view_name} mt ON mt.template_code = #{table_name}.mail_template_code and mt.language='#{language}'").
    select("mt.name mail_template_name")
  }

  def self.list_all
    select("#{table_name}.*").with_bo(I18n.locale).with_mail_template(I18n.locale)
  end

  def sync_mail_recipients(code_array)
    code_array.values.each do |code|
      type_and_id = code.split("#")
      next unless type_and_id.size==2
      recipient = self.wf_mail_recipients.build(:bo_code=>self.bo_code,:recipient_type=>type_and_id[0],:recipient_id=>type_and_id[1])
      recipient.destroy  unless  recipient.valid?
    end
  end
end
