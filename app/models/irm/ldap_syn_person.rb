class Irm::LdapSynPerson < ActiveRecord::Base
  set_table_name :irm_ldap_syn_people
  belongs_to :Ldap_Auth_Header,:foreign_key=>:auth_source_id,:primary_key=>:id

  query_extend

  scope :query_show_wrap_info,lambda{|language| select("#{table_name}.*,auth.name auth_name, icv.name company_name," +
                                                        "iov.name organization_name,idv.name department_name," +
                                                        "irv.name region_name,isgv.name site_group_name,isv.name site_name,ilv.description notification_lang_name").
                                                     joins("inner join irm_languages v2").
                                                     joins("inner join irm_ldap_auth_headers auth").
                                                     joins("left outer join irm_companies_vl icv on #{table_name}.company_id=icv.id AND icv.language = v2.language_code").
                                                     joins("left outer join irm_organizations_vl iov on #{table_name}.organization_id=iov.id AND iov.language = v2.language_code").
                                                     joins("left outer join irm_departments_vl idv on #{table_name}.department_id=idv.id AND idv.language = v2.language_code").
                                                     joins("left outer join irm_regions_vl irv on #{table_name}.region_code=irv.region_code AND irv.language = v2.language_code").
                                                     joins("left outer join irm_site_groups_vl isgv on #{table_name}.site_group_code=isgv.group_code AND isgv.language = v2.language_code").
                                                     joins("left outer join irm_sites_vl isv on #{table_name}.site_code=isv.site_code AND isv.language = v2.language_code").
                                                     joins("left outer join irm_languages_vl ilv on #{table_name}.notification_lang=ilv.language_code AND ilv.language = v2.language_code").
                                                     where("auth.id = #{table_name}.auth_source_id and v2.language_code=?",language)}

  scope :query_syn_by_source,lambda{|source_id| select("#{table_name}.*").
                                                      joins("inner join irm_ldap_auth_headers auth").
                                                      where("auth.id = #{table_name}.auth_source_id and auth.ldap_source_id=?",source_id)}


  def ldap_attr()
     attr_h={}
     Irm::LdapSynAttribute.query_ldap_attr(self.id,"IRM_PEOPLE","LDAP").each do |attr|
       attr_h[attr.local_attr] = attr.ldap_attr
     end
     attr_h
  end

  #同步人员
  def ldap_peo
    peo_temp = Irm::LdapSynPeoInterface.new()
    peo_attr = self.ldap_attr()
    peo_attr["ldap_dn"]="ldap_dn"
    #每次针对一个同步方案同步
    peo_temp["process_id"] = self.id
    attr =peo_attr.values
    #puts peo_temp.to_json


    result = ActiveSupport::JSON.decode(self.to_json)
    peo_hash = result["ldap_syn_person"]
    peo_hash.delete_if {|key, value| key=="id" }
    peo_hash.delete_if {|key, value| key=="filter" }
    peo_hash.delete_if {|key, value| key=="ldap_name" }
    peo_hash.delete_if {|key, value| key=="description" }
    peo_hash.delete_if {|key, value| key=="created_at" }
    peo_hash.delete_if {|key, value| key=="created_by" }
    peo_hash.delete_if {|key, value| key=="updated_at" }
    peo_hash.delete_if {|key, value| key=="updated_by" }

    puts peo_hash.keys

    peo_hash.each do |key ,value|
      peo_temp[key.to_s] = value
    end

    ldap = self.Ldap_Auth_Header.ldap_source.ldap
    tree_base = self.ldap_dn

    filter =self.filter.length>0 ? Net::LDAP::Filter.construct(self.filter) : Net::LDAP::Filter.nil?
    peo_r = {}
    peo_result = ldap.search( :base => tree_base,
                            :attributes => attr,
                            :filter=>filter,
                            :return_result => true ,
                            :scope=>Net::LDAP::SearchScope_SingleLevel)


      peo_result.each  do |entry|
        new_peo = peo_temp.clone
        peo_r["ldap_dn"] =entry.dn
        entry.each do |attr, values|
          peo_r[attr.to_s]= values.first
        end
        peo_attr.each do |key,val|
          new_peo["#{key.to_s}".to_sym]=peo_r[val]
        end
        new_peo.save
      end
  end

  def process_people
    Irm::LdapSynPeoInterface.find_all_by_process_id(self.id).each do |peo|
      #peo.delete_if {|key, value| key=="dept_dn" }
      #peo.delete_if {|key, value| key=="id" }
      result = ActiveSupport::JSON.decode(peo.to_json)


      peo_hash = result["ldap_syn_peo_interface"]
      peo_hash.delete_if {|key, value| key=="process_id" }
      peo_hash.delete_if {|key, value| key=="id" }

      if Irm::Person.exists?(:login_name=>peo["login_name"])
       peo_update = Irm::Person.find_by_login_name(peo["login_name"])
       peo_update.update_attributes(peo_hash.attributes)
       peo_id =peo_update.id
      else
       peo_new = Irm::Person.create(peo_hash.attributes)
       puts  peo_new.errors

      end
      @people = Irm::LdapSynPeoInterface.where(:login_name=>peo["login_name"],:process_id=>peo["process_id"])
      @people.first.destroy
    end
  end

end
