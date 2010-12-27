class Irm::SupportGroupMember < ActiveRecord::Base
  set_table_name :irm_support_group_members

  scope :query_wrap_info,lambda{|language,support_group_code| select("#{table_name}.id id,v2.name company_name,CONCAT(t3.last_name,t3.first_name) person_name,"+
                                                                         "v1.meaning status_meaning,t3.email_address,t3.mobile_phone").
                                                   joins(",irm_lookup_values_vl v1").
                                                   joins(",irm_companies_vl v2").
                                                   joins(",irm_people t3").
                                                   where("v1.lookup_type='SYSTEM_STATUS_CODE' AND v1.lookup_code = #{table_name}.status_code AND "+
                                                         "#{table_name}.support_group_code = ? AND #{table_name}.person_id = t3.id AND "+
                                                         "v2.id  = t3.company_id AND v2.language=? AND "+
                                                         "v1.language=?",support_group_code,language,language)}

  scope :query_support_group_by_person_id,lambda{|language,person_id| select("#{table_name}.id id,v2.name support_group_name,"+
                                                                         "v1.meaning status_meaning").
                                                   joins(",irm_lookup_values_vl v1").
                                                   joins(",irm_support_groups_vl v2").
                                                   where("v1.lookup_type='SYSTEM_STATUS_CODE' AND v1.lookup_code = #{table_name}.status_code AND "+
                                                         "v2.group_code = #{table_name}.support_group_code AND v2.language=? AND "+
                                                         "v1.language =? AND #{table_name}.person_id = ?",language,language,person_id)}

  scope :query_by_support_group_code,lambda{|support_group_code|
     where(:support_group_code=>support_group_code)}
  scope :query_by_person_id,lambda{|person_id|
     where(:person_id=>person_id)}

  def self.check_person_exists?(support_group_code,person_id)
    @support_group_member = self.query_by_support_group_code(support_group_code).query_by_person_id(person_id)
    if @support_group_member.blank?
      true
    else
      false
    end
  end

  def self.delete_support_group_member(person_list,support_group_code)
    self.delete_all(["support_group_code = ? and person_id in (?) ",
                     support_group_code,person_list])
  end

  def self.delete_by_id(id)
    self.delete_all(["id in (?)",id])
  end



end