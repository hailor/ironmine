# -*- coding: utf-8 -*-
require "#{Rails.root}/app/models/irm/company"
class InitGlobalCompany < ActiveRecord::Migration
  def self.up
    global_company = Irm::GlobalCompany.new({:short_name=>"GLOBAL_COMPANY",:company_type=>"GLOBAL",:not_auto_mult=>true})
    global_company.companies_tls.build({:name=>"Global company",
                                    :description=>"Global company",
                                    :language=>"en",
                                    :source_lang=>"en"})
    global_company.companies_tls.build({:name=>"全局公司",
                                    :description=>"全局公司",
                                    :language=>"zh",
                                    :source_lang=>"en"})
    global_company.save
  end

  def self.down
    global_company = Irm::GlobalCompany.where(:short_name=>"GLOBAL_COMPANY").first
    global_company.destroy
  end
end
