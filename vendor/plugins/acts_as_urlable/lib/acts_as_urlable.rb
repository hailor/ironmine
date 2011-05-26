# ActsAsUrlable
module Ironmine
  module Acts
    module Urlable
      def self.included(base)
        base.extend ClassMethods
      end


      module ClassMethods
        # acts_as_searchable
        def acts_as_urlable(options = {})
          return if self.included_modules.include?(Ironmine::Acts::Urlable::InstanceMethods)
          default_options = { :show  =>{:controller=>self.name.pluralize.underscore,:action=>"show",:id=>:id},
                              :edit  =>{:controller=>self.name.pluralize.underscore,:action=>"edit",:id=>:id},
                              :index =>{:controller=>self.name.pluralize.underscore,:action=>"index"},
                              :new   =>{:controller=>self.name.pluralize.underscore,:action=>"new"}
                              }
          # 多语言配置项
          cattr_accessor :urlable_options
          self.urlable_options = default_options.merge(options)
          send :include, Ironmine::Acts::Urlable::InstanceMethods

        end
      end

      module InstanceMethods
        def self.included(base)
          base.extend ClassMethods
        end


        def urlable_url_options(action)
          url_options = urlable_options[action.to_sym].dup
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
