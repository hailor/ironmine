class Skm::EntryHeaderController < ApplicationController
  def index
    @entry_header = Skm::EntryHeader.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @entry_header }
    end
  end

  def show
    @entry_header = Skm::EntryHeader.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @entry_header }
    end
  end

  def new
    @entry_header = Skm::EntryHeader.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @entry_header }
    end
  end

  def edit
    @entry_header = Skm::EntryHeader.find(params[:id])
  end

  def create
    @entry_header = Skm::EntryHeader.new(params[:skm_entry_header])
    respond_to do |format|
      if @entry_header.save
        format.html { redirect_to({:action=>"index"}, :notice =>t(:successfully_created)) }
        format.xml  { render :xml => @entry_header, :status => :created, :location => @entry_header }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @entry_header.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @entry_header = Skm::EntryHeader.find(params[:id])

    respond_to do |format|
      if @entry_header.update_attributes(params[:skm_entry_header])
        format.html { redirect_to({:action=>"index"}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @entry_header.errors, :status => :unprocessable_entity }
      end
    end
  end

  def get_data
    entry_headers_scope = Skm::EntryHeader.status_meaning
    entry_headers,count = paginate(entry_headers_scope)
    respond_to do |format|
      format.json  {render :json => to_jsonp(entry_headers.to_grid_json(['0',:entry_status_code, :visiable_flag, :name,:description,:status_meaning], count)) }
    end
  end  
end