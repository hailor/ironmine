module Irm::PeopleHelper
   def person_title
    Irm::LookupValue.query_by_lookup_type("IRM_PERSON_TITLE").multilingual.order_id.collect{|p|[p[:meaning],p[:lookup_code]]}
   end

   def available_uid_person
     Irm::Person.query_all_person
   end
end
