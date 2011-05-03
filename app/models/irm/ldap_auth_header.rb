class Irm::LdapAuthHeader < ActiveRecord::Base
  set_table_name :irm_ldap_auth_headers
  belongs_to :ldap_source,:foreign_key=>:ldap_source_id,:primary_key=>:id
  has_many :ldap_auth_attributes
  has_many :Ldap_syn_people
  query_extend

  scope :query_auth_info,lambda{ select("#{table_name}.*,"+
                                                          "v1.name ldap_source").
                                                   joins(",irm_ldap_sources v1").
                                                   where("v1.id=#{table_name}.ldap_source_id")}

  def self.try_to_login(person)
   authHeader= Irm::LdapAuthHeader.find(person.auth_source_id)
      begin
        logger.debug "Authenticating '#{person.login_name}' against '#{authHeader.ldap_source.name}'" if logger && logger.debug?
        puts "step1"
        attrs = authHeader.authenticate(person)
        return  attrs
      rescue => e
        puts "err1"
        logger.error "Error during authentication: #{e.message}"
        return false
      end
      return true

  end


  def authenticate(person)
    puts "step2"
    filter=Net::LDAP::Filter.nil?
    tmp_index = 0
    self.ldap_auth_attributes.each do |attr|
      if attr.local_attr != "home_phone"
        tmp_local_value=""
        tmp_filter=Net::LDAP::Filter.nil?
        tmp_local_value = person.send(attr.local_attr.to_sym)
        puts "step7 " + attr.ldap_attr+","+ tmp_local_value
        tmp_filter = Net::LDAP::Filter.eq(attr.ldap_attr, tmp_local_value)

        if tmp_index==0
          filter = tmp_filter
        else
          filter = filter & tmp_filter
        end
        tmp_index=tmp_index+1
      end
    end
    puts filter
    puts "step3"
    user_cn = "cn="+person.login_name + ","+self.auth_cn

    puts "step4 " +user_cn

    ldap = Net::LDAP.new
    ldap.host = self.ldap_source.host
    ldap.port = self.ldap_source.port
    #puts ldap.host
    #puts ldap.port
    #puts user_cn
    #puts person.home_phone
    ldap.auth user_cn, person.home_phone
    #puts self.ldap_source.base_dn

    #puts person.home_phone
    result = ldap.bind_as(:base =>"dc=hand-china, dc=com",# self.ldap_source.base_dn,
                          :filter => filter,
                          :password =>"19860207")
    if result
      puts "step5"
      return true
    else
      puts "err2"
      return false
    end
  end

end
