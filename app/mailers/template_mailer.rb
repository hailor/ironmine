class TemplateMailer < ActionMailer::Base
  default :from => Irm::SystemParametersManager.emission_email_address
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


  def template_email(mail_options,email_template,template_params={},header_options={})
    send_options = mail_options

    # 设置邮件类型
    send_options.merge!({:content_type=>("html".eql?(email_template.template_type))? "text/html":"text/plain"})
    # 设置邮件主题
    # 1，如果邮件主题为liquid模板，则使用liquid解释
    # 2，如果为普通文本则直接作为主题
    send_options.merge!({:subject=>%r{\{\{.*\}\}}.match(email_template[:subject])? email_template.render_subject(template_params):email_template[:subject]})
    # 设置邮件主体内容
    send_options.merge!({:body=>email_template.render_body(template_params)})
    headers(header_options)

    mail(send_options)
  end
end
