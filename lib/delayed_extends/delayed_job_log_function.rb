require 'active_record'
class Delayed::Backend::ActiveRecord::Job
   after_save  :after_deal
   module RecordLog
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

    include RecordLog
    #alias payload_object_ payload_object=
end

class Delayed::Worker

  alias run_ run
  alias reschedule_ reschedule

 # module RecordLog

    def run(job)
      runtime =  Benchmark.realtime do
        Timeout.timeout(self.class.max_run_time.to_i) { job.invoke_job }
        #-----------------------------------------
        @record = Irm::DelayedJobRecord.find_by_delayed_job_id job.id
        if @record != nil
          @record.end_at = Time.now
          @record.status = 1
          @record.save!
        end
        #-----------------------------------------
        job.destroy
      end
      say "#{job.name} completed after %.4f" % runtime
      return true  # did work
      rescue ::Delayed::DeserializationError => error
        job.last_error = "{#{error.message}\n#{error.backtrace.join('\n')}"
        failed(job)
      rescue Exception => error
        handle_failed_job(job, error)
        return false  # work failed
    end

    def  reschedule(job, time = nil)
      @item = Irm::DelayedJobRecordItem.new
      @item.attempt = job.attempts
      @item.pid = job.id
      @item.record_at = Time.now
      @item.error_info = job.last_error
      @item.save
      if (job.attempts += 1) < max_attempts(job)
        time ||= job.reschedule_at
        job.run_at = time
        job.unlock
        job.save!
      else
        say "PERMANENTLY removing #{job.name} because of #{job.attempts} consecutive failures.", Logger::INFO
        #----------------------------------------
        @record = Irm::DelayedJobRecord.find_by_delayed_job_id job.id
        if @record != nil
          @record.end_at = Time.now
          @record.status = 2
          @record.save!
        end
        #---------------------------------------
        failed(job)
      end
    end

 # end

  #include RecordLog

end