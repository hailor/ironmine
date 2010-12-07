class Irm::Language < ActiveRecord::Base
  set_table_name :irm_languages
  #多语言关系
  attr_accessor :description
  has_many :languages_tls,:dependent => :destroy
  acts_as_multilingual({:columns=>[:description],:required=>[]})
  
  validates_presence_of :language_code
  validates_uniqueness_of :language_code, :if => Proc.new { |i| !i.language_code.blank? }

  #加入activerecord的通用方法和scope
  query_extend

  #返回当前所处语言对应的code,description ,用于设置语言
  scope :current_code_description,lambda{
    joins(:languages_tls).
    select("#{table_name}.language_code,#{Irm::LanguagesTl.table_name}.description").
    where("#{Irm::LanguagesTl.table_name}.language = ?", I18n.locale)
  }
  #返回安装状态为已经安装的数据
  scope :installed,where(:installed_flag=>Irm::Constant::SYS_YES)
  #返回语言编码
  scope :query_code,select("#{table_name}.language_code")

end
