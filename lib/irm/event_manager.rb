class Irm::EventManager
  class << self
    def publish(event_options)
      # 确认发布的事件，是否是系统内置的事件
      condition = Irm::Condition.query_by_condition_code(event_options[:event_code]).first
      raise(ArgumentError, "Unknown event code: #{event_options[:event_code]}") unless condition
      # 确认触发条件有效
      return unless condition.enabled?
      # 取得context的必须字段
      context_fields = Irm::ScriptContextField.query_by_context_code(condition.context_code)
      required_fields = context_fields.collect{|i| i.field_key.to_sym}
      # 取得参event的参数
      params = event_options[:params]
      # 将参数的key全部转化为symbolize
      params = params.symbolize_keys
      # 检查context中需要的参数是否缺失
      missed_keys =  required_fields.collect{|f| f if params.include?(f)}.compact
      raise(ArgumentError, "Missing context keys: #{missed_keys.to_json}") if missed_keys.length>0
      # 发布事件
      event = ::Irm::Event.new(event_options)
      event.save
      event.reload
      # 加入事件处理器到队列中
      Delayed::Job.enqueue(Irm::Jobs::ScriptProcessJob.new(event.id))
    end
  end
end