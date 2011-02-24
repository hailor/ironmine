class Irm::AttachmentVersion < ActiveRecord::Base
  set_table_name :irm_attachment_versions

  belongs_to :attachment

  has_attached_file :data,:styles => {:thumb=> "60x60>",
                                      :small => "100x100>",
                                      :url => Irm::Constant::ATTACHMENT_URL,
                                      :path => Irm::Constant::ATTACHMENT_PATH }
  validates_attachment_presence :data
  validates_attachment_size :data, :less_than => 10.megabytes

  before_data_post_process :allow_only_images

  before_validation_on_create  :setup_attachment_id
  query_extend
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

  #返回附件url
  def url(*args)
    data.url(*args)
  end
  
  #返回附件名称
  def name
    data_file_name
  end

  #返回附件类型
  def content_type
    data_content_type
  end

  #返回附件大小
  def file_size
    data_file_size
  end

  #以KB单位返回文件大小
  def file_size_kb
    (format("%.2f", data_file_size.to_f/1024)).to_s
  end

  def self.query_attachment_count(source_type,source_id)
     AttachmentVersion.count(:conditions=>" #{AttachmentVersion.table_name}.source_type='#{source_type}' AND #{AttachmentVersion.table_name}.source_id=#{source_id} ")
  end

  def after_destroy
    Dir.rmdir diskfile if !data_file_name.blank? && File.directory?(diskfile)
  end

  def diskfile
    "#{@@storage_path}/#{self.id}"
  end
  
  #根据post中的附件数组，创建附件,
  def self.attach_files(attachments,source_type,source_id)
    attached = []
    unsaved = []
    #判断是否有附件上传
    if attachments && attachments.is_a?(Hash)
      #对每个附件进行处理
      attachments.each_value do |attachment|
        #获取文件
        file = attachment['file']
        next unless file && file.size > 0
        #创建附件，此处的:data不是数据库列,而是在Attachment中用语句
        #has_attached_file :data, :styles => {:thumb=> "60x60#",:small => "150x150>" }
        #生成的由Paperclip插件处理
        version = Irm::AttachmentVersion.create(:data => file,
                                                :source_type=>source_type,
                                                :source_id =>source_id,
                                                :file_category => attachment['file_category'],
                                                :description => attachment['description'].to_s.strip)
        if version.new_record?
           unsaved << version
        else
           attached << version
        end
      end
      if unsaved.any?
        return false
      end
    end
    attached
  end

  #根据post中的附件数组，创建附件,在新建附件时创建附件容器
  def self.create_verison_files(attachments, source_type, source_id)
    attached = []
    unsaved = []
    #判断是否有附件上传
    if attachments && attachments.is_a?(Hash)
      #对每个附件进行处理
      attachments.each_value do |attachment|
        #创建附件容器
        @container=Irm::Attachment.create()
        #获取文件
        file = attachment['file']
        next unless file && file.size > 0
        #创建附件，此处的:data不是数据库列,而是在Attachment中用语句
        #has_attached_file :data, :styles => {:thumb=> "60x60#",:small => "150x150>" }
        #生成的由Paperclip插件处理
        attachment['file_category'] = Irm::FlexValue.where("flex_value = ?", "OTHERS").first().id if attachment['file_category'].blank?
        version = Irm::AttachmentVersion.create(:data => file,
                                              :attachment_id=>@container.id,
                                              :source_type=>source_type,
                                              :source_id =>source_id,
                                              :category_id => attachment['file_category'],
                                              :description => attachment['description'].to_s.strip)
        if version.new_record?
           unsaved << version
           @container.destroy
        else
           attached << version
          update_attachment_by_version(@container,version)
        end
      end
      if unsaved.any?
        return false
      end
    end
    attached
  end


  #更新容器中的最近更新版本的附件信息
  def self.update_attachment_by_version(attachment,version)
    attachment.update_attributes(:latest_version_id=>version.id,
                                :file_name=>version.data_file_name,
                                :file_type=> version.data_content_type,
                                :file_category=>version.category_id,
                                :file_size=>version.data_file_size,
                                :description=>version.description,
                                :private_flag=>version.private_flag)
  end

  #根据post中的附件数组，创建附件的新版本
  def self.update_version_files(container,attachments,source_type,source_id)
    attached = []
    unsaved = []
    #判断是否有附件上传
    if attachments && attachments.is_a?(Hash)
      #对每个附件进行处理
      attachments.each_value do |attachment|
        #获取文件
        file = attachment['file']
        next unless file && file.size > 0
        #创建附件，此处的:data不是数据库列,而是在Attachment中用语句
        #has_attached_file :data, :styles => {:thumb=> "60x60#",:small => "150x150>" }
        #生成的由Paperclip插件处理
        version = Irm::AttachmentVersion.create(:data => file,
                                                :attachment_id=>container.id,
                                                :source_type=>source_type,
                                                :source_id =>source_id,
                                                :file_category => attachment['file_category'],
                                                :description => attachment['description'].to_s.strip)
        if version.new_record?
           unsaved << version
        else
           attached << version
          update_attachment_by_version(container,version)
        end
      end
      if unsaved.any?
        return false
      end
    end
    attached
  end

  #根据post中的附件数组，创建附件,在新建附件时创建附件容器
  def self.create_import_files(attachment,source_type,source_id,options = {})
    #判断是否有附件上传
    if attachment && attachment.is_a?(Hash)
        #获取文件
        file = attachment['file']
        if file && file.size > 0
            @attachment = Irm::AttachmentVersion.create(:data => file,
                                                  :attachment_id=>nil,
                                                  :source_type=>source_type,
                                                  :source_id =>source_id,
                                                  :file_category => attachment['file_category'],
                                                  :description => attachment['description'].to_s.strip)
        end
    end
    @attachment
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