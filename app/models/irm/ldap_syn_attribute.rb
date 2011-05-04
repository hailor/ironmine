class Irm::LdapSynAttribute < ActiveRecord::Base
  set_table_name :irm_ldap_syn_attributes
  belongs_to :ldap_syn_header,:foreign_key=>:ldap_syn_header_id,:primary_key=>:id

  query_extend

  scope :query_syn_info,lambda{|language,id,type| select("#{table_name}.*,"+
                                                          "v1.meaning value_type_name").

                                            joins(",irm_lookup_values_vl v1").
                                            where(" v1.lookup_type='LDAP_VALUE_TYPE' AND v1.lookup_code = #{table_name}.ldap_attr_type "+
                                                  " AND v1.language=? and #{table_name}.ldap_syn_header_id=? and #{table_name}.object_type=? ",language,id,type)}

  scope :query_show_info,lambda{|language,id| select("#{table_name}.*,"+
                                                            "v1.meaning value_type_name").

                                              joins(",irm_lookup_values_vl v1").
                                              where(" v1.lookup_type='LDAP_VALUE_TYPE' AND v1.lookup_code = #{table_name}.ldap_attr_type "+
                                                    " AND v1.language=? and #{table_name}.id=? ",language,id)}


  scope :query_ldap_attr,lambda{|syn_header_id,object_type,attr_type| select("#{table_name}.*").
                                              where("#{table_name}.ldap_syn_header_id=? AND #{table_name}.object_type=? AND #{table_name}.ldap_attr_type=? ",syn_header_id,object_type,attr_type)}

end
