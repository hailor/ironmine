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
    redirect_to :action => 'index'
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
    
  end

  def update
    
  end

  def show
    
  end
  
  def get_data
    files_scope = Irm::Attachment.list_all
    files_scope = files_scope.match_value("#{Irm::AttachmentVersion.table_name}.data_file_name",params[:data_file_name])
    files_scope = files_scope.match_value("#{Irm::Attachment.table_name}.description",params[:description])

    files,count = paginate(files_scope)
    respond_to do |format|
      format.json  {render :json => to_jsonp(files.to_grid_json(['0',:private_flag, :category_id,:description, :data_file_name, :data_content_type, :data_file_size, :data_updated_at, :status_code, :category_name], count)) }
    end    
  end

  def list_files
    
  end
end