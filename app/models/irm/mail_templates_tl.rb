class Irm::MailTemplatesTl < ActiveRecord::Base
  set_table_name :irm_mail_templates_tl

  belongs_to :mail_template,:class_name=>"Irm::MailTemplate"

  validates :name,:subject,:mail_body,  :presence => true

  scope :query_by_language,lambda{|language| where("language=?",language)}

  scope :query_by_template_id,lambda{|template_id| where("template_id=?",template_id)}

  #扩展标准的查询
  query_extend
end