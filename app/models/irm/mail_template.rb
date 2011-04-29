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

  validates_presence_of :context_code,:template_code,:from
  validates_uniqueness_of :template_code, :if => Proc.new { |i| !i.template_code.blank? }
  validates_format_of :template_code, :with => /^[A-Z0-9_]*$/ ,:if=>Proc.new{|i| !i.template_code.blank?}

  scope :query_by_template_code,lambda{|template_code| where("template_code =?",template_code)}

  scope :with_context,lambda{|language|
    joins("LEFT OUTER JOIN #{Irm::ScriptContext.view_name}  ON  #{Irm::ScriptContext.view_name}.context_code = #{table_name}.context_code AND  #{Irm::ScriptContext.view_name}.language = '#{language}'").
    select("#{Irm::ScriptContext.view_name}.id context_id,#{Irm::ScriptContext.view_name}.name context_name,#{Irm::ScriptContext.view_name}.description context_description")
  }

  #扩展查询方法
  query_extend


  scope :current_language ,lambda{|language| select("#{Irm::MailTemplate.table_name}.*,#{Irm::MailTemplatesTl.table_name}.subject").
                                            joins(:mail_templates_tls).
                                            where("#{Irm::MailTemplatesTl.table_name}.language=?",language)}

  scope :select_all,lambda{select("#{table_name}.*")}

  scope :query_by_condition_code,lambda{|condition_code|
    joins("JOIN #{Irm::Condition.table_name} ON #{Irm::Condition.table_name}.context_code = #{table_name}.context_code ").
    where("#{Irm::Condition.table_name}.condition_code = ?",condition_code)
  }

  def self.list_all
    select_all.multilingual.with_context(I18n.locale).status_meaning
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

  #
  # 发送邮件
  # email_adress 表示收件人地址
  # language_code 发送邮件选择的语言
  # options 邮件模板使用的参数
  # mail_options 发送邮件方法mail的参数，可以从外面传入
  #
  def deliver_to(params,mail_options={})
    # 将所有symbol的key转化为string类型
    recursive_stringify_keys(params)
    params_dup = params.dup
    to_people = Irm::Person.query_by_ids(params_dup["to_person_ids"])
    to_people.each do |p|
      next unless Irm::Constant::SYS_YES.eql?(p.notification_flag)
      email_template  = self.class.query_by_language(p.language_code).find(self.id)
      TemplateMailer.email_template(p.email_address, email_template, params_dup,mail_options).deliver
    end
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

  def recursive_stringify_keys(hash)
    return unless hash.is_a?(Hash)
    hash.values.each do |v|
      next unless v.is_a?(Hash)
      recursive_stringify_keys(v)
    end
    hash.stringify_keys!
  end
end
