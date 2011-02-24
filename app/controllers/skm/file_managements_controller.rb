class Skm::FileManagementsController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.xml { render :xml => @files}
    end
  end

  def new

  end

  def batch_new
    
  end

  def create
    if request.post?
      #获取所有附件
      files = params[:file]

      #调用方法创建附件
      Irm::AttachmentVersion.create_verison_files(files,0,0)
    end
    if params[:act] == "next"
      redirect_to :action => 'new'
    else
      redirect_to :action => 'index'
    end
  end

  def batch_create
    if request.post?
      #获取所有附件
      files = params[:file]

      #调用方法创建附件
      Irm::AttachmentVersion.create_verison_files(files,0,0)
    end
    redirect_to :action => 'index'    
  end
  
  def edit
    @file = Irm::Attachment.list_all.where("#{Irm::Attachment.table_name}.id = ?", params[:id]).first()
  end

  def update
    @file = Irm::Attachment.find(params[:id])
    infile = {}
    params[:file].each_value do |p|
      infile = p
    end
    if infile[:file]
      file = params[:file]
      Irm::AttachmentVersion.update_version_files(@file, file, 0, 0)
    else
      @file.update_attribute(:description, infile[:description])
      @file.update_attribute(:file_category, infile[:file_category])
      @file.update_attribute(:private_flag, infile[:private_flag])
      file = Irm::AttachmentVersion.where(:id => @file.latest_version_id)
      if file.any?
        file.first().update_attributes(:private_flag => @file.private_flag,
                               :description => @file.description,
                               :category_id => @file.file_category)
      end
    end
    respond_to do |format|
      if @file.save
        format.html { redirect_to({:action=>"index"}, :notice =>t(:successfully_created)) }
        format.xml  { render :xml => @file, :status => :created, :location => @file }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @file.errors, :status => :unprocessable_entity }
      end
    end    
  end

  def show

  end
  
  def get_data
    files_scope = Irm::Attachment.list_all
    files_scope = files_scope.match_value("#{Irm::AttachmentVersion.table_name}.data_file_name",params[:data_file_name])
    files_scope = files_scope.match_value("#{Irm::Attachment.table_name}.description",params[:description])

    files,count = paginate(files_scope)
    respond_to do |format|
      format.json  {render :json => to_jsonp(files.to_grid_json(['0',:private_flag, :category_id,:description, :data_file_name, :data_content_type, :data_file_size, :data_updated_at, :status_code, :category_name, :version_id], count)) }
    end
  end

  def destroy
    @file = Irm::Attachment.find(params[:id])
    respond_to do |format|
      if @file.destroy
          format.html { redirect_to({:action=>"index"}, :notice =>t(:successfully_created)) }
          format.xml  { render :xml => @flex_value, :status => :created, :location => @file }
      else
         @error = @file
         format.html { render "error_message" }
      end
    end
  end

  def get_version_files
    
  end
  
  def remove_version_file
    
  end
end