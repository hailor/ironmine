module SearchableHelper
  def show_search_result(query)

    Ironmine::Acts::Searchable::SEARCHABLE_ENTITY.each do |key,value|
      search_entity = key.constantize
      search_entity.send(search_entity.seachable_options[:direct].to_sym,query) if search_entity.respond_to?(search_entity.seachable_options[:direct].to_sym)
    end
  end
end