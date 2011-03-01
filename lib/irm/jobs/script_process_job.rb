module Irm
  module Jobs
    class ScriptProcessJob<Struct.new(:event_id)
      def perform
        # 查找需要处理的事件
        event = Irm::Event.find(event_id)
        # 确认事件是否已经被处理过
        if(event&&event.end_at.nil?)
          # 找到处理事件的脚本
          scripts = Irm::Script.enabled.query_by_condition_code(event.event_code)
          # 多个脚本依次执行
          scripts.each do |script|
            # 找到当前脚本需要执行的动作
            action = Irm::Action.query_by_action_code(script.action_code).first
            # 调用动作处理器处理事件
            execute_action = "::#{action.handler}".constantize.new
            execute_action.perform(event,script)
          end
          event.end_at=Time.now
          event.save
        end
      end
    end
  end
end