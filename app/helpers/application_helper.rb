module ApplicationHelper
  #显示form提交的出错信息
  def error_message_for(*args)
    lis=""
    error_count = 0
    full_messages = []
    args.each do |instance|
       if instance.errors&&instance.errors.any?
          instance.errors.each do | attr,msg|
            full_messages<<t(("label_#{instance.class.name.underscore.gsub(/\//, "_")}_" + attr.to_s.gsub(/\_id$/, "")).to_sym)+" #{msg}"
          end
          error_count+=instance.errors.count
       end
    end
    full_messages.each do |msg|
     lis<<content_tag(:li,msg,nil,false)
    end
    uls=content_tag(:ul,lis,nil,false)
    h2s=content_tag(:h2,t(:label_errors),nil,false)
    if error_count>0
#    content_tag(:div,"#{h2s}\n#{uls}",{:id=>"errorexplanation",:class=>"errorexplanation"},false)
      content_tag("script", raw("alert('123');$('#sysmsgbox').html('<div>#{h2s}\n#{uls}</div>');"))
    else
      nil
    end
  end
  
end
