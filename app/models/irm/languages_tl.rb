class Irm::LanguagesTl < ActiveRecord::Base
  set_table_name :irm_languages_tl

  belongs_to :language_parent,:foreign_key=>:language_id,:class_name=>'Irm::Language'

  scope :query_by_language_id,lambda{|language_id| where(:language_id=>language_id)}
  
end
