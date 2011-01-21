class Irm::Attachment < ActiveRecord::Base
  set_table_name :irm_attachments

  has_many :attachment_versions
end