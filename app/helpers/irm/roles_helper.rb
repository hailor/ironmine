module Irm::RolesHelper
  def available_role_types
    Irm::LookupValue.query_by_lookup_type("IRM_ROLE_TYPE").multilingual.collect{|m| [m[:meaning], m.lookup_code]}
  end
  def available_report_groups
    Irm::ReportGroup.multilingual.enabled.collect{|g| [g[:name], g.group_code]}
  end

  def available_roles
    Irm::Role.multilingual.enabled.collect{|m| [m[:name],m.id]}
  end

  def available_top_menu
    Irm::Menu.multilingual.top_menu.collect{|m| [m[:name],m[:menu_code]]}
  end
end