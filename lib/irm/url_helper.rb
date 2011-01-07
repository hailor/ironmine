module Irm
  module UrlHelper
    extend ActiveSupport::Concern
      #对link_to进行处理，加入链接的安全性验证，如果无权，则隐藏链接
      def link_to(*args, &block)
        if block_given?
          options      = args.first || {}
          html_options = args.second
          link_to(capture(&block), options, html_options)
        else
          name         = args[0]
          options      = args[1] || {}
          html_options = args[2]
          html_options = convert_options_to_data_attributes(options, html_options)
          if options.is_a?(Hash)
              options[:controller] ||= params[:controller]
              options[:action] ||= params[:action]              
              #扩展权限验证,当用户无权访问链接时,隐藏链接
              if(options[:controller]&&options[:action]&&!allow_to?(options))
                if(!html_options['show'])
                  if(html_options['style'])
                    html_options['style'] ="display:none;"+html_options['style']
                  else
                    html_options['style'] = "display:none;"
                  end
                end
                html_options[:not_allow] = true
              end
          end
          url = url_for(options)
          if html_options
            html_options = html_options.stringify_keys
            href = html_options['href']
            tag_options = tag_options(html_options)
          else
            tag_options = nil
          end
          href_attr = "href=\"#{url}\"" unless href
          if(html_options["not_allow"]&&html_options["show"])
            "<span #{tag_options}>#{ERB::Util.h(name || url)}</span>".html_safe
          else
            "<a #{href_attr}#{tag_options}>#{ERB::Util.h(name || url)}</a>".html_safe
          end
        end
      end

      def checked_url_for(options = {})
        options[:controller] ||= params[:controller]
        options[:action] ||= params[:action]
        if(options[:controller]&&options[:action]&&allow_to?(options))
          url_for(options)
        else
          "#"
        end
      end
  end
end