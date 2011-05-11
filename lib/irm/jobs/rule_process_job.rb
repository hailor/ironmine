module Irm
  module Jobs
    class RuleProcessJob<Struct.new(:event_id)
      def perform
        # 查找需要处理的事件
        event = Irm::Event.find(event_id)
        # 确认事件是否已经被处理过
        if(event&&event.end_at.nil?)
          Irm::Person.current = Irm::Person.find(event.created_by)
          Delayed::Worker.logger.debug("RuleProcessJob Process Event id:#{event.id}  bo_code:#{event.bo_code}")

          # 查找到所有适用的工作流规则
          wf_rules = []
          if event.event_type.eql?("CREATE")
            wf_rules = wf_rules+Irm::WfRule.enabled.where(:bo_code=>event.bo_code).create_edit_first_time.not_applied_before(event.business_object_id)
            wf_rules = wf_rules+Irm::WfRule.enabled.where(:bo_code=>event.bo_code).create_edit_every_time
            wf_rules = wf_rules+Irm::WfRule.enabled.where(:bo_code=>event.bo_code).only_create
          elsif event.event_type.eql?("UPDATE")
            wf_rules = wf_rules+Irm::WfRule.enabled.where(:bo_code=>event.bo_code).create_edit_first_time.not_applied_before(event.business_object_id)
            wf_rules = wf_rules+Irm::WfRule.enabled.where(:bo_code=>event.bo_code).create_edit_every_time
          end
          wf_rules.each do |wr|
            Delayed::Worker.logger.debug("RuleProcessJob Test wf_rule id:#{wr.id} ")

            business_object = wr.match(event)
            if business_object
              Delayed::Worker.logger.debug("RuleProcessJob  wf_rule id:#{wr.id} find bo:#{business_object}")
              wr.apply(business_object)
              Irm::WfRuleHistory.create(:event_id=>event.id,:rule_id=>wr.id,:bo_code=>wr.bo_code,:bo_id=>event.business_object_id)
            end
          end
          event.end_at=Time.now
          event.save
        end
      end
    end
  end
end