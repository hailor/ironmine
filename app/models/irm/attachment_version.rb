class Irm::AttachmentVersion < ActiveRecord::Base
  set_table_name :irm_attachment_versions

  belongs_to :attachment

  has_attached_file :data,:styles => {:thumb=> "60x60>", :small => "100x100>" }
  validates_attachment_presence :data
  validates_attachment_size :data, :less_than => 10.megabytes

  before_data_post_process :allow_only_images

  before_validation_on_create  :setup_attachment_id

  scope :query_all,lambda{
    select("#{table_name}.*")
  }

  scope :query_by_incident_request,lambda{|request_id|
    joins("JOIN #{Icm::IncidentJournal.table_name} ON #{table_name}.source_type= '#{Icm::IncidentJournal.name}' AND #{table_name}.source_id = #{Icm::IncidentJournal.table_name}.id").
    where("#{Icm::IncidentJournal.table_name}.incident_request_id = ?", request_id)
  }

  def image?
    self.image_flag.eql?(Irm::Constant::SYS_YES)
  end

  def self.dataurl(attributes,style_name="original")
    attributes.merge!({:class_name=>self.name,:name=>"data"})
    Irm::PaperclipHelper.gurl(attributes,style_name)
  end

  def self.datapath(attributes,style_name="original")
    attributes.merge!({:class_name=>self.name,:name=>"data"})
    Irm::PaperclipHelper.gpath(attributes,style_name)
  end

  def self.file_type_icon(file_name)
    extension = File.extname(file_name).gsub(/^\.+/, "")
    if ['doc','docx','rar','sql','txt','xls','xlsx','zip'].include?(extension)
      return "/filetypes/#{extension}.png"
    else
      return "/filetypes/default.png"
    end
  end


  private
  def setup_attachment_id
    self.attachment_id  = 0 unless self.attachment_id 
  end

  def allow_only_images
    if !(data.content_type =~ %r{^(image|(x-)?application)/(x-png|pjpeg|jpeg|jpg|png|gif)$})
      self.image_flag="N"
      return false
    end
  end
end