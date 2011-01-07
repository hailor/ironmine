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
end