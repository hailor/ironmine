# ActsAsEvent
module Ironmine
  module Acts
    module Event
      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        # acts_as_searchable
        def acts_as_event(options = {})
          return if self.included_modules.include?(Ironmine::Acts::Event::InstanceMethods)
          class_eval do
            after_create {generate_event("CREATE")}
            after_update {generate_event("UPDATE")}
          end
          send :include, Ironmine::Acts::Event::InstanceMethods
        end
      end

      module InstanceMethods
        def self.included(base)
          base.extend ClassMethods
        end



        def generate_event(event_type)
          Irm::EventManager.publish_bo(self.class.name,self.id,event_type)
        end


        module ClassMethods

        end
      end
    end
  end
end
