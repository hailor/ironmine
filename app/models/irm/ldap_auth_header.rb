class Irm::LdapAuthHeader < ActiveRecord::Base
  set_table_name :irm_ldap_auth_headers
  belongs_to :ldap_source,:foreign_key=>:ldap_source_id,:primary_key=>:id
  has_many :ldap_auth_attributes
  query_extend


  scope :with_ldap_source,lambda{
    joins("JOIN #{Irm::LdapSource.table_name} ON #{Irm::LdapSource.table_name}.id = #{table_name}.ldap_source_id").
    select("#{Irm::LdapSource.table_name}.name ldap_source_name")
  }

  scope :with_template_person,lambda{
    joins("JOIN #{Irm::Person.table_name} ON #{Irm::Person.table_name}.id = #{table_name}.template_person_id").
    select("#{Irm::Person.table_name}.full_name template_person_name")
  }

  scope :query_by_ldap_source,lambda{|ldap_source_id|
    where(:ldap_source_id => ldap_source_id)
  }


  def self.list_all
    select("#{table_name}.*").with_ldap_source.with_template_person
  end

  def self.try_to_login(login_name,password)
    self.enabled.each do |auth_header|
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
    login_filter = Net::LDAP::Filter.eq( self.ldap_login_name_attr, login_name )
    return_attrs = {:login_name=>self.ldap_login_name_attr,:email_address=>self.ldap_email_address_attr}
    # setup person and password
    person_attr = {:password=>password,:password_confirmation=>password}
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
        exists_person = Irm::Person.where(:login_name=>login_name).first
        return exists_person.id if exists_person
        return_entry = result.first
        return_attrs.each do |key,value|
          return_value  = self.class.get_attr(return_entry,value)
          person_attr[key]= return_value if return_value
        end
        person_attr[:auth_source_id] = self.id
        person_attr[:email_address] = "#{person_attr[:login_name]}@ironmine.com" unless person_attr[:email_address].present?
        person = create_ldap_person(person_attr)
        return person.id if person
      else
        return nil
      end
    end
    return nil

  end



  def create_ldap_person(person_attr)
    template_person = Irm::Person.find(self.template_person_id)
    person = template_person.attributes.merge(person_attr.stringify_keys!)
    person = Irm::Person.new(person)
    person.save
    return nil if person.errors.any?
    template_person.person_roles.each do |pr|
      person.person_roles.create(:role_id=>pr.role_id)
    end

    template_person.company_accesses.each do |ca|
      person.company_accesses.create(:accessable_company_id=>ca.accessable_company_id,:company_access_flag=>ca.company_access_flag,:support_stuff_flag=>ca.support_stuff_flag)
    end
    person
  end


  def self.get_attr(entry, attr_name)
    if !attr_name.blank? &&entry[attr_name].present?
      entry[attr_name].is_a?(Array) ? entry[attr_name].first : entry[attr_name]
    end
  end

end
