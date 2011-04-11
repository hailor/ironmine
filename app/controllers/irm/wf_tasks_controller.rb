class Irm::WfTasksController < ApplicationController
  
  def index
#    @month = (params[:month] || (Time.zone || Time).now.month).to_i
#    @year = (params[:year] || (Time.zone || Time).now.year).to_i
#
#    @shown_month = Date.civil(@year, @month)
#
#    @event_strips = Irm::CalendarTask.event_strips_for_month(@shown_month)
  end

  def quick_show
    @task = Irm::WfTask.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def edit
    @task = Irm::WfTask.find(params[:id])


  end

  def new
    @task = Irm::WfTask.new
    respond_to do |format|
      format.html
    end
  end

  def create
    @task = Irm::WfTask.new(params[:irm_wf_task])
    @task.color = "#ffffff"
    respond_to do |format|
      if @task.save
        format.html { redirect_to({:controller => "wf_tasks", :action=>"index"}, :notice =>t(:successfully_created)) }
        format.xml  { render :xml => @task, :status => :created, :location => @task }
      else
        format.html { redirect_to({:action=>"new"})}
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @task = Irm::WfTask.find(params[:id])
    @task.color = "#ffffff"
    respond_to do |format|
      if @task.update_attributes(params[:irm_wf_task])
        format.html { redirect_to({:controller => "wf_tasks", :action=>"index"}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
    @task = Irm::WfTask.find(params[:id])
  end

  def get_data
    tasks_scope = Irm::WfTask.where("1=1")

    tasks,count = paginate(tasks_scope)
    respond_to do |format|
      format.json  {render :json => to_jsonp(tasks.to_grid_json([:name,:start_at,:end_at,:color,:status_code], count)) }
    end
  end
  
end
