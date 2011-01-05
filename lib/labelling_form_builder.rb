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
    if !options.delete(:normal)
      super
    else
      label_for_field(field, options) + super
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
  
end