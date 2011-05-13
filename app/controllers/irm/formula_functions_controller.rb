class Irm::FormulaFunctionsController < ApplicationController

  def formula_function_options
    formula_functions_scope = Irm::FormulaFunction.multilingual.where(:function_type=>params[:formula_function_type]).order(:id)

    formula_functions = formula_functions_scope.collect{|i| {:label=>i.function_code, :guide=>i.guide,:value=>i.function_code,:description=>i[:description],:id=>i.id}}
    respond_to do |format|
      format.json {render :json=>formula_functions.to_grid_json([:label,:value,:description,:guide], formula_functions.count)}
    end
  end


  def check_syntax
    @message = I18n.t(:label_irm_formula_function_syntax_miss_parameter)
    if params[:formula_value].present?&&params[:data_type].present?
      text,formula_value = Irm::FormulaContext.new.validate(params[:formula_value],params[:data_type])
      if(text.present?)
        @message = text.to_s
      else
        @message = I18n.t(:label_irm_formula_function_syntax_return_value)+":"+ formula_value.to_s
      end
    end
    respond_to do |format|
      format.js
    end
  end

end