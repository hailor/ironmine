class Irm::ViewFilter < ActiveRecord::Base
  set_table_name :irm_view_filters

  has_many :view_filter_criterions,:foreign_key=>"view_code",:primary_key => "view_code"
  accepts_nested_attributes_for :view_filter_criterions
  # 验证规则
  validates_presence_of :filter_type,:view_name,:view_code
  validates_uniqueness_of :view_code,:scope=>[:filter_type], :if => Proc.new { |i| !i.filter_type.blank?&&!i.view_code.blank? }
  validates_uniqueness_of :view_name,:scope=>[:filter_type], :if => Proc.new { |i| !i.filter_type.blank?&&!i.view_name.blank? }
  validates_presence_of :raw_condition_clause,:if=> Proc.new{|i| i.view_filter_criterions.detect{|fc| fc.column_code&&!fc.column_code.blank?}}
  validate :validate_raw_condition_clause,:if=> Proc.new{|i| !i.raw_condition_clause.blank?}

  before_save :set_condition

  #加入activerecord的通用方法和scope
  query_extend

  scope :query_by_filter_type,lambda{|filter_type| where(:filter_type=>filter_type)}

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
      unless self.view_filter_criterions.detect{|fc| fc.column_code&&!fc.column_code.blank?&&fc.seq_num == sq.to_i}
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
    view_filter_criterions.each{|fc| conditions.merge!(fc.seq_num=>fc.to_condition) if fc.column_code&&!fc.column_code.blank?}
    seq_nums = self.raw_condition_clause.scan(/\d+/)
    clause = self.raw_condition_clause.dup
    seq_nums.each do |sq|
      clause.gsub!(sq,conditions[sq.to_i])
    end
    clause

  end

end
