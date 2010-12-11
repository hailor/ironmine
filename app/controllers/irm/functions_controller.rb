class Irm::FunctionsController < ApplicationController
  def index
    @function = Irm::Function.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @function }
    end
  end

  def show
    @function = Irm::Function.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @function }
    end
  end

  def new
    @function = Irm::Function.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @function }
    end
  end

  def edit
    @function = Irm::Function.multilingual.find(params[:id])
  end

  def create
    @function = Irm::Function.new(params[:irm_function])
    respond_to do |format|
      if @function.save
        flash[:successful_message] = (t :successfully_created)
        format.html { render "successful_info" }        
      else
         @error = @function
         format.html { render "error_message" }
      end
    end
  end

  def update
    @function = Irm::Function.find(params[:id])

    respond_to do |format|
      if @function.update_attributes(params[:irm_function])
        flash[:successful_message] = (t :successfully_updated)
        format.html { render "successful_info" }
      else
        @error = @function
        format.html { render "error_message" }
      end
    end
  end

  def destroy
    @function = Irm::Function.find(params[:id])
    @function.destroy

    respond_to do |format|
      format.html { redirect_to(functions_url) }
      format.xml  { head :ok }
    end
  end

  def multilingual_edit
    @function = Irm::Function.find(params[:id])
  end

  def multilingual_update
    @function = Irm::Function.find(params[:id])
    @function.not_auto_mult=true
    respond_to do |format|
      if @function.update_attributes(params[:irm_function])
        format.html { redirect_to({:action=>"multilingual_edit",:format=>"js"}, :notice => t(:successfully_updated)) }
      else
        format.html { render({:action=>"multilingual_edit"}) }
      end
    end
  end

  def get_data
    @functions = Irm::Function.multilingual.all
    respond_to do |format|
      format.json  {render :json => @functions.to_dhtmlxgrid_json(['0',:function_code,:name,
                                                                     :description, :status_code,
                                                                    {:value => 'M', :controller => 'irm/functions',:action =>  'multilingual_edit', :id => 'id', :action_type => 'multilingual',:view_port=>'data_area', :script => ''}
                                                                    ], @functions.size) }
    end
  end

  def permission_index
    
  end
end
