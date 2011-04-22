module Irm::ListOfValuesHelper
  def lov_field_tag(name,lov_code,options={})
    lov = Irm::ListOfValue.multilingual.where(:lov_code=>lov_code).first
    if lov.listable_flag.eql?(Irm::Constant::SYS_YES)
      lov_as_select(name,lov,options)
    else
      lov_as_autocomplete(name,lov,options)
    end
  end

  private
  def lov_as_select(name,lov,options)
    values = []
    values = eval(lov.generate_scope).collect{|v| [v[:show_value],v[:id_value],v.attributes]} if lov
    blank_select_tag(name,values,options)
  end

  def lov_as_autocomplete(name,lov,options)
    input_node_id =  options.delete(:id)||name
    value = options.delete(:value)
    label_value = options.delete(:label_value)
    hidden_tag_str = hidden_field_tag(name,value,{:id=>input_node_id})
    if value.present?
      if options.delete(:label_required)
        label_value = "REQUIRED"
      else
        label_value = value
      end
    end
    label_tag_str = text_field_tag("#{name}Label",label_value,options.merge(:id=>"#{input_node_id}Label"))

    columns = []
    columns <<{:key=>"id_value",:hidden=>true,:return_to=>"##{input_node_id}"}
    columns <<{:key=>"show_value",:label=>lov[:value_title],:width=>lov.value_column_width}
    columns <<{:key=>"desc_value",:label=>lov[:desc_title],:width=>lov.desc_column_width} if lov.desc_column.present?

    unless lov.addition_column.strip.blank?||lov.addition_column.nil?
      acs =   lov.addition_column.split("#")
      acws = lov.addition_column_width.split("#")
      acts = lov[:addition_title].split("#")
    end
    acs.each_with_index do |column,index|
      columns <<{:key=>column,:label=>acts[index],:width=>acws[index]}
    end if acs

    script = autocomplete("#{input_node_id}Label",url_for(:controller=>"irm/list_of_values",:action=>"get_lov_data",:id=>lov.id),columns)
    (hidden_tag_str+label_tag_str+script).html_safe
  end

end
