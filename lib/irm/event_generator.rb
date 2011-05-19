module Irm::EventGenerator
  def self.included(base)
    base.class_eval do
      attr_accessor :ignore_event
      after_create {generate_event("CREATE")}
      after_update {generate_event("UPDATE")}
      def generate_event(event_type)
        Irm::EventManager.publish_bo(self.class.name,self.id,event_type) unless self.ignore_event
      end
    end
  end
end
