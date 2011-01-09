module Irm::CompanyAccessesHelper
  def company_access_flag(person_id,company_id,column)
    company_access = Irm::CompanyAccess.query_by_person_id(person_id).
                         query_by_accessable_company_id(company_id).first
    if company_access.blank?
      false
    else
      if company_access.send(column.to_sym) == "Y"
        true
      else
        false
      end
    end    
  end
end
