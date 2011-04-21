# -*- coding: utf-8 -*-
module Irm::FiltersHelper
  def available_view_column(source_code)
    view_filter_columns(source_code)
  end

  def available_view_operator
    view_filter_operators("common")
  end
  # 在原来options加入请选择
  def nullable_collection_options(collection,key,meaning,current_value)
    nulloptions = content_tag(:option,"--- #{t(:actionview_instancetag_blank_option)} ---",{:value=>""})
    nulloptions.safe_concat(options_from_collection_for_select(collection,key,meaning,current_value))
  end
  # 在原来options加入请选择
  def nullable_options_for_select(collection,current_value)
    nulloptions = content_tag(:option,"--- #{t(:actionview_instancetag_blank_option)} ---",{:value=>""})
    nulloptions.safe_concat(options_for_select(collection,current_value))
  end



  def view_filter(source_code,bo_code,datatable_id)
    render :partial=>"irm/filters/view_filter",:locals=>{:source_code=>source_code,:bo_code=>bo_code,:datatable_id=>datatable_id}
  end


  def available_view_filter(source_code)
    filters = view_filters(source_code)
    current = filters.detect{|f| f.id.to_s.eql?(session[:_view_filter_id].to_s)}
    # 取得我的默认选项
    current = filters.detect{|f| f.default_flag.eql?(Irm::Constant::SYS_YES)&&f.own_id.eql?(Irm::Person.current.id)} unless current
    # 如果我的默认选项不存在，则使用全局默认选项
    current = filters.detect{|f| f.default_flag.eql?(Irm::Constant::SYS_YES)} unless current
    current ||= {:id=>nil}
    options_from_collection_for_select(filters,:id,:filter_name,current[:id])
  end

  def view_filter_script(datatable_id)
    script = %Q(
      GY.use("irm",function(Y){
        Y.on("domready",function(){
          Y.irm.ViewFilter('#{datatable_id}ViewFilterOverview');
        });
      });)
    javascript_tag(script)
  end

  def back_url
    url_for(params)
  end

  def render_exists_operator_and_value(bo_code,object_attribute_name,form)
    oa = Irm::ObjectAttribute.where(:business_object_code=>bo_code,:attribute_name=>object_attribute_name).first
    render_operator_and_value(oa,form)
  end

  def render_operator_and_value(object_attribute,form)
    return render_nil_object_attribute(form) unless object_attribute
    data_type = object_attribute.data_type
    lov_code = object_attribute.lov_code
    operators = view_filter_operators(object_attribute.data_type)

    operator_tag = form.select(:operator_code,operators, :required=>true,:size=>10)
    operator_tag = content_tag(:div,operator_tag,{:style=>"width:40%;float:left;"},false)

    value_tag = ""

    if lov_code.present?
      value_tag = form.lov_field(:filter_value,lov_code,{:id=>"filter_value_#{form.object.seq_num}",:label_required=>true})
    else
      value_tag = form.text_field :filter_value,:size=>30
    end
    value_tag = content_tag(:div,value_tag,{:style=>"width:50%;float:left;"},false)
    (operator_tag + value_tag).html_safe
  end

  private
  def view_filter_columns(bo_code)
    Irm::ObjectAttribute.selectable_column.query_by_status_code("ENABLED").multilingual.where(:business_object_code=>bo_code).collect{|i|[i[:name],i.attribute_name,{:attribute_id=>i.id}]}
  end

  def view_filters(source_code)
    Irm::RuleFilter.hold.query_by_source_code(source_code)
  end

  def view_filter_operators(data_type)
    operators = [{:lookup_code=>"E",:meaning=>"等于"},
                 {:lookup_code=>"N",:meaning=>"不等于"},
                 {:lookup_code=>"L",:meaning=>"小于"},
                 {:lookup_code=>"G",:meaning=>"大于"},
                 {:lookup_code=>"M",:meaning=>"小于或等于"},
                 {:lookup_code=>"H",:meaning=>"大于或等于"},
                 {:lookup_code=>"NIL",:meaning=>"等于空值"},
                 {:lookup_code=>"NNIL",:meaning=>"不等于空值"},
                 {:lookup_code=>"BW",:meaning=>"起始字符"},
                 {:lookup_code=>"EW",:meaning=>"结束字符"},
                 {:lookup_code=>"U",:meaning=>"包括"},
                 {:lookup_code=>"X",:meaning=>"不包括"},
                 {:lookup_code=>"IN",:meaning=>"(日期)N天内"}]
    available_ops = (Irm::RuleFilterCriterion::OPERATORS[data_type.to_sym]+Irm::RuleFilterCriterion::OPERATORS[:common]).uniq
    operators.collect{|o| [o[:meaning],o[:lookup_code]] if available_ops.include?(o[:lookup_code])}.compact
  end

  def render_nil_object_attribute(form)
    operators = view_filter_operators(:common)
    operator_tag = form.blank_select(:operator_code,operators, :required=>true,:size=>10)
    operator_tag = content_tag(:div,operator_tag,{:style=>"width:40%;float:left;"},false)
    value_tag = ""
    value_tag = form.text_field :filter_value,:size=>30
    value_tag = content_tag(:div,value_tag,{:style=>"width:50%;float:left;"},false)
    (operator_tag + value_tag).html_safe
  end

end
