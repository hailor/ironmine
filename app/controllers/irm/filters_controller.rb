class Irm::FiltersController < ApplicationController
  before_filter :filters_menu, :only => [:new,:edit]
  # Date.today.prev_month.at_beginning_of_month
  # Date.today.at_beginning_of_week-1
  def new
    @view_filter = Irm::ViewFilter.new({:filter_type=>params[:ft]})
    0.upto 4 do |index|
      @view_filter.view_filter_criterions.build({:seq_num=>index+1})
    end
  end

  def create

    @view_filter = Irm::ViewFilter.new(params[:irm_view_filter])
    params[:ft] = @view_filter.filter_type
    @view_filter.view_filter_criterions.each  do |fc|
        fc[:view_code] = @view_filter[:view_code]
        fc.view_filter = @view_filter
    end
    @view_filter.own_id = Irm::Identity.current.id

    respond_to do |format|
      if @view_filter.save
        redirect_back
      else
        format.html { render "new" }
        format.xml  { render :xml => @view_filter.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @view_filter = Irm::ViewFilter.find(params[:id])
  end

  def update
    @view_filter = Irm::ViewFilter.find(params[:id])

    respond_to do |format|
      if @view_filter.update_attributes(params[:irm_view_filter])
        format.html {redirect_back}
      else
        format.html { render "edit" }
        format.xml  { render :xml => @action.errors, :status => :unprocessable_entity }
      end
    end
  end


  private

  def filters_menu
    permission = Irm::Permission.find(params[:pid])
    process_menu(permission)
  end

  def redirect_back
    redirect_back_or_default
  end

end
