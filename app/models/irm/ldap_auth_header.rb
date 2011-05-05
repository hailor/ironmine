class Irm::LdapAuthHeader < ActiveRecord::Base
  set_table_name :irm_ldap_auth_headers
  belongs_to :ldap_source,:foreign_key=>:ldap_source_id,:primary_key=>:id
  has_many :ldap_auth_attributes
  has_many :ldap_syn_people
  query_extend

  scope :query_auth_info,lambda{ select("#{table_name}.*,"+
                                                          "v1.name ldap_source").
                                                   joins(",irm_ldap_sources v1").
                                                   where("v1.id=#{table_name}.ldap_source_id")}

  def self.try_to_login(login_name,password)
    self.class.enabled.each do |auth_header|
      begin
        attrs = auth_header.authenticate(login_name, password)
      rescue => e
        logger.error "Error during authentication: #{e.message}"
        attrs = nil
      end
      return attrs if attrs
    end
    return nil
  end


  def authenticate(login_name,password)
    ldap_syn_person = self.ldap_syn_people.first
    return nil unless ldap_syn_person
    login_filter = Net::LDAP::Filter.eq( self.ldap_login_name_attr, login_name )
    return_attrs = {:login_name=>self.ldap_login_name_attr}
    person_attr = ldap_syn_person.default_attributes
    # set password
    person_attr.merge!({:password=>password,:password_confirmation=>password})
    self.ldap_auth_attributes.each do |attr|
      return_attrs[attr.local_attr.to_sym] = attr.ldap_attr
    end

    ldap = Net::LDAP.new
    ldap.host = self.ldap_source.host
    ldap.port = self.ldap_source.port

    ldap.search( :auth => {:method =>:anonymous},
                 :base => self.ldap_source.base_dn,
                 :filter => login_filter,
                 :attributes=> (['dn'])) do |entry|
      dn = entry.dn

      result = ldap.bind_as(:base => self.auth_cn,
                            :filter => login_filter,
                            :password => password)
      if result
        puts "Authenticated #{result.first.dn}"
        return_entry = result.first
        return_attrs.each do |key,value|
          return_value  = self.class.get_attr(return_entry,value)
          person_attr[key]= return_value if return_value
        end
        person = Irm::Person.new(person_attr)
        person.save
        return person.id unless person.errors.any?
      else
        return nil
      end
    end
    return nil

  end


  def self.get_attr(entry, attr_name)
    if !attr_name.blank? &&entry[attr_name].present?
      entry[attr_name].is_a?(Array) ? entry[attr_name].first : entry[attr_name]
    end
  end

end
