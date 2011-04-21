class Irm::FiltersController < ApplicationController
  skip_before_filter :menu_setup
  before_filter :filters_menu  , :except => [:operator_value]
  # Date.today.prev_month.at_beginning_of_month
  # Date.today.at_beginning_of_week-1

  def index
    redirect_to({:action => "new"})
  end

  def new
    @rule_filter = Irm::RuleFilter.new({:filter_type=>"PAGE_FILTER",:bo_code=>params[:bc],:source_code=>params[:sc]})
    0.upto 4 do |index|
      @rule_filter.rule_filter_criterions.build({:seq_num=>index+1})
    end
  end

  def create

    @rule_filter = Irm::RuleFilter.new(params[:irm_rule_filter])
    params[:sc] = @rule_filter.source_code
    params[:bc] = @rule_filter.bo_code
    #@rule_filter.view_filter_criterions.each  do |fc|
    #    fc[:view_code] = @view_filter[:view_code]
    #    fc.view_filter = @view_filter
    #end
    @rule_filter.own_id = Irm::Person.current.id

    respond_to do |format|
      if @rule_filter.save
        format.html {redirect_back}
        format.xml  {redirect_back}
      else
        format.html { render "new" }
        format.xml  { render :xml => @view_filter.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @rule_filter = Irm::RuleFilter.find(params[:id])
  end

  def update
    @rule_filter = Irm::RuleFilter.find(params[:id])

    respond_to do |format|
      if @rule_filter.update_attributes(params[:irm_rule_filter])
        format.html {redirect_back}
        format.xml  {redirect_back}
      else
        format.html { render "edit" }
        format.xml  { render :xml => @action.errors, :status => :unprocessable_entity }
      end
    end
  end

  def operator_value
    @object_attribute = Irm::ObjectAttribute.query(params[:attribute_id]).first
    @rule_filter_criterion = Irm::RuleFilterCriterion.new(:seq_num=>params[:seq_num])
    num = (params[:seq_num]||1).to_i-1
    @named_form = "irm_rule_filter[rule_filter_criterions_attributes][#{num}]"
  end


  private

  def filters_menu
    controller_action = params[:pca].split("#")
    permission = {:page_controller=>controller_action[0],:page_action=>controller_action[1]}
    process_menu(permission)
  end

  def redirect_back
    redirect_back_or_default
  end

end
