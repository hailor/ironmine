# -*- coding: utf-8 -*-
class InitUidProductModule < ActiveRecord::Migration
  def self.up
    uid_product = Irm::ProductModule.new({:product_short_name=>"UID",:installed_flag=>"Y",:not_auto_mult=>true})
    uid_product.product_modules_tls.build({:name=>"UID module",
                                    :description=>"UID module",
                                    :language=>"en",
                                    :source_lang=>"en"})
    uid_product.product_modules_tls.build({:name=>"统一用户管理模块",
                                    :description=>"统一用户管理模块",
                                    :language=>"zh",
                                    :source_lang=>"en"})
    uid_product.save
  end

  def self.down
  end
end
