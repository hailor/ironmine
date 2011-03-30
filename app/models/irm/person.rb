require 'paperclip_processors/cropper'
include Paperclip
class Irm::Person < ActiveRecord::Base

  set_table_name :irm_people

  PERSON_NAME_FORMATS = {
    :lastname_firstname => '#{first_name} #{last_name}',
    :firstname => '#{first_name}',
    :firstname_lastname => '#{last_name}#{first_name}',
    :lastname_coma_firstname => '#{last_name},#{first_name}'
  }

  PERSON_NAME_SQL_FORMATS = {
    :lastname_firstname => " CONCAT(\#{alias_table_name}.first_name,' ',\#{alias_table_name}.last_name) \#{alias_column_name}",
    :firstname => " \#{alias_table_name}.first_name \#{alias_column_name}",
    :firstname_lastname => " CONCAT(\#{alias_table_name}.last_name,\#{alias_table_name}.first_name) \#{alias_column_name}",
    :lastname_coma_firstname =>  " CONCAT(\#{alias_table_name}.last_name,',',\#{alias_table_name}.first_name) \#{alias_column_name}"
  }

  belongs_to :identity

  validates_presence_of :last_name,:first_name,:title,:email_address,:company_id
  validates_uniqueness_of :email_address, :if => Proc.new { |i| !i.email_address.blank? }
  validates_format_of :email_address, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  has_many :person_roles
  has_many :roles, :through => :person_roles
  has_many :company_accesses
  query_extend

  has_attached_file :avatar,
                    :whiny => false,
                    :url => Irm::Constant::ATTACHMENT_URL,
                    :path => Irm::Constant::ATTACHMENT_PATH,
                    :styles => {:thumb => "16x16>",:medium => "45x45>",:large => "100x100>"},
                    :processors => [:cropper]

  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/gif", "image/png", "image/pjpeg", "image/x-png"], :message => "Accepted files include: jpg, gif, png"

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  after_update :reprocess_avatar, :if => :cropping?

  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end

  scope :query_by_identity,lambda{|identity|
    where(:identity_id=>identity)
  }

  scope :query_person_name,lambda{|person_id|select("CONCAT(#{table_name}.last_name,#{table_name}.first_name) person_name").
                           where(:id=>person_id)}

  scope :query_all_person,select("CONCAT(#{table_name}.last_name,#{table_name}.first_name) person_name,#{table_name}.id")


    scope :query_wrap_info,lambda{|language| select("#{table_name}.id,irm_identities.login_name,#{table_name}.mobile_phone,CONCAT(#{table_name}.last_name,#{table_name}.first_name) person_name,"+
                                                      "#{table_name}.email_address,v1.meaning status_meaning, v2.name company_name").
                                                   joins("left outer join irm_identities on #{table_name}.identity_id=irm_identities.id").
                                                   joins(",irm_lookup_values_vl v1").
                                                   joins(",irm_companies_vl v2").                                                   
                                                   where("v1.lookup_type='SYSTEM_STATUS_CODE' AND v1.lookup_code = #{table_name}.status_code AND "+
                                                         "v2.id=#{table_name}.company_id AND v1.language=? AND "+
                                                         "v2.language=?",language,language)}

  scope :query_show_wrap_info,lambda{|language| select("#{table_name}.*,irm_identities.login_name,#{table_name}.mobile_phone,CONCAT(#{table_name}.last_name,#{table_name}.first_name) person_name,"+
                                                      "#{table_name}.email_address,v1.meaning status_meaning, v2.name company_name," +
                                                      "iov.name organization_name,idv.name department_name," +
                                                      "irv.name region_name,isgv.name site_group_name,isv.name site_name,ilv.description notification_lang_name").
                                                   joins("left outer join irm_identities on #{table_name}.identity_id=irm_identities.id").
                                                   joins("left outer join irm_organizations_vl iov on #{table_name}.organization_id=iov.id AND iov.language = v2.language").
                                                   joins("left outer join irm_departments_vl idv on #{table_name}.department_id=idv.id AND idv.language = v2.language").
                                                   joins("left outer join irm_regions_vl irv on #{table_name}.region_code=irv.region_code AND irv.language = v2.language").
                                                   joins("left outer join irm_site_groups_vl isgv on #{table_name}.site_group_code=isgv.group_code AND isgv.language = v2.language").
                                                   joins("left outer join irm_sites_vl isv on #{table_name}.site_code=isv.site_code AND isv.language = v2.language").
                                                   joins("left outer join irm_languages_vl ilv on #{table_name}.notification_lang=ilv.language_code AND ilv.language = v2.language").
                                                   joins(",irm_lookup_values_vl v1").
                                                   where("v1.lookup_type='SYSTEM_STATUS_CODE' AND v1.lookup_code = #{table_name}.status_code AND "+
                                                         "v1.language=?",language)}
  scope :query_by_company_id,lambda{|language| joins("inner join irm_companies_vl v2").
                                               where("v2.id=#{table_name}.company_id AND "+
                                                     "v2.language=?",language)}
  scope :query_by_support_staff_flag,lambda{|support_staff_flag| where(:support_staff_flag=>support_staff_flag)}
  scope :query_choose_person,select("#{table_name}.id,CONCAT(#{table_name}.last_name,#{table_name}.first_name) person_name,#{table_name}.email_address,#{table_name}.mobile_phone")



  scope :query_by_person_name,lambda{|person_name,language,support_group_code| select("#{table_name}.id,CONCAT(#{table_name}.last_name,#{table_name}.first_name) person_name,v2.name company_name,#{table_name}.email_address,v1.meaning status_meaning").
                                                   joins(",irm_companies_vl v2").
                                                   joins(",irm_lookup_values_vl v1").
                                                   where("v1.lookup_type='SYSTEM_STATUS_CODE' AND v1.lookup_code = #{table_name}.status_code AND "+
                                                         "v2.id = #{table_name}.company_id AND v2.language = ? AND " +
                                                         "CONCAT(#{table_name}.last_name,#{table_name}.first_name) LIKE '%#{person_name}%' AND " +
                                                         "v1.language=? AND NOT EXISTS (SELECT 1 FROM #{Irm::SupportGroupMember.table_name}  where " +
                                                         "support_group_code=? AND #{Irm::SupportGroupMember.table_name}.person_id = #{table_name}.id)",language,language,support_group_code)}
  scope :query_by_ids,lambda{|ids| where("#{table_name}.id IN (?)",[""]+ids)}

  scope :include_identity ,lambda{includes(:identity)}

  scope :query_company_id,lambda{|company_id| where(:company_id=>company_id)}
  scope :query_organization_id,lambda{|organization_id| where(:organization_id=>organization_id)}
  scope :query_department_id,lambda{|department_id| where(:department_id=>department_id)}
  scope :query_site_id,lambda{|site_id| where(:site_id=>site_id)}

  scope :query_role_id,lambda{|role_id| select("#{table_name}.id").
                                        joins(:person_roles).
                                        where("#{Irm::PersonRole.table_name}.role_id = ?",role_id)}
  #取得系统当前登陆人员
  def self.current
    @current_person
  end
  #设置当前人员
  def self.current=(current_person)
    @current_person = current_person
  end

  def allowed_to?(function_codes)
    return true if function_codes.detect{|fc| functions.include?(fc)}
    return true if Irm::Role.current&&Irm::Role.current.allowed_to?(function_codes)
    return true if self.id.eql?(self.class.first.id)
    false
  end

  def functions
    return @functions if @functions
    @functions = Irm::Function.query_hidden_functions(self.id).collect{|f| f.group_code}
  end


  # 返回人员的全名
  def name(formatter = nil)
      eval('"' + (PERSON_NAME_FORMATS[:firstname_lastname]) + '"')
  end
  # 取得人员全名的SQL
  def self.name_to_sql(formatter = nil,alias_table_name="#{table_name}",alias_column_name="name")
    eval('"' +PERSON_NAME_SQL_FORMATS[:firstname_lastname] + '"')
  end

  # get avatar
  # required :id,:filename,:updated_at
  def self.avatar_url(attributes,style_name="original")
    attributes.merge!({:class_name=>self.name,:name=>"data"})
    Irm::PaperclipHelper.gurl(attributes,style_name)
  end

  def self.avatar_path(attributes,style_name="original")
    attributes.merge!({:class_name=>self.name,:name=>"data"})
    Irm::PaperclipHelper.gpath(attributes,style_name)
  end

  def wrap_person_name
    self[:person_name]
  end
  
  private
  def reprocess_avatar
      avatar.reprocess!
  end
end
