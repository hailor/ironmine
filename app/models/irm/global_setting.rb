require 'paperclip_processors/cropper'
include Paperclip

class Irm::GlobalSetting < ActiveRecord::Base
  set_table_name :irm_global_setting

  has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>", :original => "500x500>" }, :processors => [:cropper]
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :reprocess_logo, :if => :cropping?

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
