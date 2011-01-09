module Irm::SupportGroupMembersHelper
  def support_group_member_flag(person_id,support_group_code)
    support_group = Irm::SupportGroupMember.query_by_person_id(person_id).
                                 query_by_support_group_code(support_group_code).first
    if support_group.blank?
      false
    else
      true
    end
  end
end
