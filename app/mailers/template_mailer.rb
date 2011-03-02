class TemplateMailer < ActionMailer::Base
  default :from => "ironmine@hand.com"
  #
  # 使用邮件模板发送邮件
  #
  def email_template(to, email_template, options = {},mail_options={})
    admin_mail_address="root.ironmine@gmail.com"
    headers = {}
    # 设置邮件类型
    headers.merge!({:content_type=>("html".eql?(email_template.template_type))? "text/html":"text/plain"})
    # 设置邮件发送人
    headers.merge!({:from=>email_template.from.blank? ? email_template.from : admin_mail_address})
    # 设置邮件主题
    # 1，如果邮件主题为liquid模板，则使用liquid解释
    # 2，如果为普通文本则直接作为主题
    headers.merge!({:subject=>%r{\{\{.*\}\}}.match(email_template[:subject])? email_template.render_subject(options):email_template[:subject]})
    # 设置收件人
    headers.merge!({:to=>to})
    # 设置邮件主体内容
    headers.merge!({:body=>email_template.render_body(options)})
    # 设置其他发送邮件属性
    headers.merge!(mail_options)
    mail(headers)
  end
end
