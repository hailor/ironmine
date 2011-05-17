module Irm::LogosManager
  class << self
    def app_top_logo
      logos[:app_top_logo]
    end

    def login_page_logo
      logos[:app_top_logo]
    end

    def address_bar_logo
      logos[:address_bar_logo]
    end

    def reset_logos
      prepare_logos_cache
    end

    def prepare_logos_cache
      login_page_logo = Irm::SystemParameter.query_by_code("LOGIN_PAGE_LOGO").first
      app_top_logo = Irm::SystemParameter.query_by_code("APP_TOP_LOGO").first
      address_bar_logo = Irm::SystemParameter.query_by_code("ADDRESS_BAR_LOGO").first

      map.merge!({:app_top_logo => app_top_logo.img.url}) if app_top_logo
      map.merge!({:login_page_logo => login_page_logo.img.url}) if login_page_logo
      map.merge!({:address_bar_logo => address_bar_logo.img.url}) if address_bar_logo
    end

    # =====================================生成logo缓存===============================================
    #将数据加载至内存
    def map
      @logos =Ironmine::STORAGE.get(:logos_manager_items)||{}
      if block_given?
        yield @logos
      end
      Ironmine::STORAGE.put(:logos_manager_items,@logos)
    end

    # 从内存中读取数据
    def logos
      Ironmine::STORAGE.get(:logos_manager_items)||{}
    end

    private :map, :logos
  end
end