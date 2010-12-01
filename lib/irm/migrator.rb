module Irm::Migrator
  class Base < ActiveRecord::Migrator
    def migrate
      current = migrations.detect { |m| m.version == current_version }
      target = migrations.detect { |m| m.version == @target_version }
      # 如果在回滚时，出现不存在target的时侯，以第一个小于@target_version的为准
      if(down? && @target_version && target.nil? && @target_version.to_s.length == 14)
        target = migrations.detect{|m| m.version < @target_version.to_i}
      end
      
      if target.nil? && !@target_version.nil? && @target_version > 0
        raise ActiveRecord::UnknownMigrationVersionError.new(@target_version)
      end

      start = up? ? 0 : (migrations.index(current) || 0)
      finish = migrations.index(target) || migrations.size - 1
      runnable = migrations[start..finish]

      # skip the last migration if we're headed down, but not ALL the way down
      runnable.pop if down? && !target.nil?

      runnable.each do |migration|
        ActiveRecord::Base.logger.info "Migrating to #{migration.name} (#{migration.version})" if ActiveRecord::Base.logger

        # On our way up, we skip migrating the ones we've already migrated
        next if up? && migrated.include?(migration.version.to_i)

        # On our way down, we skip reverting the ones we've never migrated
        if down? && !migrated.include?(migration.version.to_i)
          migration.announce 'never migrated, skipping'; migration.write
          next
        end

        begin
          ddl_transaction do
            migration.migrate(@direction)
            record_version_state_after_migrating(migration.version)
          end
        rescue => e
          canceled_msg = ActiveRecord::Base.connection.supports_ddl_transactions? ? "this and " : ""
          raise StandardError, "An error has occurred, #{canceled_msg}all later migrations canceled:\n\n#{e}", e.backtrace
        end
      end
    end

    private
    #在ironmine中的migrator中需要初始化数据，因此不管数据库支不支持ddl_transaction都加入事务处理
    # Wrap the migration in a transaction only if supported by the adapter.
    def ddl_transaction(&block)
        #if Base.connection.supports_ddl_transactions?
          ActiveRecord::Base.transaction { block.call }
        #else
        #  block.call
       #end
    end

  end
  class TableMigrator< Base

  end

end