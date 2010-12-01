class Irm::Permission < ActiveRecord::Base
  set_table_name :irm_permissions

  #多语言关系
  attr_accessor :name,:description
  has_many :permissions_tls,:dependent => :destroy
  acts_as_multilingual

  # 验证权限编码唯一性
  validates_presence_of :permission_code,:page_controller,:page_action
  validates_uniqueness_of :permission_code, :if => Proc.new { |i| !i.permission_code.blank? }
  validates_format_of :permission_code, :with => /^[A-Z0-9_]*$/ ,:if=>Proc.new{|i| !i.permission_code.blank?}

  #通过controller,action确定permission
  scope :position,lambda {|controller,action| where("page_controller = ? AND page_action = ?", controller,action) }

  def public?
    false
  end

end
