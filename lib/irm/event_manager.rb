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
      required_fields = context_fields.collect{|i| i.field_key.to_s}
      # 取得参event的参数
      params = event_options[:params]
      # 将参数的key全部转化为symbolize
      recursive_symbolize_keys(params)
      # 检查context中需要的参数是否缺失
      missed_keys =  required_fields.collect{|f| f if !recursive_include?(params,f)}.compact
      raise(ArgumentError, "Missing context keys: #{missed_keys.to_json}") if missed_keys.length>0
      # 发布事件
      event = ::Irm::Event.new(event_options)
      event.save
      event.reload
      # 加入事件处理器到队列中
      Delayed::Job.enqueue(Irm::Jobs::ScriptProcessJob.new(event.id))
    end
    private
    def recursive_symbolize_keys(hash)
      return unless hash.is_a?(Hash)
      hash.values.each do |v|
        next unless v.is_a?(Hash)
        recursive_symbolize_keys(v)
      end
      hash.symbolize_keys!
    end
    # 循环判断是否包含key
    # {:person=>{:id=>1,:name=>"xxx"}} 包含person,person.id,person.name
    def recursive_include?(hash,key)
      return false unless hash.is_a?(Hash)
      if !key.include?(".")
        hash.keys.include?(key.to_sym)
      else
        keys = key.split(".")
        tmp_hash = hash.dup
        keys.each do |k|
          return false unless tmp_hash.keys.include?(k.to_sym)
          tmp_hash = tmp_hash[k.to_sym]
        end
        true
      end
    end
  end
end