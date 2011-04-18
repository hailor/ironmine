module Irm::ListOfValuesHelper
  def lov_field_tag(name,lov_code,options={})
    lov = Irm::ListOfValue.where(:lov_code=>lov_code).first
    values = []
    values = eval(lov.generate_scope).collect{|v| [v[:desc_value],v[:value],v.attributes]} if lov
    blank_select_tag(name,values,options)
  end

end
