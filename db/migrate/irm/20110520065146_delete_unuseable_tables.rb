class DeleteUnuseableTables < ActiveRecord::Migration
  def self.up
    drop_table :irm_actions
    drop_table :irm_actions_tl
    execute('drop view irm_actions_vl')
    drop_table :irm_auth_sources
    drop_table :irm_conditions
    drop_table :irm_conditions_tl
    execute('drop view irm_conditions_vl')
    drop_table :irm_identities
    drop_table :irm_script_context_fields
    drop_table :irm_script_context_fields_tl
    execute('drop view irm_script_context_fields_vl')
    drop_table :irm_scripts
    drop_table :irm_scripts_tl
    execute('drop view irm_scripts_vl')
    drop_table :irm_view_filters
    drop_table :irm_view_filter_criterions
    drop_table :irm_view_columns
    drop_table :irm_view_columns_tl
    execute('drop view irm_view_columns_vl')
  end

  def self.down
    create_table "irm_view_filter_criterions", :force => true do |t|
      t.integer  "an_action_id"
    end
    create_table "irm_auth_sources", :force => true do |t|
      t.integer  "an_action_id"
    end
    create_table "irm_view_filters", :force => true do |t|
      t.integer  "an_action_id"
    end
    create_table "irm_identities", :force => true do |t|
      t.integer  "an_action_id"
    end
    create_table "irm_actions", :force => true do |t|
      t.integer  "an_action_id"
    end

    create_table "irm_actions_tl", :force => true do |t|
      t.integer  "action_id"
    end

    execute('CREATE OR REPLACE VIEW irm_actions_vl AS SELECT t.*,tl.*
                                             FROM irm_conditions t,irm_actions_tl tl
                                             WHERE t.an_action_id = tl.action_id')
    create_table "irm_conditions", :force => true do |t|
      t.integer  "an_action_id"
    end

    create_table "irm_conditions_tl", :force => true do |t|
      t.integer  "action_id"
    end

    execute('CREATE OR REPLACE VIEW irm_conditions_vl AS SELECT t.*,tl.*
                                             FROM irm_conditions t,irm_conditions_tl tl
                                             WHERE t.an_action_id = tl.action_id')

    create_table "irm_script_context_fields", :force => true do |t|
      t.integer  "an_action_id"
    end

    create_table "irm_script_context_fields_tl", :force => true do |t|
      t.integer  "action_id"
    end

    execute('CREATE OR REPLACE VIEW irm_script_context_fields_vl AS SELECT t.*,tl.*
                                             FROM irm_script_context_fields t,irm_script_context_fields_tl tl
                                             WHERE t.an_action_id = tl.action_id')
    create_table "irm_scripts", :force => true do |t|
      t.integer  "an_action_id"
    end

    create_table "irm_scripts_tl", :force => true do |t|
      t.integer  "action_id"
    end

    execute('CREATE OR REPLACE VIEW irm_scripts_vl AS SELECT t.*,tl.*
                                             FROM irm_scripts t,irm_scripts_tl tl
                                             WHERE t.an_action_id = tl.action_id')
    create_table "irm_view_columns", :force => true do |t|
      t.integer  "an_action_id"
    end

    create_table "irm_view_columns_tl", :force => true do |t|
      t.integer  "action_id"
    end

    execute('CREATE OR REPLACE VIEW irm_view_columns_vl AS SELECT t.*,tl.*
                                             FROM irm_view_columns t,irm_view_columns_tl tl
                                             WHERE t.an_action_id = tl.action_id')

  end
end
