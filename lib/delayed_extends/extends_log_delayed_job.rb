 module DelayedExtends::ExtendsLogDelayedJob

  def self.included(base)
    base.class_eval do
        after_save  :after_deal
         def after_deal
          if @recordBool == true
             @djr = Irm::DelayedJobRecord.new
             @djr.delayed_job_id = self.id
             @djr.priority = self.priority
             @djr.status = 0
             @djr.run_at = self.run_at
             @djr.run_by = "host:#{Socket.gethostname} pid:#{Process.pid}"
             @djr.handler = self.handler
             @djr.save
             @recordBool = false

          end
        end
        def payload_object=(value)
          @recordBool = true
          super value
        end
    end
  end

  end