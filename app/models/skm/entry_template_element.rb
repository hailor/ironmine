class Skm::EntryTemplateElement < ActiveRecord::Base
  set_table_name :skm_entry_template_elements
  validates_presence_of :entry_template_element_code
  validates_uniqueness_of :entry_template_element_code
  validates_presence_of :name

  query_extend

  scope :with_template, lambda{|template_id|
    select("#{table_name}.*, et.required_flag required_flag").
    joins(",#{Skm::EntryTemplateDetail.table_name} et").
    where("et.entry_template_id = ?", template_id).
    where("et.entry_template_element_id = #{table_name}.id")
  }

  scope :without_template, lambda{|template_id|
    select("#{table_name}.*").
    where("#{table_name}.id NOT IN (SELECT entry_template_element_id FROM #{Skm::EntryTemplateDetail.table_name} et WHERE et.entry_template_id = ?)", template_id)
  }
end