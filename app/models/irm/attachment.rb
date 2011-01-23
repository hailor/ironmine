class Irm::Attachment < ActiveRecord::Base
  set_table_name :irm_attachments

  attr_accessor :data

  has_many :attachment_versions
end