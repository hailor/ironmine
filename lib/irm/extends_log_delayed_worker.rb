 module Irm::ExtendsLogDelayedWorker
  def self.included(base)
    base.class_eval do
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
    end
  end
  end