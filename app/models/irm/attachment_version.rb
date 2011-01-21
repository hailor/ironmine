class Irm::AttachmentVersion < ActiveRecord::Base
  set_table_name :irm_attachment_versions

  belongs_to :attachment

  has_attached_file :data,:styles => {:thumb=> "60x60>", :small => "100x100>" }
  validates_attachment_presence :data
  validates_attachment_size :data, :less_than => 10.megabytes

  before_data_post_process :allow_only_images

  before_validation_on_create  :setup_attachment_id

  def allow_only_images
    if !(data.content_type =~ %r{^(image|(x-)?application)/(x-png|pjpeg|jpeg|jpg|png|gif)$})
      return false
    end
  end

  def self.dataurl(attributes,style_name="original")
    attributes.merge!({:class_name=>self.name,:name=>"data"})
    Irm::PaperclipHelper.gurl(attributes,style_name)
  end

  def self.datapath(attributes,style_name="original")
    attributes.merge!({:class_name=>self.name,:name=>"data"})
    Irm::PaperclipHelper.gpath(attributes,style_name)
  end


  private
  def setup_attachment_id
    self.attachment_id  = 0 unless self.attachment_id 
  end


end