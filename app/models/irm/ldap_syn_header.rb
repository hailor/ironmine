class Irm::LdapSynHeader < ActiveRecord::Base
  set_table_name :irm_ldap_syn_headers
  belongs_to :ldap_source,:foreign_key=>:ldap_source_id,:primary_key=>:id
  has_many :ldap_syn_attributes

  after_create :create_syn_attribute

  query_extend

  scope :query_syn_info,lambda{|language| select("#{table_name}.*,ils.name ldap_source_name").
                                          joins(",irm_ldap_sources ils").
                                          where("ils.id=#{table_name}.ldap_source_id ")}


  scope :with_ldap_auth_sources,lambda{
    joins("JOIN #{Irm::LdapSource.table_name} ON #{Irm::LdapSource.table_name}.id = #{table_name}.ldap_source_id").
    select("#{Irm::LdapSource.table_name}.name ldap_source_name")
  }

  scope :with_ldap_syn_person,lambda{
    joins("LEFT OUTER JOIN #{Irm::LdapSynPerson.table_name} ON #{Irm::LdapSynPerson.table_name}.id = #{table_name}.syn_people_id").
    select("#{Irm::LdapSynPerson.table_name}.ldap_name s")
  }



  def self.list_all
    select("#{table_name}.*").with_ldap_auth_sources.with_ldap_syn_person
  end
  #
  def ldap_attr(object_type)
     attr_h={}
     self.ldap_syn_attributes.where(:object_type=>object_type,:ldap_attr_type=>"LDAP").each do |attr|
       attr_h[attr.local_attr] = attr.ldap_attr
     end

     attr_h
  end

  def const_attr(object_type)
     attr_h={}
     self.ldap_syn_attributes.where(:object_type=>object_type,:ldap_attr_type=>"CONSTANT").each do |attr|
       attr_h[attr.local_attr] = attr.ldap_attr
     end

     attr_h
  end



  #同步公司信息，分为三层架构：公司，组织，部门，人员
  def ldap_syn
    comp_temp = Irm::LdapSynInterface.new()
    comp_attr = self.ldap_attr(self.comp_object)
    comp_attr["dn"]="dn"
    #每次针对一个同步方案同步
    comp_temp["process_id"] = self.id
    attr =comp_attr.values
    comp_cons = self.const_attr(self.comp_object)
    ldap = self.ldap_source.ldap
    tree_base = self.base_dn
    comp_filter =self.comp_filter.length>0 ? Net::LDAP::Filter.construct(self.comp_filter) : Net::LDAP::Filter.nil?
    comp_r ={}
    com_result=ldap.search( :base => tree_base,
                            :attributes => attr,
                            :filter=>comp_filter,
                            :return_result => true ,
                            :scope=>Net::LDAP::SearchScope_SingleLevel)

    #将常量类型的结果存放到公司变量中
    comp_cons.each do |key,val|
      comp_temp["comp_#{key.to_s}".to_sym]=val
    end

    #如果不需要进行组织和部门同步
    if self.org_syn_flag == 'N' and self.dept_syn_flag=='N' then
      com_result.each  do |entry|
        new_comp = comp_temp.clone
        comp_r["dn"] =entry.dn
        entry.each do |attr, values|
          comp_r[attr.to_s]= values.first
        end
        comp_attr.each do |key,val|
          new_comp["comp_#{key.to_s}".to_sym]=comp_r[val]
        end
        new_comp.save
      end
    else
      com_result.each   do |entry|
        new_comp = comp_temp.clone
        comp_r["dn"] =entry.dn
        entry.each do |attr, values|
          comp_r[attr.to_s]= values.first
        end
        comp_attr.each do |key,val|
          new_comp["comp_#{key.to_s}".to_sym]=comp_r[val]
        end
        #如果组织层需要同步则调用组织同步方法，否则直接调用部门同步方法
        if self.org_syn_flag == 'Y' then
          org_result(entry.dn,ldap,new_comp,self.org_level)
        else
          dept_result(entry.dn,ldap,new_comp,self.dept_level)
        end
      end
    end
  end

  def org_result(dn,ldap,comp,level)
    if level==1 then
      org_temp = comp
      org_attr = self.ldap_attr(self.org_object)
      org_attr["dn"]="dn"
      org_filter =self.org_filter.length>0 ? Net::LDAP::Filter.construct(self.org_filter) : Net::LDAP::Filter.nil?
      org_r ={}
      self.const_attr(self.org_object).each do |key,val|
        org_temp["org_#{key.to_s}".to_sym]=val
      end
      org_result=ldap.search( :base => dn,
                              :attributes => org_attr.values,
                              :filter=>org_filter,
                              :return_result => true ,
                              :scope=>Net::LDAP::SearchScope_SingleLevel)

      #判断是否需要同步部门，如果不需要同步，则在当前节点进行插入操作
      if self.dept_syn_flag=='N' then
        org_result.each do |entry|
          new_org = org_temp.clone
          org_r["dn"]= entry.dn
          entry.each do |attr, values|
            org_r[attr.to_s]= values.first
          end
          org_attr.each do |key,val|
            new_org["org_#{key.to_s}".to_sym]=org_r[val]
          end
          new_org.save
        end
      else
        org_result.each do |entry|
          new_org = org_temp.clone
          org_r["dn"]= entry.dn
          entry.each do |attr, values|
            org_r[attr.to_s]= values.first
          end
          org_attr.each do |key,val|
            new_org["org_#{key.to_s}".to_sym]=org_r[val]
          end
          dept_result(entry.dn,ldap,new_org,self.dept_level)
        end
      end
    else
      result=ldap.search( :base => dn,
                          :return_result => true,
                          :scope=>Net::LDAP::SearchScope_SingleLevel)
      result.each do |entry|
        org_result(entry.dn,ldap,comp,level-1)
      end
    end
  end

  #同步部门信息
  def dept_result(dn,ldap,org,level)
    if level==1 then
      dept_temp = org
      dept_attr = self.ldap_attr(self.dept_object)
      dept_cons = self.const_attr(self.dept_object)
      dept_attr["dn"]="dn"
      attr =dept_attr.values
      attr << "uniqueMember"
      dept_filter =self.org_filter.length>0 ? Net::LDAP::Filter.construct(self.dept_filter) : Net::LDAP::Filter.nil?
      dept_cons.each do |key,val|
        dept_temp["dept_#{key.to_s}".to_sym]=val
      end
      dept_r ={}
      dept_result=ldap.search(:base => dn,
                              :attributes => attr,
                              :filter=>dept_filter,
                              :return_result => true ,
                              :scope=>Net::LDAP::SearchScope_SingleLevel)
      dept_result.each do |entry|
        new_dept = dept_temp.clone
        dept_r["dn"]= entry.dn
        entry.each do |attr, values|
          if attr.to_s=="uniquemember".to_s then
            values.each do |value|
              #在这里添加人员信息
              puts "          #{value}"
            end
          else
            dept_r[attr.to_s]= values.first
          end
        end
        dept_attr.each do |key,val|
          new_dept["dept_#{key.to_s}".to_sym]=dept_r[val]
        end
        new_dept.save
      end
    else
      result=ldap.search( :base => dn,
                          :return_result => true,
                          :scope=>Net::LDAP::SearchScope_SingleLevel)
      result.each do |entry|
        dept_result(entry.dn,ldap,org,level-1)
      end
    end
  end

  #将接口表中的数据同步到系统中
  def process_syn_data
    comp_id = 0
    org_id = 0

    #将当前的操作环境设置为中文环境
    ::I18n.locale="zh"
    #同步公司
    Irm::LdapSynInterface.find_distinct_companies(self.id).each do |comp|
       if Irm::Company.exists?(:ldap_dn=>comp["ldap_dn"])
         comp_update = Irm::Company.find_by_ldap_dn(comp["ldap_dn"])
         comp_update.update_attributes(comp.attributes)
         comp_id =comp_update.id
       else
         comp_new = Irm::Company.create(comp.attributes)
         comp_id =comp_new.id
       end
       #同步组织
       Irm::LdapSynInterface.find_distinct_organizations(self.id,comp["ldap_dn"]).each do |org|
         org.company_id = comp_id
         if Irm::Organization.exists?(:ldap_dn=>org["ldap_dn"])
           org_update=Irm::Organization.find_by_ldap_dn(org["ldap_dn"])
           org_update.update_attributes(org.attributes)
           org_id = org_update.id
         else
           org.company_id= comp_id
           org_new = Irm::Organization.create(org.attributes)
           org_id = org_new.id
         end
         #同步部门
         Irm::LdapSynInterface.find_distinct_departments(self.id,comp["ldap_dn"],org["ldap_dn"]).each do |dept|
           dept.company_id = comp_id
           dept.organization_id = org_id
           if Irm::Department.exists?(:ldap_dn=>dept["ldap_dn"])
             dept_update =Irm::Department.find_by_ldap_dn(dept["ldap_dn"])
             dept_update.update_attributes(dept.attributes)
           else
             dept_new = Irm::Department.create(dept.attributes)
           end
           @department = Irm::LdapSynInterface.find_by_dept_dn(dept["ldap_dn"])
           @department.destroy
         end
       end
    end
  end

  private
  def create_syn_attribute
    Irm::LdapSynAttribute::SYN_ATTRS.each do |key,value|
      value[:attrs].each do |attr|
        bo_attr = Irm::ObjectAttribute.multilingual.where(:business_object_code=>value[:bo_code],:attribute_name=>attr.to_s).first
        self.ldap_syn_attributes.create(:object_type=>value[:bo_code],
                                        :ldap_attr_type=>"LDAP",
                                        :local_attr=>attr.to_s,
                                        :local_attr_type=>bo_attr.data_type,
                                        :ldap_attr=>attr.to_s,
                                        :null_able=> bo_attr.nullable_flag.eql?(Irm::Constant::SYS_NO) ? Irm::Constant::SYS_YES : Irm::Constant::SYS_NO,
                                        :description=>bo_attr[:name])
      end

    end
  end
end
