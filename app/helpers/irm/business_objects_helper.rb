module Irm::BusinessObjectsHelper
  def available_not_exists_model
    Dir["#{Rails.root}/app/models/*/*.rb"].each { |file| require file }
    models = ActiveRecord::Base.send(:subclasses)
    models.delete_if{|m| m.table_name.end_with?("s_tl")}
    models = models.collect{|m| m.name}
    exists_models = Irm::BusinessObject.all.collect{|bo| bo.bo_model_name}
    models.delete_if{|m| exists_models.include?(m)}
    models
  end

  def available_business_object
    Irm::BusinessObject.query_by_status_code("ENABLED").multilingual.collect{|i|[i[:name],i.business_object_code,{:bo_table_name=>i.bo_table_name}]}
  end

  def bo_name(bo_code)
    Irm::BusinessObject.multilingual.where(:business_object_code=>bo_code).first[:name]
  end
end
