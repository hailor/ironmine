# -*- coding: utf-8 -*-
module Irm::FiltersHelper
  def available_view_column(filter_type,current_vale=nil)
    nullable_options_for_select(view_filter_columns(filter_type),current_vale)
  end

  def available_view_operator(current_vale=nil)
    nullable_options_for_select(view_filter_operators,current_vale)
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



  def view_filter(filter_type,datatable_id)
    render :partial=>"irm/filters/view_filter",:locals=>{:filter_type=>filter_type,:datatable_id=>datatable_id}
  end


  def available_view_filter(filter_type)
    filters = view_filters(filter_type)
    current = filters.detect{|f| f.id.to_s.eql?(session[:_view_filter_id].to_s)}
    puts "==============#{filters.collect{|f| f.id}}=======#{session[:_view_filter_id]}======="
    # 取得我的默认选项
    current = filters.detect{|f| f.default_flag.eql?(Irm::Constant::SYS_YES)&&f.own_id.eql?(Irm::Identity.current.id)} unless current
    # 如果我的默认选项不存在，则使用全局默认选项
    current = filters.detect{|f| f.default_flag.eql?(Irm::Constant::SYS_YES)} unless current
    current ||= {:id=>nil}
    options_from_collection_for_select(filters,:id,:view_name,current[:id])
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

  private
  def view_filter_columns(filter_type)
    Irm::ViewColumn.query_by_filter_type(filter_type).multilingual.enabled.collect{|v| [v[:name],v[:column_code]]}
  end

  def view_filters(filter_type)
    Irm::ViewFilter.hold.query_by_filter_type(filter_type)
  end

  def view_filter_operators
    operators = [{:lookup_code=>"E",:meaning=>"等于"},
                 {:lookup_code=>"N",:meaning=>"不等于"},
                 {:lookup_code=>"L",:meaning=>"小于"},
                 {:lookup_code=>"G",:meaning=>"大于"},
                 {:lookup_code=>"M",:meaning=>"小于或等于"},
                 {:lookup_code=>"H",:meaning=>"大于或等于"},
                 {:lookup_code=>"BW",:meaning=>"起始字符"},
                 {:lookup_code=>"EW",:meaning=>"结束字符"},
                 {:lookup_code=>"U",:meaning=>"包括"},
                 {:lookup_code=>"X",:meaning=>"不包括"},
                 {:lookup_code=>"IN",:meaning=>"(日期)N天内"}]
    operators.collect{|o| [o[:meaning],o[:lookup_code]]}
  end

end
