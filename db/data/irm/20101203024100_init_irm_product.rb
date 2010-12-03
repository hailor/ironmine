class InitIrmProduct < ActiveRecord::Migration
  def self.up
    irm_product = Irm::ProductModule.new({:product_short_name=>"IRM",:installed_flag=>"Y",:not_auto_mult=>true})
    irm_product.product_modules_tls.build({:name=>"Ironmine Framework",
                                    :description=>"Ironmine Framework",
                                    :language=>"en",
                                    :source_lang=>"en"})
    irm_product.product_modules_tls.build({:name=>"基础模块",
                                    :description=>"基础模块",
                                    :language=>"zh",
                                    :source_lang=>"en"})
    irm_product.save
  end

  def self.down
    irm_product = Irm::ProductModule.where(:product_short_name=>"IRM").first
    irm_product.destroy
  end
end
