class Irm::Event < ActiveRecord::Base
  set_table_name :irm_events
  serialize :params, Hash
end
