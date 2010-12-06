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
          label_for_field(field, options) + super(field,options.merge!({:required=>true}))
        else
          label_for_field(field, options) + super
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
      label_for_field(field, options) + super
    end

  end

  def lov_field(field, options = {}, html_options = {})
    lov_code = options.delete(:lov_code)
    meaning = options.delete(:meaning)
    value =   options.delete(:value)
    if options.delete(:normal)
      lov_tag(field,lov_code,value||@object[field],meaning,options)
    else
      label_for_field(field, options) + lov_tag(field,lov_code,value||@object[field],meaning,options)
    end

  end
  
  def check_box(method, options = {}, checked_value = "Y", unchecked_value = "N")
    if options.delete(:normal)
      return @template.check_box(@object_name, method, objectify_options(options), checked_value, unchecked_value)
    else
      return label_for_field(method, options) +@template.check_box(@object_name, method, objectify_options(options), checked_value, unchecked_value)
    end
  end
  
  # Returns a label tag for the given field
  def label_for_field(field, options = {})

      text = options[:label].is_a?(Symbol) ? ::I18n.t(options[:label]) : options[:label]
      text ||= ::I18n.t(("label_#{@object_name.to_s}_" + field.to_s.gsub(/\_id$/, "")).to_sym)
      text += @template.content_tag("span", " *", :class => "required") if options.delete(:required)
      @template.content_tag("label", text,
                                    {:class => (@object && @object.errors[field] ? "error" : nil),
                                     :for => (@object_name.to_s + "_" + field.to_s)},false)
  end

  private

  def lov_tag(name,lov_code="MY_TEST",value=nil,meaning=nil,options={})
    content =""
    #生成显示文档框
    lov_input = @template.text_field_tag("#{name}_meaning",meaning,options.merge({:class=>"lov-input",:lov=>true,:readonly=>true}))
    #生成隐藏文档框
    lov_hidden = @template.hidden_field_tag("#{@object_name}[#{name}]",value,:id=>name)
    link_options = {}
    if(options[:multi_selection])
      link_options.merge!(:multi_selection=>options[:multi_selection])
    end
    url_options = {}
    if(options[:url_options])
      url_options = options.delete(:url_options)
    end
    #取得lov相关信息
    #创建popup关联的link,并调用javascript取得要在popup div中显的页面
    find_link = @template.link_to("",{:controller=> "irm/lovs",:action=>"lov_win",:code=>lov_code,:lov_name=>name}.merge(url_options),{:class=>"lov-find",:id=>"#{name}_lov_link","data-remote".to_sym=>true}.merge(link_options),false)
    clear_link = @template.link_to("","#",{:class=>"lov-clear",:input_ref=>name},false)
    content<<@template.content_tag(:span,lov_input+lov_hidden+find_link+clear_link,{:class=>"lov-container"})
    #直接将div输出在页面上，在使用ajax提交form时会出现错误，因此在添加lov前判断div在页面中是否已经存在，如果存在则不添加
    div=@template.content_tag(:div,"#{name}_lov_window",{:style=>"display:none",:lov=>true,:id=>"#{name}_lov_window",:title=>options[:title]||"LOV"})
    content<< @template.javascript_tag(" if($('##{name}_lov_window').length<1){$('body').append('#{div}');}")
    content.html_safe
  end
  
end