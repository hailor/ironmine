class Irm::FormulaFunction < ActiveRecord::Base
  set_table_name :irm_formula_functions

  query_extend

  #多语言关系
  attr_accessor :description
  has_many :formula_functions_tls,:dependent => :destroy
  acts_as_multilingual(:columns =>[:description],:required=>[])

  def guide
    "#{self.function_code}(#{self.parameters})"
  end
end
