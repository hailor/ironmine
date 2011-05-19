module Irm::EventGenerator
  def self.included(base)
    base.class_eval do
      after_create {generate_event("CREATE")}
      after_update {generate_event("UPDATE")}
      def generate_event(event_type)
        Irm::EventManager.publish_bo(self.class.name,self.id,event_type)
      end
    end
  end
end
