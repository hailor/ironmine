class Skm::EntryHeader < ActiveRecord::Base
  set_table_name :skm_entry_headers

  has_many :entry_subjects
  has_many :entry_details
  validates_presence_of :entry_title
  scope :published, where("#{table_name}.entry_status_code = ?", "PUBLISHED")
  scope :draft, where("#{table_name}.entry_status_code = ?", "DRAFT")
  scope :current_entry, where("#{table_name}.history_flag = ?", Irm::Constant::SYS_NO)
  scope :history_entry, where("#{table_name}.history_flag = ?", Irm::Constant::SYS_YES)

  def self.generate_doc_number(prefix = "")
      num = Time.now.strftime("%y%m%d").to_i * 1000000 + id % 1000000
      return prefix + num.to_s
  end

  def next_version_number
    self.version_number.blank? ? "1" : (self.version_number.to_i + 1)
  end

  query_extend
end