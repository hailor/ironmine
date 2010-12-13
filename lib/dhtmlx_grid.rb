module DhtmlxgridJson
  include ActionView::Helpers::JavaScriptHelper
   def to_dhtmlxgrid_json(attributes,total)
    json = ""
    if total > 0
      json << %Q({rows:[)
      each do |elem|
        elem.id ||= index(elem)
        json << %Q({id:"#{elem.id}",data:[)
        couples = elem.attributes.symbolize_keys
        attributes.each do |atr|
          if atr.is_a? Hash
            value = get_atr_value(elem, atr[:value], couples)
            value = escape_javascript(value) if value and value.is_a? String
            if atr[:value].to_s=='M'
              value='/images/multilingual.png'
            end
            json << %Q("#{value}^#{Rails.application.routes.url_helpers.url_for :only_path => true, :controller => atr[:controller], :action => atr[:action], atr[:id].to_sym => elem[atr[:id].to_sym]}^#{atr[:action_type]}#{('^' + atr[:script]) if atr[:script]}#{('^' + atr[:view_port] )if atr[:view_port]}",)
          else
            value = get_atr_value(elem, atr, couples)
            value = escape_javascript(value) if value and value.is_a? String
            if atr.to_s=='M'
              value='/images/multilingual.png'
            end
            json << %Q("#{value}",)
          end
        end
        json.chop! << "]},"
      end
      json.chop! << "]}"
    else
      json << "}"
    end
    puts 'sdfsadf='+json
    json
  end

  private

  def get_atr_value(elem, atr, couples)
    if atr.to_s.include?('.')
      value = get_nested_atr_value(elem, atr.to_s.split('.').reverse)
    else
      value = couples[atr]
      value = elem.send(atr.to_sym) if value.blank? && elem.respond_to?(atr) # Required for virtual attributes
    end
    value
  end

  def get_nested_atr_value(elem, hierarchy)
    return nil if hierarchy.size == 0
    atr = hierarchy.pop
    raise ArgumentError, "#{atr} doesn't exist on #{elem.inspect}" unless elem.respond_to?(atr)
    nested_elem = elem.send(atr)
    return "" if nested_elem.nil?
    value = get_nested_atr_value(nested_elem, hierarchy)
    value.nil? ? nested_elem : value
  end
end