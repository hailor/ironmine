class Irm::FormulaContext
  attr_accessor :bo
  def validate(formula,data_type)
    formula = formula.upcase
    text = ""
    value = nil
    begin
      value = self.instance_eval(formula)
      rescue StandardError,SyntaxError=>text
          info = text
    end
    if text.present?
      return [text,nil]
    end
    case data_type
      when "varchar"
        unless value.nil?||value.is_a?(String)
          text = I18n.t('activerecord.errors.messages.invalid')
        end
      when "text"
        unless value.nil?||value.is_a?(String)
          text = I18n.t('activerecord.errors.messages.invalid')
        end
      when "datetime"
        unless value.nil?||value.is_a?(Time)||value.is_a?(Date)
          text = I18n.t('activerecord.errors.messages.invalid')
        end
      when "int"
        if value.to_s.scan(/\D/).length>0
          text = I18n.t('activerecord.errors.messages.invalid')
        end
    end
    [text,value]
  end

  private
  def TODAY
    Time.now.to_date
  end

  def CURRENTPERSON
    Irm::Person.current.id
  end

  def ABS(value)
    value
  end

  def DATEVALUE(date_string)
    Date.parse(date_string)
  end


  def NOW
    Time.now
  end
end