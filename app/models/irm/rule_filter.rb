class Irm::RuleFilter < ActiveRecord::Base
  set_table_name :irm_rule_filters

  has_many :rule_filter_criterions
  accepts_nested_attributes_for :rule_filter_criterions

  belongs_to :business_object,:foreign_key=>:bo_code,:primary_key=>:business_object_code

  # 验证规则
  validates_presence_of :filter_type,:bo_code
  validates_presence_of :filter_name,:filter_code,:source_code,:own_id,:if => Proc.new {|i| i.filter_type.eql?("PAGE_FILTER")}
  validates_presence_of :source_type,:source_id,:if => Proc.new {|i| i.filter_type.eql?("RULE_FILTER")}
  validates_uniqueness_of :filter_code,:scope=>[:source_code], :if => Proc.new { |i| i.filter_type.eql?("PAGE_FILTER")&&!i.source_code.blank?&&!i.filter_code.blank? }
  validates_uniqueness_of :filter_name,:scope=>[:source_code], :if => Proc.new { |i| i.filter_type.eql?("PAGE_FILTER")&&!i.source_code.blank?&&!i.filter_name.blank? }
  validates_presence_of :raw_condition_clause,:if=> Proc.new{|i| i.rule_filter_criterions.detect{|fc| fc.attribute_name&&!fc.attribute_name.blank?}}
  validate :validate_raw_condition_clause,:if=> Proc.new{|i| !i.raw_condition_clause.blank?}

  before_save :set_condition

  #加入activerecord的通用方法和scope
  query_extend

  scope :query_by_source_code,lambda{|source_code| where(:filter_type=>"PAGE_FILTER",:source_code=>source_code)}

  scope :hold,lambda{
    where("#{table_name}.own_id = ? OR #{table_name}.restrict_visibility=?",Irm::Person.current.id,Irm::Constant::SYS_NO)
  }

  def where_clause
    where_conditon = self.condition_clause.dup
    params = where_conditon.scan(/\{\{\S*\}\}/)
    param_values = []
    params.each do |p|
      p.gsub!(/[\{\}]/,"")
      param_values << eval(p)
    end
    params
    where_conditon.gsub!(/\{\{\S*\}\}/,"?")
    where_conditon = ([where_conditon]+param_values).flatten
    where_conditon = where_conditon[0] unless where_conditon.length>1
    where_conditon
  end

  private
  # 检查查询条件
  def validate_raw_condition_clause
    # 检查行号
    seq_nums = self.raw_condition_clause.scan(/\d+/)
    seq_nums.each do |sq|
      unless self.rule_filter_criterions.detect{|fc| fc.attribute_name&&!fc.attribute_name.blank?&&fc.seq_num == sq.to_i}
        errors.add(:raw_condition_clause,I18n.t(:view_filter_use_invalid_seq_num)+":#{sq}")
        break
      end
    end
    # 检查关键字
    key_words = self.raw_condition_clause.scan(/[A-Z]+/)
    key_words.each do |kw|
      unless kw.eql?("AND")||kw.eql?("OR")
        errors.add(:raw_condition_clause,I18n.t(:view_filter_use_invalid_key_word)+":#{kw}")
        break
      end
    end
    # 检查and or 语法
    info = ""
    begin
      eval(self.raw_condition_clause.downcase)
    rescue StandardError,SyntaxError, NameError=>text
          info = text
    end
    unless info.blank?
      errors.add(:raw_condition_clause,I18n.t(:view_filter_use_invalid_syntax))
    end
  end

  def set_condition
    self.condition_clause = generate_condition
  end

  def generate_condition
    conditions = {}
    rule_filter_criterions.each{|fc| conditions.merge!(fc.seq_num=>fc.to_condition) if fc.attribute_name&&!fc.attribute_name.blank?}
    seq_nums = self.raw_condition_clause.scan(/\d+/)
    clause = self.raw_condition_clause.dup
    # 将数据换成带^符号的数字
    # 防止参数中出现数字出现替换错误
    seq_nums.each do |sq|
      clause.gsub!(sq,"^#{sq}")
    end
    seq_nums.each do |sq|
      clause.gsub!("^#{sq}",conditions[sq.to_i])
    end
    clause

  end
end
