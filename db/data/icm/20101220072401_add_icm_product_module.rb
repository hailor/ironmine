class AddIcmProductModule < ActiveRecord::Migration
  def self.up
    irm_product = Irm::ProductModule.new({:product_short_name=>"ICM",:installed_flag=>"Y",:not_auto_mult=>true})
    irm_product.product_modules_tls.build({:name=>"ICM module",
                                    :description=>"ICM module",
                                    :language=>"en",
                                    :source_lang=>"en"})
    irm_product.product_modules_tls.build({:name=>"事件管理模块",
                                    :description=>"事件管理模块",
                                    :language=>"zh",
                                    :source_lang=>"en"})
    irm_product.save
  end

  def self.down
    icm_product = Irm::ProductModule.where(:product_short_name=>"ICM").first
    icm_product.destroy
  end
end
