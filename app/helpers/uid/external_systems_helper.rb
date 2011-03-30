module Uid::ExternalSystemsHelper
  def available_external_systems
     Uid::ExternalSystem.multilingual
  end
end
