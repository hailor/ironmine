module Irm::LdapAuthHeadersHelper


  def available_template_people
    Irm::Person.where(:type=>"Irm::TemplatePerson").collect{|i|[i[:full_name],i.id]}
  end
end
