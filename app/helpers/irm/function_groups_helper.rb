module Irm::FunctionGroupsHelper
  def available_function_group
    Irm::FunctionGroup.query_by_status_code("ENABLED").multilingual.collect{|i| [i[:name],i.group_code]}
  end
end
