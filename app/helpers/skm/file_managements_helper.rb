module Skm::FileManagementsHelper
  def available_file_categories
    Irm::LookupValue.multilingual.query_by_lookup_type("SKM_FILE_CATEGORIES").order_id.collect{|p| [p[:meaning], p.id]}
  end
end