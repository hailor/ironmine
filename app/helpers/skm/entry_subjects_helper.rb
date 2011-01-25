module Skm::EntrySubjectsHelper
  def available_entry_subject_types
    flex_value_set = Irm::FlexValueSet.where(:flex_value_set_name => "OPERATIONAL_CATALOG_HARDWARE").first
    if flex_value_set
      flex_values = flex_value_set.flex_values.multilingual.enabled
    else
      {}
    end
  end

  def available_entry_subjects(subject_type)

  end
end