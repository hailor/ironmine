class Irm::Attachment < ActiveRecord::Base
  set_table_name :irm_attachments

  attr_accessor :data

  has_many :attachment_versions, :dependent => :destroy
  query_extend
  scope :list_all, lambda{
    select("#{table_name}.*, av.id version_id, av.category_id category_id, av.data_file_name data_file_name, av.data_content_type data_content_type, av.data_file_size/1024 data_file_size, av.data_updated_at data_updated_at, fvt.meaning category_name").
    joins(", #{Irm::AttachmentVersion.table_name} av").
    joins(", #{Irm::LookupValue.table_name} fv").
    joins(", #{Irm::LookupValuesTl.table_name} fvt").
    where("fv.id = av.category_id").
    where("fv.id = fvt.lookup_value_id").
    where("fvt.language = ?", I18n.locale).
    where("#{table_name}.latest_version_id = av.id")
  }
end