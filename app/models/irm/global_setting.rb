class Irm::GlobalSetting < ActiveRecord::Base
  set_table_name :irm_global_setting

  has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }  
end
