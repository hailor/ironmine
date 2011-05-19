module Irm
  module Jobs
    class ActionProcessJob<Struct.new(:options)
      def perform
        bo_id = options[:bo_id]
        bo_code = options[:bo_code]
        bo = Irm::BusinessObject.where(:business_object_code => bo_code).first
        action_id = options[:action_id]
        action_type = options[:action_type]
        action =  action_type.constantize.find(action_id)
        bo_instance = eval(bo.generate_query(true)).where(:id=>bo_id).first
        action.perform(bo_instance) if bo_instance
      end
    end
  end
end