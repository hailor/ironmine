class Irm::ViewColumn < ActiveRecord::Base
  set_table_name :irm_view_columns

  #多语言关系
  attr_accessor :name,:description
  has_many :view_columns_tls,:dependent => :destroy
  acts_as_multilingual

  # 验证规则
  validates_presence_of :filter_type,:column_code,:table_name,:column_name,:column_data_type
  validates_uniqueness_of :filter_type,:scope=>[:column_code], :if => Proc.new { |i| !i.filter_type.blank?&&!i.column_code.blank? }

  #加入activerecord的通用方法和scope
  query_extend
  #设置column_code
  before_validation :set_column_code

  scope :query_by_filter_type,lambda{|filter_type|
    where(:filter_type=>filter_type)
  }

  scope :query_by_column_code,lambda{|column_code|
    where(:column_code=>column_code)
  }


  private
  def set_column_code
    return true if self.column_code
    self.column_code = self.table_name.upcase+"_"+self.column_name.upcase
    self.column_code = self.column_code.slice(self.column_code.length-30,self.column_code.length) if self.column_code.length>30
  end
end
