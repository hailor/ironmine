# -*- coding: utf-8 -*-
class AddIcmToSkmTemplateData < ActiveRecord::Migration
  def self.up
    template_en = Skm::EntryTemplate.new(:entry_template_code => "ENTRY_FROM_ICM_REQUEST_EN",:name=>"Entry From Incident Request",:description=>"Entry From Incident Request")
    template_cn = Skm::EntryTemplate.new(:entry_template_code => "ENTRY_FROM_ICM_REQUEST_CN",:name=>"从事故单创建的知识库",:description=>"从事故单创建的知识库")
    template_en.save
    template_cn.save

    element_en_1 = Skm::EntryTemplateElement.new(:entry_template_element_code=>"INCIDENT_REQUEST_INFO_EN", :name=>"Request Info",:description=>"Request Info",:default_rows=>"3")
    element_en_2 = Skm::EntryTemplateElement.new(:entry_template_element_code=>"INCIDENT_REQUEST_INSTANCE_EN",:name=>"Instance",:description=>"Instance",:default_rows=>"3")
    element_en_3 = Skm::EntryTemplateElement.new(:entry_template_element_code=>"INCIDENT_REQUEST_SOLUTION_EN",:name=>"Solution",:description=>"Solution",:default_rows=>"6")

    element_cn_1 = Skm::EntryTemplateElement.new(:entry_template_element_code=>"INCIDENT_REQUEST_INFO_CN", :name=>"事故内容",:description=>"事故内容",:default_rows=>"3")
    element_cn_2 = Skm::EntryTemplateElement.new(:entry_template_element_code=>"INCIDENT_REQUEST_INSTANCE_CN",:name=>"案例",:description=>"案例",:default_rows=>"3")
    element_cn_3 = Skm::EntryTemplateElement.new(:entry_template_element_code=>"INCIDENT_REQUEST_SOLUTION_CN",:name=>"解决方案",:description=>"解决方案",:default_rows=>"6")

    element_en_1.save
    element_en_2.save
    element_en_3.save

    element_cn_1.save
    element_cn_2.save
    element_cn_3.save

    en_details_1 = Skm::EntryTemplateDetail.new(:entry_template_id=>template_en.id,
                                                :entry_template_element_id=>element_en_1.id,
                                                :line_num=>1,
                                                :required_flag=>"Y",
                                                :default_rows=>3,
                                                :status_code=>"ENABLED")
    en_details_2 = Skm::EntryTemplateDetail.new(:entry_template_id=>template_en.id,
                                                :entry_template_element_id=>element_en_2.id,
                                                :line_num=>2,
                                                :required_flag=>"N",
                                                :default_rows=>3,
                                                :status_code=>"ENABLED")
    en_details_3 = Skm::EntryTemplateDetail.new(:entry_template_id=>template_en.id,
                                                :entry_template_element_id=>element_en_3.id,
                                                :line_num=>3,
                                                :required_flag=>"N",
                                                :default_rows=>6,
                                                :status_code=>"ENABLED")

    cn_details_1 = Skm::EntryTemplateDetail.new(:entry_template_id=>template_cn.id,
                                                :entry_template_element_id=>element_cn_1.id,
                                                :line_num=>1,
                                                :required_flag=>"Y",
                                                :default_rows=>3,
                                                :status_code=>"ENABLED")
    cn_details_2 = Skm::EntryTemplateDetail.new(:entry_template_id=>template_cn.id,
                                                :entry_template_element_id=>element_cn_2.id,
                                                :line_num=>2,
                                                :required_flag=>"N",
                                                :default_rows=>3,
                                                :status_code=>"ENABLED")
    cn_details_3 = Skm::EntryTemplateDetail.new(:entry_template_id=>template_cn.id,
                                                :entry_template_element_id=>element_cn_3.id,
                                                :line_num=>3,
                                                :required_flag=>"N",
                                                :default_rows=>6,
                                                :status_code=>"ENABLED")

    en_details_1.save
    en_details_2.save
    en_details_3.save
    cn_details_1.save
    cn_details_2.save
    cn_details_3.save

  end

  def self.down
  end
end
