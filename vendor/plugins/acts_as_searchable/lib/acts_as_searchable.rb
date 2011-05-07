module Ironmine
  module Acts
    module Searchable
      def self.included(base)
        base.extend ClassMethods
      end
      SEARCHABLE_ENTITY = {}

      module ClassMethods
        # acts_as_searchable
        def acts_as_searchable(options = {})
          return if self.included_modules.include?(Ironmine::Acts::Searchable::InstanceMethods)
          default_options = { :direct =>nil,
                              :all=>"search",
                              :view => "#{self.name.pluralize.underscore}/search",
                              :show_url  => {:controller=>self.name.pluralize.underscore,:action=>"show",:id=>:id}
                             }
          # 多语言配置项
          cattr_accessor :searchable_options
          self.searchable_options = default_options.merge(options)
          send :include, Ironmine::Acts::Searchable::InstanceMethods

        end
      end

      module InstanceMethods
        def self.included(base)
          base.extend ClassMethods
        end


        def searchable_show_url_options
          url_options = searchable_options[:show_url]
          url_options.each do |key,value|
            url_options[key] = self.send(value) if value.is_a?(Symbol)&&self.respond_to?(value)
          end
          url_options
        end


        module ClassMethods

        end
      end
    end
  end
end