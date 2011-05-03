# ActsAsWatchable
module Ironmine
  module Acts
    module RecentlyObjects
      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        def acts_as_recently_objects(options = {})
          return if self.included_modules.include?(Ironmine::Acts::RecentlyObjects::InstanceMethods)
          send :include, Ironmine::Acts::RecentlyObjects::InstanceMethods

          default_options = { :controller => self.class.name,
                              :action=> "show",
                              :id => "self.id",
                              :title => ""
                             }

          cattr_accessor :target_controller,:target_action, :target_id, :show_title, :object_options
          self.object_options = default_options.merge(options)

          self.target_controller = object_options[:controller]
          self.target_action = object_options[:action]
          self.target_id = object_options[:id]
          self.show_title = object_options[:title]

          class_eval do
            after_save :save_as_recently
          end

          send :include, Ironmine::Acts::RecentlyObjects::InstanceMethods
        end
      end

      module InstanceMethods
        def self.included(base)
          base.extend ClassMethods
        end

        def save_as_recently
          if !last_same?
            ro = Irm::RecentlyObject.new(:source_type => self.class.name, :source_id => eval(self.target_id))
            ro.save
          end
        end

        def recently_object_name
          eval(self.show_title)
        end

        def recently_object_url
          url_for(:controller => self.target_controller, :action => self.target_action, :id => eval(self.target_id))
        end

        private
        def last_same?
          ro = Irm::RecentlyObject.all.last()
          if(ro.source_type == self.class.name) && (ro.source_id == eval(self.target_id))
            true
          else
            false
          end
        end

        module ClassMethods

        end
      end
    end
  end
end