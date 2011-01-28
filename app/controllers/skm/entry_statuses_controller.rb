class Skm::EntryStatusesController < ApplicationController
  def index
    @entry_status = Skm::EntryStatus.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @entry_status }
    end
  end

  def show
    @entry_status = Skm::EntryStatus.multilingual.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @entry_status }
    end
  end

  def new
    @entry_status = Skm::EntryStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @entry_status }
    end
  end

  def edit
    @entry_status = Skm::EntryStatus.multilingual.find(params[:id])
  end

  def create
    @entry_status = Skm::EntryStatus.new(params[:skm_entry_status])
    respond_to do |format|
      if @entry_status.save
        format.html { redirect_to({:action=>"index"}, :notice =>t(:successfully_created)) }
        format.xml  { render :xml => @entry_status, :status => :created, :location => @entry_status }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @entry_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @entry_status = Skm::EntryStatus.find(params[:id])

    respond_to do |format|
      if @entry_status.update_attributes(params[:skm_entry_status])
        format.html { redirect_to({:action=>"index"}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @entry_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  def get_data
    entry_statuses_scope = Skm::EntryStatus.multilingual.status_meaning
    entry_statuses,count = paginate(entry_statuses_scope)
    respond_to do |format|
      format.json  {render :json => to_jsonp(entry_statuses.to_grid_json(['0',:entry_status_code, :visiable_flag, :name,:description,:status_meaning, :status_code], count)) }
    end
  end
end