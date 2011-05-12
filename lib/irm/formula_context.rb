class Irm::FormulaContext
  attr_accessor :bo
  def validate(formula)
    text = ""
    value = nil
    begin
      value = self.instance_eval(formula)
      rescue StandardError,SyntaxError=>text
          info = text
    end
    [text,nil]
  end

  private
  def TODAY
    Time.now
  end

  def CURRENT_PERSON
    Irm::Person.current.id
  end

  def ABS(value)
    value
  end

  def TO_DATE(date_string)
    Date.parse(date_string)
  end
end