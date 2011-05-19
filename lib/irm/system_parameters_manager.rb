module Irm::SystemParametersManager
  class << self
    def app_top_logo
      system_params[:app_top_logo]
    end

    def login_page_logo
      system_params[:login_page_logo]
    end

    def address_bar_logo
      system_params[:address_bar_logo]
    end

    def application_title
      system_params[:application_title]
    end

    def host_name
      system_params[:host_name]
    end

    def host_path
      system_params[:host_path]
    end

    def emission_email_address
      system_params[:emission_email_address]
    end

    def upload_file_limit
      system_params[:upload_file_limit].to_f
    end

    def timezone
      system_params[:timezone]
    end

    def reset_system_parameters
      prepare_system_parameters_cache
    end

    def prepare_system_parameters_cache
      login_page_logo = Irm::SystemParameter.query_by_code("LOGIN_PAGE_LOGO").first
      app_top_logo = Irm::SystemParameter.query_by_code("APP_TOP_LOGO").first
      address_bar_logo = Irm::SystemParameter.query_by_code("ADDRESS_BAR_LOGO").first

      application_title = Irm::SystemParameter.query_by_code("APPLICATION_TITLE").first
      host_name = Irm::SystemParameter.query_by_code("HOST_NAME").first
      host_path = Irm::SystemParameter.query_by_code("HOST_PATH").first
      emission_email_address = Irm::SystemParameter.query_by_code("EMISSION_EMAIL_ADDRESS").first

      upload_file_limit = Irm::SystemParameter.query_by_code("UPLOAD_FILE_LIMIT").first
      timezone = Irm::SystemParameter.query_by_code("TIMEZONE").first

      map.merge!({:app_top_logo => app_top_logo.img.url}) if app_top_logo
      map.merge!({:login_page_logo => login_page_logo.img.url}) if login_page_logo
      map.merge!({:address_bar_logo => address_bar_logo.img.url}) if address_bar_logo

      map.merge!({:application_title => application_title.value}) if application_title
      map.merge!({:host_name => host_name.value}) if host_name
      map.merge!({:host_path => host_path.value}) if host_path
      map.merge!({:emission_email_address => emission_email_address.value}) if emission_email_address

      map.merge!({:upload_file_limit => upload_file_limit.value}) if upload_file_limit
      map.merge!({:timezone => timezone.value}) if timezone
    end

    # =====================================生成logo缓存===============================================
    #将数据加载至内存
    def map
      @system_params =Ironmine::STORAGE.get(:system_parameter_manager_items)||{}
      if block_given?
        yield @system_params
      end
      Ironmine::STORAGE.put(:system_parameter_manager_items,@system_params)
    end

    # 从内存中读取数据
    def system_params
      Ironmine::STORAGE.get(:system_parameter_manager_items)||{}
    end

    private :map, :system_params
  end
end