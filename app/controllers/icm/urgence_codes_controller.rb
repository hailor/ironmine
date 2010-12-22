class Icm::UrgenceCodesController < ApplicationController
  def index
    @urgence_code = Icm::UrgenceCode.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @urgence_code }
    end
  end

  def show
    @urgence_code = Icm::UrgenceCode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @urgence_code }
    end
  end

  def new
    @urgence_code = Icm::UrgenceCode.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @urgence_code }
    end
  end

  def edit
    @urgence_code = Icm::UrgenceCode.multilingual.find(params[:id])
  end

  def create
    @urgence_code = Icm::UrgenceCode.new(params[:icm_urgence_code])
    respond_to do |format|
      if @urgence_code.save
        flash[:successful_message] = (t :successfully_created)
        format.html { render "successful_info" }
      else
         @error = @urgence_code
         format.html { render "error_message" }
      end
    end
  end

  def update
    @urgence_code = Icm::UrgenceCode.find(params[:id])

    respond_to do |format|
      if @urgence_code.update_attributes(params[:icm_urgence_code])
        flash[:successful_message] = (t :successfully_updated)
        format.html { render "successful_info" }
      else
        @error = @urgence_code
        format.html { render "error_message" }
      end
    end
  end

  def destroy
    @urgence_code = Icm::UrgenceCode.find(params[:id])
    @urgence_code.destroy

    respond_to do |format|
      format.html { redirect_to(permissions_url) }
      format.xml  { head :ok }
    end
  end

  def multilingual_edit
    @urgence_code = Icm::UrgenceCode.find(params[:id])
  end

  def multilingual_update
    @urgence_code = Icm::UrgenceCode.find(params[:id])
    @urgence_code.not_auto_mult=true
    respond_to do |format|
      if @urgence_code.update_attributes(params[:icm_urgence_code])
        format.html { redirect_to({:action=>"multilingual_edit",:format=>"js"}, :notice => t(:successfully_updated)) }
      else
        format.html { render({:action=>"multilingual_edit"}) }
      end
    end
  end

  def get_data
    @urgence_codes = Icm::UrgenceCode.multilingual.list_all
    respond_to do |format|
      format.json  {render :json => @urgence_codes.to_dhtmlxgrid_json(['0',:name,:urgency_code,
                                                                     :company_name,:weight_values,
                                                                    {:value => 'M', :controller => 'icm/urgence_codes',:action =>  'multilingual_edit', :id => 'id', :action_type => 'multilingual',:view_port=>'data_area', :script => ''}
                                                                    ], @urgence_codes.size) }
    end
  end  
end
