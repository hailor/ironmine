class Icm::RuleSettingsController < ApplicationController
  def index
    @rule_setting = Icm::RuleSetting.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rule_setting }
    end
  end

  def show
    @rule_setting = Icm::RuleSetting.list_all.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @rule_setting }
    end
  end

  def new
    @rule_setting = Icm::RuleSetting.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rule_setting }
    end
  end

  def edit
    @rule_setting = Icm::RuleSetting.list_all.find(params[:id])
  end

  def create
    @rule_setting = Icm::RuleSetting.new(params[:icm_rule_setting])
    respond_to do |format|
      if @rule_setting.save
        flash[:successful_message] = (t :successfully_created)
        format.html { render "index" }
      else
         format.html { render "new" }
      end
    end
  end

  def update
    @rule_setting = Icm::RuleSetting.find(params[:id])

    respond_to do |format|
      if @rule_setting.update_attributes(params[:icm_rule_setting])
        flash[:successful_message] = (t :successfully_updated)
        format.html { render "index" }
      else
        @error = @rule_setting
        format.html { render "edit" }
      end
    end
  end

  def destroy
    @rule_setting = Icm::RuleSetting.find(params[:id])
    @rule_setting.destroy

    respond_to do |format|
      format.html { redirect_to(:action=>"index") }
      format.xml  { head :ok }
    end
  end

  def get_data
    @rule_settings = Icm::RuleSetting.list_all
    @rule_settings,count = paginate(@rule_settings)
    respond_to do |format|
      format.json  {render :json => to_jsonp(@rule_settings.to_grid_json(['0',:company_name,:process_name,
                                                                     :report_date_changable,:slove_date_changable,:respond_date_changable,
                                                                     :auto_assignable,:auto_closure_days,:status_meaning], count)) }
    end
  end
end
