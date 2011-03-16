module Irm::PeopleHelper
   def person_title
    Irm::LookupValue.query_by_lookup_type("IRM_PERSON_TITLE").multilingual.order_id.collect{|p|[p[:meaning],p[:lookup_code]]}
  end
end
