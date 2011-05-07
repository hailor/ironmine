class Skm::EntryHeader < ActiveRecord::Base
  set_table_name :skm_entry_headers

  has_many :entry_subjects
  has_many :entry_details

  acts_as_searchable


  validates_presence_of :entry_title
  scope :published, where("#{table_name}.entry_status_code = ?", "PUBLISHED")
  scope :draft, where("#{table_name}.entry_status_code = ?", "DRAFT")
  scope :current_entry, where("#{table_name}.history_flag = ?", Irm::Constant::SYS_NO)
  scope :history_entry, where("#{table_name}.history_flag = ?", Irm::Constant::SYS_YES)
  scope :list_all, select("#{table_name}.id, #{table_name}.company_id, #{table_name}.entry_template_id, #{table_name}.entry_title" +
                              ", #{table_name}.keyword_tags, #{table_name}.doc_number, #{table_name}.history_flag, #{table_name}.entry_status_code" +
                              ", #{table_name}.version_number, DATE_FORMAT(#{table_name}.published_date , '%Y/%c/%e %H:%I:%S') published_date_f, #{table_name}.published_date, #{table_name}.author_id, #{table_name}.status_code" +
                              ", #{table_name}.created_by, #{table_name}.created_at, #{table_name}.updated_by, #{table_name}.updated_at,  CONCAT('[', #{table_name}.doc_number, ']', #{table_name}.entry_title) full_title").
      order("#{table_name}.published_date DESC")

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

  scope :with_favorite_flag, lambda{|person_id|
    select("if(ef.id is null, 'Y', 'N') is_favorite").
    joins("LEFT OUTER JOIN #{Skm::EntryFavorite.table_name} ef ON ef.person_id = #{person_id} AND ef.entry_header_id = #{table_name}.id")
  }

  def self.search(query)
    Skm::EntryHeader.list_all.published.current_entry.where("#{table_name}.entry_title like ? OR #{table_name}.doc_number like ?","%#{query}%","%#{query}%")
  end

  def self.generate_doc_number(prefix = "")
      num = Time.now.strftime("%y%m%d").to_i * 1000000 + rand(10)
      return prefix + num.to_s
  end

  def next_version_number
    self.version_number.blank? ? "1" : (self.version_number.to_i + 1)
  end

  query_extend
  acts_as_recently_objects(:title => "entry_title",
                           :target_controller => "skm/entry_headers")

  def to_html
    self.entry_title
  end
end