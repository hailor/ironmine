class Irm::MailTemplate < ActiveRecord::Base
  set_table_name :irm_mail_templates
  #serialize :parsed_template

  #由于没有进行模板预编译，注释不必要的代码
  #def after_validation
  #  errors.add :template, @syntax_error unless @syntax_error.nil?
  #end

  validates_presence_of :entity_code,:template_code,:from

  scope :query_by_template_code,lambda{|template_code| where("template_code =?",template_code)}

  scope :query_wrap_info,lambda{|language| select("irm_mail_templates.*,irm_mail_templates_tl.name,irm_mail_templates_tl.description,"+
                                                          "v1.meaning entity_meaning,v2.meaning status_meaning").
                                                   joins(",irm_lookup_values_vl v1").
                                                   joins(",irm_lookup_values_vl v2").
                                                   where("v1.lookup_type='ENTITY_CODE' AND v1.lookup_code = #{table_name}.entity_code AND "+
                                                         "v2.lookup_type='SYSTEM_STATUS_CODE' AND v2.lookup_code = #{table_name}.status_code AND "+
                                                         "v1.language=? AND v2.language=?",language,language)}

  #扩展查询方法
  query_extend

  #多语言关系
  attr_accessor :name,:description,:subject,:mail_body
  has_many :mail_templates_tls,:class_name=>"Irm::MailTemplatesTl",:foreign_key=>"template_id"
  scope :current_language ,lambda{|language| select("#{Irm::MailTemplate.table_name}.*,#{Irm::MailTemplatesTl.table_name}.subject").
                                            joins(:mail_templates_tls).
                                            where("#{Irm::MailTemplatesTl.table_name}.language=?",language)}
  #如果语言表里面字段不是name和description的话，需要特别指出
  acts_as_multilingual({:columns =>[:name,:description,:subject,:mail_body],:required=>[:name,:subject,:mail_body]})

  ### Attributes
  attr_protected :parsed_template

  #
  # body contains the raw template. When updating this attribute, the
  # email_template parses the template and stores the serialized object
  # for quicker rendering.
  #
  #def mail_body=(text)
  #  self[:mail_body] = text
  #
  # begin
  #   @template = Liquid::Template.parse(text)
  #   self[:parsed_template] = Marshal.dump(@template)
  # rescue Liquid::SyntaxError => error
  #   @syntax_error = error.message
  # end
  #end

  ### Methods

  #
  # 发送邮件
  # email_adress 表示收件人地址
  # language_code 发送邮件选择的语言
  # options 邮件模板使用的参数
  # mail_options 发送邮件方法mail的参数，可以从外面传入
  #
  def deliver_to(email_address,options = {},language_code = 'en',mail_options={})
    # 将所有symbol的key转化为string类型
    options.stringify_keys!
    email_template  = self.class.query_by_language(language_code).find(self.id)
    ApplicationMailer.email_template(email_address, email_template, options,mail_options).deliver
  end


  # 使用liquid解释带参数的模板
  def render_body(options = {})
    body=Liquid::Template.parse self[:mail_body]
    body.render options
  end
  # 使用liquid解释带参数的主题
  def render_subject(options = {})
    subject=Liquid::Template.parse self[:subject]
    subject.render options
  end

  #
  # Usable string representation
  #
  def to_s
    "[MailTemplate] From: #{from}, '#{subject}': #{body}"
  end

 private
  #
  # Returns a usable Liquid:Template instance
  #
  def template
    return @template unless @template.nil?

    if self[:parsed_template].blank?
      @template = Liquid::Template.parse mail_body
      self[:parsed_template] = Marshal.dump @template
      save
    else
      @template = Marshal.load self[:parsed_template]
    end

    @template
  end
end
