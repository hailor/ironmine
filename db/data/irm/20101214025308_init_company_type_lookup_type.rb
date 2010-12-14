# -*- coding: utf-8 -*-
class InitCompanyTypeLookupType < ActiveRecord::Migration
  def self.up
    company_type_lookup_type=Irm::LookupType.new(:lookup_level=>'GLOBAL',
                                         :lookup_type=>'COMPANY_TYPE',
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    company_type_lookup_type.lookup_types_tls.build(:lookup_type_id=>company_type_lookup_type.id,
                                            :meaning=>"公司类型",
                                            :description=>"公司类型",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    company_type_lookup_type.lookup_types_tls.build(:lookup_type_id=>company_type_lookup_type.id,
                                            :meaning=>"Company Type",
                                            :description=>"Company Type",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    company_type_lookup_type.save

    #Customer company
    customer_lookup_value=Irm::LookupValue.new(:lookup_type=>'COMPANY_TYPE',
                                         :lookup_code=>"CUSTOMER",
                                         :start_date_active=>Time.now,
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    customer_lookup_value.lookup_values_tls.build(:lookup_value_id=>customer_lookup_value.id,
                                            :meaning=>"客户公司",
                                            :description=>"客户公司",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    customer_lookup_value.lookup_values_tls.build(:lookup_value_id=>customer_lookup_value.id,
                                            :meaning=>"Customer Company",
                                            :description=>"Customer Company",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")

    customer_lookup_value.save

    #Operation Company
    operation_lookup_value=Irm::LookupValue.new(:lookup_type=>'COMPANY_TYPE',
                                         :lookup_code=>"OPERATION",
                                         :start_date_active=>Time.now,
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    operation_lookup_value.lookup_values_tls.build(:lookup_value_id=>operation_lookup_value.id,
                                            :meaning=>"运营公司",
                                            :description=>"运营公司",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    operation_lookup_value.lookup_values_tls.build(:lookup_value_id=>operation_lookup_value.id,
                                            :meaning=>"Operation Company",
                                            :description=>"Operation Company",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")

    operation_lookup_value.save

    #Supplier Company
    supplier_lookup_value=Irm::LookupValue.new(:lookup_type=>'COMPANY_TYPE',
                                         :lookup_code=>"SUPPLIER",
                                         :start_date_active=>Time.now,
                                         :status_code=>'ENABLED',
                                         :not_auto_mult=>true)
    supplier_lookup_value.lookup_values_tls.build(:lookup_value_id=>supplier_lookup_value.id,
                                            :meaning=>"供应商公司",
                                            :description=>"供应商公司",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    supplier_lookup_value.lookup_values_tls.build(:lookup_value_id=>supplier_lookup_value.id,
                                            :meaning=>"Supplier Company",
                                            :description=>"Supplier Company",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")

    supplier_lookup_value.save
  end

  def self.down
     #delete lookup type
    company_type_lookup_type= Irm::LookupType.where(:lookup_type=>"COMPANY_TYPE").first
    Irm::LookupTypesTl.where(:lookup_type_id=>company_type_lookup_type.id).each do |t1|
      t1.delete
    end

    #delete lookup code
    Irm::LookupType.where(:lookup_type=>"COMPANY_TYPE").each do |lookup_code|
       Irm::LookupValuesTl.where(:lookup_value_id=>lookup_code.id).each do |lookup_code_tl|
         lookup_code_tl.delete
       end
       lookup_code.delete
    end
  end
end
