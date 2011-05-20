class Irm::MailTemplate < ActiveRecord::Base
  set_table_name :irm_mail_templates
  #serialize :parsed_template

  #由于没有进行模板预编译，注释不必要的代码
  #def after_validation
  #  errors.add :template, @syntax_error unless @syntax_error.nil?
  #end

  ### Attributes
  attr_protected :parsed_template

  #多语言关系
  attr_accessor :name,:description,:subject,:mail_body
  has_many :mail_templates_tls,:class_name=>"Irm::MailTemplatesTl",:foreign_key=>"template_id",:order => "language"
  acts_as_multilingual({:columns =>[:name,:description,:subject,:mail_body],:required=>[:name,:subject,:mail_body]})

  validates_presence_of :template_code
  validates_uniqueness_of :template_code, :if => Proc.new { |i| !i.template_code.blank? }
  validates_format_of :template_code, :with => /^[A-Z0-9_]*$/ ,:if=>Proc.new{|i| !i.template_code.blank?}

  scope :query_by_template_code,lambda{|template_code| where("template_code =?",template_code)}


  #扩展查询方法
  query_extend


  scope :current_language ,lambda{|language| select("#{Irm::MailTemplate.table_name}.*,#{Irm::MailTemplatesTl.table_name}.subject").
                                            joins(:mail_templates_tls).
                                            where("#{Irm::MailTemplatesTl.table_name}.language=?",language)}

  scope :select_all,lambda{select("#{table_name}.*")}

  def self.list_all
    select_all.multilingual.status_meaning
  end

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

  # params
  #   mail_options => :from  邮件发关参数
  #   header_options  邮件头参数，用来传递隐藏信息
  #   mail_mode   邮件模式，默认为SPLIT,可以选择MERGE模式
  #   object_params  邮件的Liquid参数
  #   to_person_ids  收件人ID
  #   to_emails
  #   cc_person_ids  抄送人ID
  #   bcc_person_ids 密送人员ID
  def deliver_to(params)
    # 将所有symbol的key转化为string类型
    #recursive_stringify_keys(params)
    params_dup = params.dup

    mail_options = {}
    mail_options = params_dup[:mail_options] if params_dup[:mail_options]

    header_options = {}
    header_options = params_dup[:header_options] if  params_dup[:header_options]

    template_params = {}
    template_params = params_dup[:object_params] if  params_dup[:object_params]
    Hash.recursive_stringify_keys(template_params)

    to_people = Irm::Person.query_by_ids(params_dup[:to_person_ids])

    # crash when no people
    return unless to_people.any?

    additional_emails = []
    additional_emails = params_dup[:to_emails] if  params_dup[:to_emails]

    cc_people = []
    cc_people = Irm::Person.query_by_ids(params_dup[:cc_person_ids]) if params_dup[:cc_person_ids]
    cc_emails = cc_people.collect{|p| p.email_address if Irm::Constant::SYS_YES.eql?(p.notification_flag)}.compact.join(",")

    bcc_people = []
    bcc_people = Irm::Person.query_by_ids(params_dup[:bcc_person_ids]) if params_dup[:bcc_person_ids]
    bcc_emails = bcc_people.collect{|p| p.email_address if Irm::Constant::SYS_YES.eql?(p.notification_flag)}.compact.join(",")

    to_emails = to_people.collect{|p| p.email_address if Irm::Constant::SYS_YES.eql?(p.notification_flag)}.compact.join(",")
    to_emails = to_emails + additional_emails.join(",")
    email_template = nil
    if to_people.first
      email_template  = self.class.query_by_language(to_people.first.language_code).find(self.id)
    else
      email_template  = self.class.query_by_language(Irm::Person.current.language_code).find(self.id)
    end

    mail_options.merge!(:to=>to_emails,:cc=>cc_emails,:bcc=>bcc_emails)
    TemplateMailer.template_email(mail_options,email_template,template_params,header_options).deliver


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
    "[MailTemplate]  '#{subject}': #{body}"
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

  def recursive_stringify_keys(hash)
    return unless hash.is_a?(Hash)
    hash.values.each do |v|
      next unless v.is_a?(Hash)
      recursive_stringify_keys(v)
    end
    hash.stringify_keys!
  end
end
