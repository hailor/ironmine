class Irm::IdFlexSegmentsController < ApplicationController
  def index
    @id_flex_structure = Irm::IdFlexStructure.list_all.where(:id => params[:id_flex_structure_id]).first()
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @id_flex_structure }
    end
  end

  def get_data
    id_flex_segments_scope = Irm::IdFlexSegment.list_all(params[:id_flex_structure_id])
    id_flex_segments,count = paginate(id_flex_segments_scope)
    respond_to do |format|
      format.json  {render :json => to_jsonp(id_flex_segments.to_grid_json([:segment_num, :segment_name, :form_left_prompt, :description, :value_set_name, :status_code], count)) }
    end              
  end

  def show
    @id_flex_segment = Irm::IdFlexSegment.multilingual.find(params[:id])
    @id_flex_structure = Irm::IdFlexStructure.multilingual.where(:id_flex_code => @id_flex_segment.id_flex_code, :id_flex_num => @id_flex_segment.id_flex_num).first()
  end

  def edit
    @id_flex_segment = Irm::IdFlexSegment.multilingual.find(params[:id])
    @id_flex_structure = Irm::IdFlexStructure.multilingual.where(:id_flex_code => @id_flex_segment.id_flex_code, :id_flex_num => @id_flex_segment.id_flex_num).first()
  end

  def update
    @id_flex_segment = Irm::IdFlexSegment.find(params[:id])
    @id_flex_structure = Irm::IdFlexStructure.where(:id_flex_code => @id_flex_segment.id_flex_code, :id_flex_num => @id_flex_segment.id_flex_num).first()
    respond_to do |format|
      if @id_flex_segment.update_attributes(params[:irm_id_flex_segment])
        format.html { redirect_to({:controller => "irm/id_flex_structures", :action=>"show", :id => @id_flex_structure}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @id_flex_structure.errors, :status => :unprocessable_entity }
      end
    end    
  end

  def new
    @id_flex_segment = Irm::IdFlexSegment.new
    @id_flex_structure = Irm::IdFlexStructure.multilingual.where(:id_flex_code => params[:id_flex_code], :id_flex_num => params[:id_flex_num]).first()
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @id_flex_segment }
    end
  end
  
  def create
    @id_flex_segment = Irm::IdFlexSegment.new(params[:irm_id_flex_segment])
    @id_flex_structure = Irm::IdFlexStructure.multilingual.where(:id_flex_code => @id_flex_segment.id_flex_code, :id_flex_num => @id_flex_segment.id_flex_num).first()
    respond_to do |format|
      if @id_flex_segment.save
        format.html { redirect_to({:controller => "irm/id_flex_structures", :action=>"show", :id => @id_flex_structure}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "new"}
        format.xml  { render :xml => @id_flex_segment.errors, :status => :unprocessable_entity }
      end
    end
  end  
end