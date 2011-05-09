class AlterIrmEventsAddBo < ActiveRecord::Migration
  def self.up
    add_column "irm_events","event_type",:string,:limit=>30,:after=>:event_code
    add_column "irm_events","business_object_id",:integer,:after=>:event_code
    add_column "irm_events","bo_code",:string,:limit=>30,:after=>:event_code
  end

  def self.down
    remove_column "irm_events","business_object_id"
    remove_column "irm_events","bo_code"
    remove_column "irm_events","event_type"
  end
end
