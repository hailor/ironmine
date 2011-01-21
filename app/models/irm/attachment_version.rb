class Irm::AttachmentVersion < ActiveRecord::Base
  set_table_name :irm_attachment_versions
  has_attached_file

  belongs_to :attachment
end