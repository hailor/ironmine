class Irm::SystemParameter < ActiveRecord::Base
  set_table_name :irm_system_parameters
  has_attached_file :img
  validates_attachment_size :img, :less_than => Irm::SystemParametersManager.upload_file_limit.kilobytes

  #多语言关系
  attr_accessor :name, :description
  has_many :system_parameters_tls, :dependent => :destroy
  acts_as_multilingual

  validates_presence_of :parameter_code
  validates_uniqueness_of :parameter_code, :if => Proc.new { |i| !i.parameter_code.blank? }
  validates_format_of :parameter_code, :with => /^[A-Z0-9_]*$/ ,:if=>Proc.new{|i| !i.parameter_code.blank?}

  query_extend

  scope :select_all, lambda{
    select("#{table_name}.*, spt.name name, spt.description description").
        joins(",#{Irm::SystemParametersTl.table_name} spt").
        where("#{table_name}.id = spt.system_parameter_id").
        where("spt.language = ?", I18n.locale)
  }

  scope :query_by_code, lambda{|parameter_code|
    where("#{table_name}.parameter_code = ?", parameter_code)
  }

  scope :query_by_type, lambda{|content_type|
    where("#{table_name}.content_type = ?", content_type)
  }
end