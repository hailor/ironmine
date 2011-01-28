class Irm::IdFlexSegmentsController < ApplicationController
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def get_data
    id_flex_segments_scope = Irm::IdFlexSegment.list_all(params[:id_flex_structure_id])
    id_flex_segments_scope = id_flex_segments_scope.match_value("#{Irm::IdFlexSegmentsTl.table_name}.segment_name",params[:segment_name])
    id_flex_segments_scope = id_flex_segments_scope.match_value("#{Irm::IdFlexSegmentsTl.table_name}.form_left_prompt",params[:form_left_prompt])
    id_flex_segments_scope = id_flex_segments_scope.match_value("fvs.flex_value_set_name",params[:value_set_name])
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
    @return_url=request.env['HTTP_REFERER']    
    @id_flex_segment = Irm::IdFlexSegment.multilingual.find(params[:id])
    @id_flex_structure = Irm::IdFlexStructure.multilingual.where(:id_flex_code => @id_flex_segment.id_flex_code, :id_flex_num => @id_flex_segment.id_flex_num).first()
  end

  def update
    return_url = params[:return_url]    
    @id_flex_segment = Irm::IdFlexSegment.find(params[:id])
    @id_flex_structure = Irm::IdFlexStructure.where(:id_flex_code => @id_flex_segment.id_flex_code, :id_flex_num => @id_flex_segment.id_flex_num).first()
    respond_to do |format|
      if @id_flex_segment.update_attributes(params[:irm_id_flex_segment])
        if return_url.blank?
          format.html { redirect_to({:controller => "irm/id_flex_structures", :action=>"show", :id => @id_flex_structure}, :notice => t(:successfully_updated)) }
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

  def new
    @return_url=request.env['HTTP_REFERER']
    @id_flex_segment = Irm::IdFlexSegment.new
    @id_flex_structure = Irm::IdFlexStructure.multilingual.where(:id_flex_code => params[:id_flex_code], :id_flex_num => params[:id_flex_num]).first()
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @id_flex_segment }
    end
  end
  
  def create
    return_url = params[:return_url]        
    @id_flex_segment = Irm::IdFlexSegment.new(params[:irm_id_flex_segment])
    @id_flex_structure = Irm::IdFlexStructure.multilingual.where(:id_flex_code => @id_flex_segment.id_flex_code, :id_flex_num => @id_flex_segment.id_flex_num).first()
    respond_to do |format|
      if @id_flex_segment.save
        if return_url.blank?
          format.html { redirect_to({:controller => "irm/id_flex_structures", :action=>"show", :id => @id_flex_structure}, :notice => t(:successfully_updated)) }
          format.xml  { head :ok }
        else
          format.html { redirect_to(return_url, :notice =>t(:successfully_created)) }
          format.xml  { render :xml => @id_flex_segment, :status => :created, :location => @id_flex_segment }
        end
      else
        format.html { render :action => "new"}
        format.xml  { render :xml => @id_flex_segment.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy

  end
end