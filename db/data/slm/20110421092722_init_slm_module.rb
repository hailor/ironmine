# -*- coding: utf-8 -*-
class InitSlmModule < ActiveRecord::Migration
  def self.up
    slm_product = Irm::ProductModule.new({:product_short_name=>"SLM",:installed_flag=>"Y",:not_auto_mult=>true})
    slm_product.product_modules_tls.build({:name=>"Service Level Management module",
                                    :description=>"Service Level Management module",
                                    :language=>"en",
                                    :source_lang=>"en"})
    slm_product.product_modules_tls.build({:name=>"服务级别管理模块",
                                    :description=>"服务级别管理模块",
                                    :language=>"zh",
                                    :source_lang=>"en"})
    slm_product.save
  end

  def self.down
  end
end
