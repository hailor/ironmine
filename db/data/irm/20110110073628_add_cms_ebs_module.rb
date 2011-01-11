# -*- coding: utf-8 -*-
class AddCmsEbsModule < ActiveRecord::Migration
  def self.up
    irm_product_ebs = Irm::ProductModule.new({:product_short_name=>"EBS",:installed_flag=>"Y",:not_auto_mult=>true})
    irm_product_ebs.product_modules_tls.build({:name=>"Oracle EBS Best Practices",
                                    :description=>"Oracle EBS Best Practices",
                                    :language=>"en",
                                    :source_lang=>"en"})
    irm_product_ebs.product_modules_tls.build({:name=>"ORAL_EBS最佳实践菜单",
                                    :description=>"ORAL_EBS最佳实践菜单",
                                    :language=>"zh",
                                    :source_lang=>"en"})
    irm_product_ebs.save

    irm_product = Irm::ProductModule.new({:product_short_name=>"CMS",:installed_flag=>"Y",:not_auto_mult=>true})
    irm_product.product_modules_tls.build({:name=>"Configuration Management",
                                    :description=>"Configuration Management",
                                    :language=>"en",
                                    :source_lang=>"en"})
    irm_product.product_modules_tls.build({:name=>"配置管理模块",
                                    :description=>"配置管理模块",
                                    :language=>"zh",
                                    :source_lang=>"en"})
    irm_product.save
  end

  def self.down
    irm_product = Irm::ProductModule.where(:product_short_name=>"CMS").first
    irm_product.destroy
    irm_product_ebs = Irm::ProductModule.where(:product_short_name=>"EBS").first
    irm_product_ebs.destroy
  end
end
