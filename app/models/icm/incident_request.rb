class Icm::IncidentRequest < ActiveRecord::Base
  set_table_name :icm_incident_requests

  has_many :incident_journals

  validates_presence_of :title,:summary,:service_code,:requested_by,:submitted_by,:impact_range_code,:urgence_code,:priority_code,:request_type_code,:incident_status_code,:report_source_code

  #加入activerecord的通用方法和scope
  query_extend

  after_create :generate_request_number

  before_validation_on_create  :setup_priority
  # 查询当天新建的事故单，根据数量生成序列号
  scope :created_at_today,lambda{|cid|
    where("#{table_name}.created_at > ? AND #{table_name}.id <= ?",Date.today,cid)
  }
  # 查询出优先级
  scope :with_priority,lambda{|language|
    joins("LEFT OUTER JOIN #{Icm::PriorityCode.view_name} priority_code ON  #{table_name}.priority_code = priority_code.priority_code AND priority_code.language= '#{language}'").
    select(" priority_code.name priority_name")
  }
  # 查询出请求类型
  scope :with_request_type,lambda{|language|
    joins("LEFT OUTER JOIN #{Irm::LookupValue.view_name} request_type ON request_type.lookup_type='ICM_REQUEST_TYPE_CODE' AND request_type.lookup_code = #{table_name}.request_type_code AND request_type.language= '#{language}'").
    select(" request_type.meaning request_type_name")
  }
  # 查询出服务
  scope :with_service,lambda{|language|
    joins("LEFT OUTER JOIN #{Irm::LookupValue.view_name} service ON service.lookup_type='ICM_SERVICE_CODE' AND service.lookup_code = #{table_name}.service_code AND service.language= '#{language}'").
    select(" service.meaning service_name")
  }
  # 查询出客户
  scope :with_requested_by,lambda{
    joins("LEFT OUTER JOIN #{Irm::Person.table_name} requested ON  requested.id = #{table_name}.requested_by").
    select("#{Irm::Person.name_to_sql(nil,'requested','requested_name')}")
  }

  scope :query_by_requested,lambda{|requested_by|
    where(:requested_by=>requested_by)
  }

  # 查询出提交人
  scope :with_submitted_by,lambda{
    joins("LEFT OUTER JOIN #{Irm::Person.table_name} submitted ON  submitted.id = #{table_name}.submitted_by").
    select("#{Irm::Person.name_to_sql(nil,'submitted','submitted_name')}")
  }

  scope :query_by_submitted,lambda{|submitted_by|
    where(:submitted_by=>submitted_by)
  }

  # 查询出紧急度
  scope :with_urgence,lambda{|language|
    joins("LEFT OUTER JOIN #{Icm::UrgenceCode.view_name} urgence_code ON  urgence_code.urgency_code = #{table_name}.urgence_code AND urgence_code.language= '#{language}'").
    select(" urgence_code.name urgence_name")
  }
  # 查询出影响度
  scope :with_impact_range,lambda{|language|
    joins("LEFT OUTER JOIN #{Icm::ImpactRange.view_name} impact_range ON  impact_range.impact_code = #{table_name}.impact_range_code AND impact_range.language= '#{language}'").
    select(" impact_range.name impact_range_name")
  }
  # 查询出联系人
  scope :with_contact,lambda{
    joins("LEFT OUTER JOIN #{Irm::Person.table_name} contact ON  contact.id = #{table_name}.contact_id").
    select("#{Irm::Person.name_to_sql(nil,'contact','contact_name')}")
  }
  # 查询出报告来源
  scope :with_report_source,lambda{|language|
    joins("LEFT OUTER JOIN #{Irm::LookupValue.view_name} report_source ON report_source.lookup_type='ICM_REQUEST_REPORT_SOURCE' AND report_source.lookup_code = #{table_name}.report_source_code AND report_source.language= '#{language}'").
    select(" report_source.meaning report_source_name")
  }
  # 查询出事故单状态
  scope :with_incident_status,lambda{|language|
    joins("LEFT OUTER JOIN #{Icm::IncidentStatus.view_name} incident_status ON  incident_status.incident_status_code = #{table_name}.incident_status_code AND incident_status.language= '#{language}'").
    joins("LEFT OUTER JOIN #{Icm::IncidentPhase.view_name} incident_phase ON  incident_phase.phase_code = incident_status.phase_code AND incident_phase.language= '#{language}'").
    select(" incident_status.name incident_status_name,incident_phase.name incident_phase_name")
  }
  # 查询公司
  scope :with_company,lambda{|language|
    joins("LEFT OUTER JOIN #{Irm::Company.view_name} company ON  company.id = #{table_name}.company_id AND company.language= '#{language}'").
    select(" company.name company_name")
  }

  scope :query_by_support_person, lambda{|person_id|
    where("#{table_name}.support_person_id = ?", person_id)
  }
  scope :select_all,lambda{
    select("#{table_name}.*")
  }

  #报表使用
  scope :query_by_urgency,lambda{|language| select("v1.name urgency_name,sum(1) urgency_count").
                          joins(",icm_urgence_codes_vl v1").
                          where("v1.urgency_code = #{table_name}.urgence_code AND v1.language = '#{language}'").
                          group("v1.name")
  }

   scope :query_by_report_source,lambda{|language| select("v1.meaning report_source_name,sum(1) report_source_count").
                          joins(",irm_lookup_values_vl v1").
                          where("v1.lookup_code = #{table_name}.report_source_code AND v1.language = '#{language}' AND " +
                                "v1.lookup_type = 'ICM_REQUEST_REPORT_SOURCE'").
                          group("v1.meaning")}


   scope :query_by_request_type,lambda{|language| select("v1.meaning report_type_name,sum(1) report_type_count").
                          joins(",irm_lookup_values_vl v1").
                          where("v1.lookup_code = #{table_name}.request_type_code AND v1.language = '#{language}' AND " +
                                "v1.lookup_type = 'ICM_REQUEST_TYPE_CODE'").
                          group("v1.meaning")}


   scope :query_by_impact_range,lambda{|language| select("v1.name impact_range_name,sum(1) impact_range_count").
                          joins(",icm_impact_ranges_vl v1").
                          where("v1.impact_code = #{table_name}.impact_range_code AND v1.language = '#{language}'").
                          group("v1.name")}

   scope :query_by_priority_code,lambda{|language| select("v1.name priority_code_name,sum(1) priority_code_count").
                          joins(",icm_priority_codes_vl v1").
                          where("v1.priority_code = #{table_name}.priority_code AND v1.language = '#{language}'").
                          group("v1.name")}

   #已经关闭的事故单
   scope :query_by_completed_incident, joins(",#{Icm::IncidentStatus.view_name} isv").
                                    where("isv.incident_status_code='CLOSE_INCIDENT' ")

   #未解决的事故单
   scope :query_by_unsolved_incident, joins(",#{Icm::IncidentStatus.view_name} isv").
                                    where("isv.incident_status_code not in ('CLOSE_INCIDENT','SOLVE_RECOVER')")
   #针对于支持组id和支持组人员为空，被认为未分配的
   scope :query_by_unallocated_incident, where("#{table_name}.support_person_id is null and " +
                                              "#{table_name}.support_group_id is null")

   #分月统计
   

  def self.list_all
    select_all.
        with_request_type(I18n.locale).
        with_service(I18n.locale).
        with_requested_by.
        with_urgence(I18n.locale).
        with_impact_range(I18n.locale).
        with_contact.
        with_report_source(I18n.locale).
        with_incident_status(I18n.locale).
        with_priority(I18n.locale).
        with_submitted_by.
        with_company((I18n.locale))
  end

  private
  def generate_request_number
    count = self.class.created_at_today(self.id).count
    self.request_number = "ICR"+self.created_at.strftime("%Y%m%d")+count.to_s.rjust(4,"0")
    self.save
  end

  def setup_priority
    self.weight_value = 10
    priority = Icm::PriorityCode.query_by_weight_value(self.weight_value).first
    self.priority_code = priority.priority_code
  end
end
