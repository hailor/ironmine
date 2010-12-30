class Irm::IdFlexStructuresController < ApplicationController
  def index
    @id_flex = Irm::IdFlex.where(:id_flex_code => params[:id_flex_code]).first() if params[:id_flex_code]

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @id_flex }
    end
  end

  def create_entry
    id_flex = Irm::IdFlex.where(:id_flex_code => params[:id_flex_code]).first()
    id_flex_structure_code = params["c1"]
    id_flex_structure_name = params["c2"]
    description = params["c3"]
    status_code = params["c4"]

    @mode = params["!nativeeditor_status"]

    @id = params["gr_id"]
    case @mode
      when "inserted"
        @id_flex_structure = Irm::IdFlexStructure.new({:id_flex_code => id_flex.id_flex_code, :id_flex_num => Irm::IdFlexStructure.generate_flex_num(id_flex.id_flex_code),
                                                      :id_flex_structure_code => id_flex_structure_code, :id_flex_structure_name => id_flex_structure_name,
                                                      :description => description, :status_code => status_code})
        @id_flex_structure.save
        @id = @id_flex_structure.id
        @tid = @id_flex_structure.id
      when "updated"
        #no exists
        if !Irm::IdFlexStructure.exists?(@id)
          @id_flex_structure = Irm::IdFlexStructure.new({:id_flex_code => id_flex.id_flex_code, :id_flex_num => Irm::IdFlexStructure.generate_flex_num(id_flex.id_flex_code),
                                                        :id_flex_structure_code => id_flex_structure_code, :id_flex_structure_name => id_flex_structure_name,
                                                        :description => description, :status_code => status_code})
          @id_flex_structure.save
          @id = @id_flex_structure.id
          @tid = @id_flex_structure.id
        else
          @id_flex_structure=Irm::IdFlexStructure.find(@id)
          @id_flex_structure.update_attributes({:id_flex_structure_code => id_flex_structure_code, :id_flex_structure_name => id_flex_structure_name,
                                                :description => description, :status_code => status_code})
          @id = @id_flex_structure.id
          @tid = @id_flex_structure.id
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
          page << "pre_init_partial('#container1');"
        end
      end
      format.xml  { render :xml => @id_flex_structure }
    end
  end

  def get_data
    @id_flex_structures = Irm::IdFlexStructure.list_all.query_by_flex_code(params[:id_flex_code])
    respond_to do |format|
      format.json  {render :json => @id_flex_structures.to_dhtmlxgrid_json(['0',:id_flex_structure_code, :id_flex_structure_name,:description, :concatenated_segment_delimiter, :status_code,
                                                                            {:value => 'M', :controller => 'irm/id_flex_structures',:action =>  'multilingual_edit', :id => 'id', :action_type => 'multilingual',:view_port=>'data_area', :script => ''}],
                                                                           @id_flex_structures.size) }
    end
  end

  def multilingual_edit
    @id_flex_structure = Irm::IdFlexStructure.find(params[:id])
  end

  def multilingual_update
    @id_flex_structure = Irm::IdFlexStructure.find(params[:id])
    @id_flex_structure.not_auto_mult=true
    respond_to do |format|
      if @id_flex_structure.update_attributes(params[:irm_flex_structure])
        format.html { redirect_to({:action=>"multilingual_edit",:format=>"js"}, :notice => t(:successfully_updated)) }
      else
        format.html { render({:action=>"multilingual_edit"}) }
      end
    end
  end  
end