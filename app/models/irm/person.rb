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

  query_extend
  scope :query_by_identity,lambda{|identity|
    where(:identity_id=>identity)
  }


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
                                                      "iov.name organization_name,idv.name department_name,ifgv.name function_group_name," +
                                                      "irv.name region_name,isgv.name site_group_name,isv.name site_name,ilv.description notification_lang_name").
                                                   joins("left outer join irm_identities on #{table_name}.identity_id=irm_identities.id").
                                                   joins("left outer join irm_organizations_vl iov on #{table_name}.organization_id=iov.id AND iov.language = v2.language").
                                                   joins("left outer join irm_departments_vl idv on #{table_name}.department_id=idv.id AND idv.language = v2.language").
                                                   joins("left outer join irm_function_groups_vl ifgv on #{table_name}.function_group_code=ifgv.group_code AND ifgv.language = v2.language").
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


  #取得系统当前登陆人员
  def self.current
    @current_person
  end
  #设置当前人员
  def self.current=(current_person)
    @current_person = current_person
  end

  #权限字符串
  def permissions
    Irm::Permission.enabled.query_by_person(self.id)
  end

  #权限字符串
  def permissions_to_s
    prmissions_s = ""
    #缓存用户权限字符串
    if @permissions_accesses
      return @permissions_accesses
    end
    permissions.each do |p|
      ps = "|#{Irm::Permission.url_key(p[:controller],p[:action])}|"
      prmissions_s<<ps unless prmissions_s.include?(ps)
    end
    @permissions_accesses = prmissions_s
    return prmissions_s
  end

  #用户是否拥有权限
  #1,链接类型如果是public类型,则表示用户可以访问
  #2,链接为login类型,则表示用户需要登录才可能访问,否则不能访问
  #3,链接为servic_center类型,则表示用户需要是service_center的管理员才能访问
  #4,链接为project类型,则表示需要能够访问当前项目,且拥用足够权限才可以访问
  def allow_to?(permission)
    ps = "|#{Irm::Permission.url_key(permission[:controller],permission[:action])}|"
    if permission
      permissions_to_s.include?(ps)||permission.publiced?||permission.logined?
    else
      true
    end
  end

  # 返回人员的全名
  def name(formatter = nil)
      eval('"' + (PERSON_NAME_FORMATS[:firstname_lastname]) + '"')
  end
  # 取得人员全名的SQL
  def self.name_to_sql(formatter = nil,alias_table_name="#{table_name}",alias_column_name="name")
    eval('"' +PERSON_NAME_SQL_FORMATS[:firstname_lastname] + '"')
  end


end
