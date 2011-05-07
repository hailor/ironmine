class Irm::SearchController < ApplicationController

  def index
    results = []
    Ironmine::Acts::Searchable::SEARCHABLE_ENTITY.each do |key,value|
      next unless !value.present?||allow_to_function?(value)
      search_entity = key.constantize
      if search_entity.searchable_options[:direct].present?&&search_entity.respond_to?(search_entity.searchable_options[:direct].to_sym)
        results =  search_entity.send(search_entity.searchable_options[:direct].to_sym,params[:query])
        if results.any?
          redirect_to(results.first.searchable_show_url_options) and return
        end
      end
    end if params[:query].present?
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @company }
    end
  end
end
