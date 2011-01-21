class Skm::EntrySubject < ActiveRecord::Base
  set_table_name :skm_entry_subjects

  belongs_to :entry_header
  
  def all_available_subjects(subject_type)
    Irm::FlexValue.query_by_value_set_name(subject_type)
  end
end