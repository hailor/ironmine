module SearchableHelper
  def show_search_result(query)
    result_box = ""
    results = []
    return unless query.present?
    Ironmine::Acts::Searchable::SEARCHABLE_ENTITY.each do |key,value|
      next unless !value.present?||allow_to_function?(value)
      search_entity = key.constantize
      if search_entity.searchable_options[:all].present?&&search_entity.respond_to?(search_entity.searchable_options[:all].to_sym)
        results =  search_entity.send(search_entity.searchable_options[:all].to_sym,query)
        if results.any?
          result_box<<render(:partial=>search_entity.searchable_options[:view],:locals=>{:results=>results} )
        end
      end
    end
    result_box.html_safe
  end
end