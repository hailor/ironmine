class Irm::TodoTasksController < ApplicationController
  def index

  end

  def get_data
    tasks_scope = Irm::TodoTask.with_all.with_task_status.with_priority.uncompleted.with_calendar
    tasks,count = paginate(tasks_scope)
    respond_to do |format|
      format.json  {render :json => to_jsonp(tasks.to_grid_json([:name,:start_at,:end_at,:due_date, :color,:status_code,:description,
                                                                 :assigned_name, :priority_name, :task_status_name], count)) }
    end
  end

  def get_top_data
    tasks_scope = Irm::TodoTask.with_all.with_task_status.with_priority.uncompleted.with_calendar
    tasks,count = paginate(tasks_scope)
    respond_to do |format|
      format.json  {render :json => to_jsonp(tasks.to_grid_json([:name,:start_at,:end_at,:due_date, :color,:status_code,:description,
                                                                 :assigned_name, :priority_name, :task_status_name], count)) }
    end
  end

  def new
    @task = Irm::TodoTask.new
    #防止在新建页面, 从侧边栏又选择新建任务时,完成后又回到新建页面
    @return_url=request.env['HTTP_REFERER'] if request.env['HTTP_REFERER'] != url_for(:controller => "todo_tasks", :action => "new")
    respond_to do |format|
      format.html
    end
  end

  def create
    @task = Irm::TodoTask.new(params[:irm_todo_task])

    @task.start_at = Time.now
    @task.calendar_id = Irm::Calendar.current_calendar(params[:assigned_to]).id
    rrule = {}
    #从星期一开始
    rrule = rrule.merge({:wkst => "MO"})
    #如果创建周期标识打开
    if params[:is_recurrence] == Irm::Constant::SYS_YES
      #如果创建周期标识打开,任务的超期日期只允许为开始日期当天
      @task.start_at = params[:recurrence_start_at]
      @task.due_date = @task.start_at.strftime("%F") + "T235959Z"

      rrule = rrule.merge({:until => DateTime.strptime(params[:recurrence_end_at], '%Y-%m-%d').strftime("%Y%m%d") + "T235959Z"})
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

    return_url = params[:return_url]
    respond_to do |format|
      if @task.save
        @task.copy_recurrences if params[:is_recurrence] == Irm::Constant::SYS_YES
        if return_url && !return_url.blank?
          format.html { redirect_to(return_url, :notice =>t(:successfully_created)) }
          format.xml  { render :xml => @task, :status => :created, :location => @task }
        else
          format.html { redirect_to({:controller => "irm/todo_tasks", :action=>"my_tasks_index"}, :notice =>t(:successfully_created)) }
          format.xml  { render :xml => @task, :status => :created, :location => @task }
        end

      else
        format.html { redirect_to({:action=>"new"})}
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @task = Irm::TodoTask.find(params[:id])
    @return_url=request.env['HTTP_REFERER']
  end

  def update
    @task = Irm::TodoTask.find(params[:id])

    calendar_id = Irm::Calendar.current_calendar(params[:assigned_to]).id
    return_url = params[:return_url]
    respond_to do |format|
      if @task.update_attributes(params[:irm_todo_task]) && @task.update_attributes(:calendar_id => calendar_id)
        if return_url && !return_url.blank?
          format.html { redirect_to(return_url, :notice =>t(:successfully_created)) }
          format.xml  { render :xml => @task, :status => :created, :location => @task }
        else
          format.html { redirect_to({:controller => "irm/todo_tasks", :action=>"my_tasks_index"}, :notice => t(:successfully_updated)) }
          format.xml  { head :ok }
        end
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
    @task = Irm::TodoTask.with_all.with_task_status.with_calendar.with_priority.where("#{Irm::TodoTask.table_name}.id = ?", params[:id]).first
  end

  def my_tasks_index

  end

  def my_tasks_get_data
    my_tasks_scope = Irm::TodoTask.with_all.with_task_status.with_priority.uncompleted.with_calendar.assigned_to(Irm::Person.current.id)
    my_tasks,count = paginate(my_tasks_scope)
    respond_to do |format|
      format.json {render :json => to_jsonp(my_tasks.to_grid_json([:name,:start_at,:end_at,:due_date, :color,:status_code, :assigned_name, :priority_name, :event_status_name], count))}
    end
  end

  def edit_recurrence

  end

  def update_recurrence

  end
end