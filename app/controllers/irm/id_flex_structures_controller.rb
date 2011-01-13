class Irm::IdFlexStructuresController < ApplicationController
  def index
    @id_flex = Irm::IdFlex.where(:id_flex_code => params[:id_flex_code]).first() if params[:id_flex_code]
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @id_flex_structure = Irm::IdFlexStructure.multilingual.find(params[:id])
    @return_url=request.env['HTTP_REFERER']    
  end

  def new
    @id_flex_structure = Irm::IdFlexStructure.new
    @id_flex_structure.id_flex_code = params[:id_flex_code]
    @id_flex = Irm::IdFlex.where(:id_flex_code => params[:id_flex_code]).first()
    @return_url=request.env['HTTP_REFERER']
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @id_flex_structure }
    end
  end

  def edit
    @id_flex_structure = Irm::IdFlexStructure.multilingual.find(params[:id])
    @return_url=request.env['HTTP_REFERER']
  end
  
  def create
    @id_flex_structure = Irm::IdFlexStructure.new(params[:irm_id_flex_structure])
    @id_flex_structure.id_flex_num = Irm::IdFlexStructure.generate_flex_num(@id_flex_structure.id_flex_code)
    return_url = params[:return_url]
    respond_to do |format|
      if @id_flex_structure.save
        if return_url.blank?
          format.html { redirect_to({:action=>"index", :id_flex_code => @id_flex_structure.id_flex_code}, :notice =>t(:successfully_created)) }
          format.xml  { render :xml => @id_flex_structure, :status => :created, :location => @id_flex_structure }
        else
          format.html { redirect_to(return_url, :notice =>t(:successfully_created)) }
          format.xml  { render :xml => @id_flex_structure, :status => :created, :location => @id_flex_structure }
        end
      else
        @id_flex = Irm::IdFlex.where(:id_flex_code => @id_flex_structure.id_flex_code).first()
        format.html { render :action => "new"}
        format.xml  { render :xml => @id_flex_structure.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @id_flex_structure = Irm::IdFlexStructure.find(params[:id])
    return_url = params[:return_url]
    respond_to do |format|
      if @id_flex_structure.update_attributes(params[:irm_id_flex_structure])
        if return_url.blank?
          format.html { redirect_to({:action=>"index", :id_flex_code => @id_flex_structure.id_flex_code}, :notice => t(:successfully_updated)) }
          format.xml  { head :ok }
        else
          format.html { redirect_to(return_url, :notice =>t(:successfully_created)) }
          format.xml  { head :ok }
        end
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @id_flex_structure.errors, :status => :unprocessable_entity }
      end
    end
  end

  def get_data
    id_flex_structures_scope = Irm::IdFlexStructure.list_all.query_by_flex_code(params[:id_flex_code])
    id_flex_structures,count = paginate(id_flex_structures_scope)
    respond_to do |format|
      format.json  {render :json => to_jsonp(id_flex_structures.to_grid_json([:id_flex_structure_code, :id_flex_structure_name,:description, :concatenated_segment_delimiter, :status_code], count)) }
    end          
  end

  def select_parent
    redirect_to :action => "index", :id_flex_code => params[:id_flex][:id_flex_code]
  end
end