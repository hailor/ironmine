class Irm::IdFlexSegmentsController < ApplicationController
  def index
    @id_flex_structure = Irm::IdFlexStructure.list_all.where(:id => params[:id_flex_structure_id]).first()
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @id_flex_structure }
    end
  end

  def create_entry
    id_flex_structure = Irm::IdFlexStructure.find(params[:id_flex_structure_id])
    segment_num = params["c1"]
    id_flex_segment_code = params["c2"]
    form_left_prompt = params["c3"]
    description = params["c4"]
    status_code = params["c5"]

    @mode = params["!nativeeditor_status"]

    @id = params["gr_id"]
    case @mode
      when "inserted"
        @id_flex_segment = Irm::IdFlexSegment.new({:id_flex_code => id_flex_structure.id_flex_code, :id_flex_num => id_flex_structure.id_flex_num,
                                                      :segment_num => segment_num, :segment_name => id_flex_segment_code,
                                                      :form_left_prompt => form_left_prompt, :description => description, :status_code => status_code})
        @id_flex_segment.save
        @id = @id_flex_segment.id
        @tid = @id_flex_segment.id
      when "updated"
        #no exists
        if !Irm::IdFlexSegment.exists?(@id)
          @id_flex_segment = Irm::IdFlexSegment.new({:id_flex_code => id_flex_structure.id_flex_code, :id_flex_num => id_flex_structure.id_flex_num,
                                                      :segment_num => segment_num, :segment_name => id_flex_segment_code,
                                                      :form_left_prompt => form_left_prompt, :description => description, :status_code => status_code})
          @id_flex_segment.save
          @id = @id_flex_segment.id
          @tid = @id_flex_segment.id
        else
          @id_flex_segment=Irm::IdFlexSegment.find(@id)
          @id_flex_segment.update_attributes({:segment_num => segment_num,:form_left_prompt => form_left_prompt, :description => description, :status_code => status_code})
          @id = @id_flex_segment.id
          @tid = @id_flex_segment.id
        end
    end
  end

  def show_parent
    @id_flex = Irm::IdFlex.where(:id_flex_code => params[:id_flex_code]).first()
    respond_to do |format|
      format.html # index.html.erb
      format.js do
        render do |page|
          page.replace_html(:container1, render(:partial => 'show_parent', :locals => { :@id_flex => @id_flex }))
          page.replace_html(:container2, render(:partial => 'data_grid', :locals => { :@id_flex => @id_flex }))
          page << "init('#data_area');"
        end
      end
      format.xml  { render :xml => @id_flex_structure }
    end    
  end

  def get_data
    @id_flex_segments = Irm::IdFlexSegment.list_all(params[:id_flex_structure_id])
    respond_to do |format|
      format.json  {render :json => @id_flex_segments.to_dhtmlxgrid_json(['0',:segment_num, :segment_name, :form_left_prompt, :description, :status_code,
                                                                         {:value => 'M', :controller => 'irm/id_flex_segments',:action =>  'multilingual_edit', :id => 'id', :action_type => 'multilingual',:view_port=>'data_area', :script => ''}], @id_flex_segments.size) }
    end
  end

  def multilingual_edit
    @id_flex_segment = Irm::IdFlexSegment.find(params[:id])
  end

  def multilingual_update
    @id_flex_segment = Irm::IdFlexSegment.find(params[:id])
    @id_flex_segment.not_auto_mult=true
    respond_to do |format|
      if @id_flex_segment.update_attributes(params[:irm_flex_segment])
        format.html { redirect_to({:action=>"multilingual_edit",:format=>"js"}, :notice => t(:successfully_updated)) }
      else
        format.html { render({:action=>"multilingual_edit"}) }
      end
    end
  end    
end