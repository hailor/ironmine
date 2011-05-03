class LabellingFormBuilder  < ActionView::Helpers::FormBuilder
  # 自动生成label
  (field_helpers - %w(radio_button hidden_field) + %w(date_select)).each do |selector|
    src = <<-END_SRC
    def #{selector}(field, options = {})
      if options.delete(:normal)
        if options[:required]
          super(field,options.merge!({:required=>true}))
        else
          super
        end
      else
        if options[:required]
          label_for_field(super(field,options.merge!({:required=>true})), options)
        else
          super
        end
      end
    end
    END_SRC
    class_eval src, __FILE__, __LINE__
  end

  def select(field, choices, options = {}, html_options = {})
    if options.delete(:normal)
      super
    else
      if html_options[:required]
        label_for_field(super(field,choices, options, html_options.merge!({:required=>true})), html_options)
      else
        super
      end
    end
  end


  def blank_select(field, choices, options = {}, html_options = {})
     options=(options||{}).merge({:include_blank=>"--- #{I18n.t(:actionview_instancetag_blank_option)} ---"})
     html_options =(html_options||{}).merge(:blank=> "--- #{I18n.t(:actionview_instancetag_blank_option)} ---")
     select(field, choices, options, html_options)
  end


  def lov_field(field, lov_code, options = {}, html_options = {})
    lov = Irm::ListOfValue.where(:lov_code=>lov_code).first
    if lov.listable_flag.eql?(Irm::Constant::SYS_YES)
      lov_as_select(field,lov,options,html_options)
    else
      lov_as_autocomplete(field,lov,options,html_options)
    end

  end



  
  def check_box(method, options = {}, checked_value = "Y", unchecked_value = "N")
    if !options.delete(:normal)
      return @template.check_box(@object_name, method, objectify_options(options), checked_value, unchecked_value)
    else
      return label_for_field(method, options) +@template.check_box(@object_name, method, objectify_options(options), checked_value, unchecked_value)
    end
  end
  
  # Returns a label tag for the given field
  def label_for_field(field, options = {})
      text = ""
      text += @template.content_tag("div", "", :class => "requiredBlock") if options.delete(:required)
      @template.content_tag("div", text + field,{:class => "requiredInput"}, false)


#      text = options[:label].is_a?(Symbol) ? ::I18n.t(options[:label]) : options[:label]
#      text ||= ::I18n.t(("label_#{@object_name.to_s}_" + field.to_s.gsub(/\_id$/, "")).to_sym)
#      text += @template.content_tag("span", " *", :class => "required") if options.delete(:required)
#      @template.content_tag("label", text,
#                                    {:class => (@object && @object.errors[field] ? "error" : nil),
#                                     :for => (@object_name.to_s + "_" + field.to_s)},false)
  end

  private
  def lov_as_select(field,lov,options,html_options)
    # TODO cascade select
    values = []
    values = eval(lov.generate_scope).collect{|v| [v[:show_value],v[:id_value],v.attributes]}
    blank_select(field,values,options,html_options)
  end

  def lov_as_autocomplete(field,lov,options,html_options)
    input_node_id =  options.delete(:id)||field
    value = object.send(field.to_sym)
    label_value = options.delete(:label_value)
    if value.present?&&!label_value.present?
      if options.delete(:label_required)
        label_value = lov.lov_value(value)
      else
        label_value = value
      end
    end
    hidden_tag_str = text_field(field,options.merge({:style=>"display:none;",:id=>input_node_id}))
    label_tag_str = @template.text_field_tag("#{input_node_id}Label",label_value,options.merge(:id=>"#{input_node_id}Label"))

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
      columns <<{:key=>columns,:label=>acts[index],:width=>acws[index]}
    end if acs

    script = @template.autocomplete("#{input_node_id}Label",@template.url_for(:controller=>"irm/list_of_values",:action=>"get_lov_data",:id=>lov.id),columns)
    (hidden_tag_str+label_tag_str+script).html_safe
  end

  
end