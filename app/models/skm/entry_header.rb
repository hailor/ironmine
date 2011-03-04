class Skm::EntryHeader < ActiveRecord::Base
  set_table_name :skm_entry_headers

  has_many :entry_subjects
  has_many :entry_details
  validates_presence_of :entry_title
  scope :published, where("#{table_name}.entry_status_code = ?", "PUBLISHED")
  scope :draft, where("#{table_name}.entry_status_code = ?", "DRAFT")
  scope :current_entry, where("#{table_name}.history_flag = ?", Irm::Constant::SYS_NO)
  scope :history_entry, where("#{table_name}.history_flag = ?", Irm::Constant::SYS_YES)
  scope :list_all, select("#{table_name}.*, CONCAT('[', #{table_name}.doc_number, ']', #{table_name}.entry_title) full_title")

  scope :my_favorites, lambda{|person_id|
    joins(",#{Skm::EntryFavorite.table_name} ef").
    where("ef.entry_header_id = #{table_name}.id").
    where("ef.person_id = ?", person_id)
  }

  scope :my_drafts, lambda{|person_id|
    where("#{table_name}.author_id = ?", person_id).
    where("#{table_name}.entry_status_code = ?", "DRAFT")
  }

  scope :query_by_day,select("DATE_FORMAT(#{table_name}.created_at,'%Y-%m-%d') created_day,sum(1) entry_count").
                      group("DATE_FORMAT(#{table_name}.created_at,'%Y-%m-%d')").
                      order("DATE_FORMAT(#{table_name}.created_at,'%Y-%m-%d') asc")
  
  def self.generate_doc_number(prefix = "")
      num = Time.now.strftime("%y%m%d").to_i * 1000000 + rand(10)
      return prefix + num.to_s
  end

  def next_version_number
    self.version_number.blank? ? "1" : (self.version_number.to_i + 1)
  end

  query_extend
end