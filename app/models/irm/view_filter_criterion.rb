class Irm::ViewFilterCriterion < ActiveRecord::Base
  set_table_name :irm_view_filter_criterions

  OPERATORS = {:common=>['E','N','L','G','M','H'],
               :string=>['BW','EW','U','X'],
               :date=>['IN'],
               :int=>[]
              }.freeze

  belongs_to :view_filter,:foreign_key=>"view_code",:primary_key => "view_code"

  # 验证规则
  #validates_presence_of :view_code,:column_code
  validates_presence_of :operator_code,:filter_value, :if => Proc.new { |i| !i.column_code.blank? }
  #validates_uniqueness_of :filter_type,:scope=>[:view_code], :if => Proc.new { |i| !i.filter_type.blank?&&!i.view_code.blank? }
  validate :validate_data_type_filter_value, :if => Proc.new { |i| !i.column_code.blank? }
  #加入activerecord的通用方法和scope
  query_extend

  def to_condition
    column = Irm::ViewColumn.query_by_filter_type(view_filter.filter_type).query_by_column_code(self.column_code).first
    operator_filter_value = parse_condition(column,self.operator_code,self.filter_value)|| "=#{column.table_name}.#{column.column_name}"
    "(#{column.table_name}.#{column.column_name} #{operator_filter_value})"
  end

  private
  def validate_data_type_filter_value
    column = Irm::ViewColumn.query_by_filter_type(view_filter.filter_type).query_by_column_code(self.column_code).first    
    operator = self.operator_code
    case column.column_data_type
      when 'int'
        validate_int(operator,filter_value)
      when 'date'
        validate_date(operator,filter_value)
      when 'string'
        validate_string(operator,filter_value)
    end
  end

  def validate_int(operator,filter_value)
    if filter_value.scan(/\D/).length>0
      errors.add(:filter_value,I18n.t('activerecord.errors.messages.invalid'))
    end
  end

  def validate_date(operator,filter_value)
    if "IN".eql?(operator)&&filter_value.scan(/\D/).length>0
      errors.add(:filter_value,I18n.t('activerecord.errors.messages.invalid'))
    elsif filter_value.scan(/[^\d\-]/).length>0
      errors.add(:filter_value,I18n.t('activerecord.errors.messages.invaliddate'))
    elsif "IN".eql?(operator)
      return
    else
      info = ""
      begin
        Date.parse(filter_value)
        rescue ArgumentError=>text
          info = text
      end
      unless info.blank?&&filter_value.length>8
        errors.add(:filter_value,I18n.t('activerecord.errors.messages.invaliddate'))
      end
    end

  end

  def validate_string(operator,filter_value)

  end

  def parse_condition(column,operator,filter_value)
    case column.column_data_type
      when 'int'
        parse_int_condition(operator,filter_value)
      when 'date'
        parse_date_condition(operator,filter_value)
      when 'string'
        parse_string_condition(operator,filter_value)
    end
  end

  def parse_string_condition(operator,filter_value)
    filter_value.strip!
    formated_filter_value = %Q('#{filter_value}')
    case
      when OPERATORS[:common].include?(operator)
        parse_common_condition(operator,formated_filter_value)
      when 'BW'.eql?(operator)
        "LIKE '#{filter_value}%'"
      when 'EW'.eql?(operator)
        "LIKE '%#{filter_value}'"
      when 'U'.eql?(operator)
        "LIKE '%#{filter_value}%'"
      when 'X'.eql?(operator)
        "NOT LIKE '%#{filter_value}%'" 
    end
  end

  def parse_date_condition(operator,filter_value)
    formated_filter_value = %Q({{Date.parse('#{filter_value}')}})
    case
      when OPERATORS[:common].include?(operator)
        parse_common_condition(operator,formated_filter_value)
      when 'IN'.eql?(operator)
        "> {{Date.today-#{filter_value}}}"
    end
  end

  def parse_int_condition(operator,filter_value)
    formated_filter_value = %Q({{#{filter_value.strip}}})
    case
      when OPERATORS[:common].include?(operator)
        parse_common_condition(operator,formated_filter_value)
    end    
  end

  def parse_common_condition(operator,filter_value)
    case operator
      when "E"
        "= #{filter_value}"
      when 'N'
        "!= #{filter_value}"
      when 'L'
        "< #{filter_value}"
      when 'G'
        "> #{filter_value}"
      when 'M'
        "<= #{filter_value}"
      when 'L'
        ">= #{filter_value}"
    end
  end

end
