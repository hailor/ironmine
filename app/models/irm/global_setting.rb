require 'paperclip_processors/cropper'
include Paperclip

class Irm::GlobalSetting < ActiveRecord::Base
  set_table_name :irm_global_setting

  has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>", :original => "500x500>" }, :processors => [:cropper]
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :reprocess_logo, :if => :cropping?
  validates_presence_of :upload_file_limit

  scope :list_all, lambda{
        select("#{table_name}.*, lvt.meaning timezone_meaning").
        joins(",#{Irm::LookupValuesTl.table_name} lvt,#{Irm::LookupValue.table_name} lv").
        where("lv.lookup_type = 'TIMEZONE'").
        where("lv.id = lvt.lookup_value_id").
        where("lvt.language=?", I18n.locale).
        where("lv.lookup_code = #{table_name}.timezone")}
  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end

  def logo_geometry(style = :original)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file(logo.path(style))
  end

  private
  def reprocess_logo
    logo.reprocess!
  end
end
