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
    @task.start_at = @task.start_at.strftime("%F") + " " + params[:start_at_h]
    @task.end_at = @task.end_at.strftime("%F") + " " + params[:end_at_h]
    rrule = {}
    #从星期一开始
    rrule = rrule.merge({:wkst => "MO"})
    #如果创建周期标识打开
    if params[:is_recurrence] == Irm::Constant::SYS_YES
      rrule = rrule.merge({:until => DateTime.strptime(params[:recurrence_end_at], '%Y-%m-%d').strftime("%Y%m%d") + "T000000Z"})
      if params[:rectype] == "DAILY"
        #频率: 每天
        rrule = rrule.merge({:freq => "DAILY"})
        if params[:recd] == "EVERYDAY"
          #间隔: 1
          rrule = rrule.merge({:interval => "1"})
        elsif params[:recd] == "CUSTOM"
          #间隔: 用户输入
          cus_freq = params[:recurrence_daily_cus_freq]
          cus_freq = 1 if !cus_freq || cus_freq.blank?
          rrule = rrule.merge({:interval => cus_freq})
        end
      elsif params[:rectype] == "WEEKLY"
        #频率: 每星期
        rrule = rrule.merge({:freq => "WEEKLY"})
        ws = ""
        params[:recurrence_every_week].each do |w|
          ws << "," unless ws.blank?
          ws << w[1]
        end
        #指定一星期中的某天
        rrule = rrule.merge({:byday => ws})
      elsif params[:rectype] == "MONTHLY"
        #频率: 每月
        rrule = rrule.merge({:freq => "MONTHLY"})
        if params[:recm] == "DAY"
          #每几个月
          rrule = rrule.merge({:interval => params[:recurrence_on_every_month_0]})
          #第几天
          rrule = rrule.merge({:bymonthday => params[:recurrence_on_day_of_month]})
        elsif params[:recm] == "WEEK"
          #每几个月
          rrule = rrule.merge({:interval => params[:recurrence_on_every_month_1]})
          #第几个礼拜几
          rrule = rrule.merge({:byday => params[:recurrence_week_ordinal] + params[:recurrence_on_month_weekdays]})
        end
      end
    end

    @task.rrule = rrule
    @task.color = "000000"
    respond_to do |format|
      if @task.save
        #
        @task.copy_recurrences
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
    @task.color = "000000"
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
