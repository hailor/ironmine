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
                              :id => "self.id"
                             }

          cattr_accessor :target_controller,:target_action, :target_id

          self.target_controller = default_options[:controller]
          self.target_action = default_options[:action]
          self.target_id = default_options[:id]

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
          ro = Irm::RecentlyObject.new(:source_type => self.class.name, :source_id => eval(self.target_id))
          ro.save
        end

        module ClassMethods

        end
      end
    end
  end
end