# 新增加覆盖原来task的方法
Rake::TaskManager.class_eval do
  def alias_task(old_name, new_name)
    @tasks[new_name] = @tasks.delete(old_name)
  end
end
Rake.application.alias_task("db:migrate", "db:migrate_original")

namespace :db do
  desc "(For Ironmine)Migrate the database (options: VERSION=x, VERBOSE=false,PRODUCT=sr)."
  task :migrate => :environment do
    ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
    product_path = ENV["PRODUCT"] ? "/#{ENV['PRODUCT']}" : "/*"
    data_table_path = ENV["TABLE"] ? "db/migrate#{product}":"db/*#{product}"
    Irm::Migrator::TableMigrator.migrate(data_table_path, ENV["VERSION"] ? ENV["VERSION"].to_i : nil)
    Rake::Task["db:schema:dump"].invoke if ActiveRecord::Base.schema_format == :ruby
  end
end