class Irm::Person < ActiveRecord::Base
  set_table_name :irm_people


  #权限字符串
  def permissions
    Irm::Permission.enabled.query_by_person(self.id)
  end

  #权限字符串
  def permissions_to_s
    prmissions_s = ""
    #缓存用户权限字符串
    if @permissions_accesses
      return @permissions_accesses
    end
    permissions.each do |p|
      ps = "|#{p[:controller]}_#{p[:action]}|"
      prmissions_s<<ps unless prmissions_s.include?(ps)
    end
    @permissions_accesses = prmissions_s
    return prmissions_s
  end
end
