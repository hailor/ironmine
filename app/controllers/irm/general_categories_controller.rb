class Irm::GeneralCategoriesController < ApplicationController
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @general_category = Irm::GeneralCategory.list_all.where(:id => params[:id]).first()

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @general_category }
    end
  end

  def new
    @general_category = Irm::GeneralCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @general_category }
    end
  end

  def edit
    @general_category = Irm::GeneralCategory.find(params[:id])
  end

  def create
    @general_category = Irm::GeneralCategory.new(params[:irm_general_category])
    @general_category.category_type = params[:irm_general_category][:category_type]
    @general_category.segment1 = "" if params[:irm_general_category][:segment1].blank?
    @general_category.segment2 = "" if params[:irm_general_category][:segment2].blank?
    @general_category.segment3 = "" if params[:irm_general_category][:segment3].blank?
    if params[:commit]
      respond_to do |format|
        if @general_category.save
          format.html { redirect_to({:action=>"index"}, :notice =>t(:successfully_created)) }
          format.xml  { render :xml => @general_category, :status => :created, :location => @general_category }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @general_category.errors, :status => :unprocessable_entity }
        end
      end
    else
      @general_category.segment1 = ""
      @general_category.segment2 = ""
      @general_category.segment3 = ""
      respond_to do |format|
          format.html { render({:action=>"new"}) }
          format.xml  { render :xml => @general_category, :status => :created, :location => @general_category }
      end
    end
  end

  def update
    @general_category = Irm::GeneralCategory.find(params[:id])
    @general_category.category_type = params[:irm_general_category][:category_type]
    if !params[:irm_general_category][:segment3]
      params[:irm_general_category] = params[:irm_general_category].merge({:segment3 => ""})
    end
    if !params[:irm_general_category][:segment2]
      params[:irm_general_category] = params[:irm_general_category].merge({:segment2 => ""})
    end    

    if params[:commit]
      respond_to do |format|
        if @general_category.update_attributes(params[:irm_general_category])
          format.html { redirect_to({:action=>"index"}, :notice => t(:successfully_updated)) }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @general_category.errors, :status => :unprocessable_entity }
        end
      end
    else
      @general_category.segment1 = ""
      @general_category.segment2 = ""
      @general_category.segment3 = ""
      respond_to do |format|
          format.html { render({:action=>"edit"}) }
          format.xml  { render :xml => @general_category, :status => :created, :location => @general_category }
      end
    end    
  end

  def destroy
    @general_category = Irm::GeneralCategory.find(params[:id])
    @general_category.destroy

    respond_to do |format|
      format.html { redirect_to(general_categories_url) }
      format.xml  { head :ok }
    end
  end

  def get_data
    general_categories_scope = Irm::GeneralCategory.list_all
    general_categories,count = paginate(general_categories_scope)
    respond_to do |format|
      format.json  {render :json => to_jsonp(general_categories.to_grid_json([:company_name, :segment1_name, :segment2_name, :segment3_name, :concat_segment_name, :status_code, :category_type_name], count)) }
    end
  end  
end
