#-*- coding: utf-8 -*-
class AddLogoSettingToSystemParameters2 < ActiveRecord::Migration
  def self.up
    login_page_logo = Irm::SystemParameter.new(:parameter_code=>'LOGIN_PAGE_LOGO',
                                               :content_type=>'GLOBAL_SETTING',
                                               :data_type=>'IMAGE',
                                               :value => "Y",
                                               :status_code=>'ENABLED',
                                               :not_auto_mult=>true)
    login_page_logo.system_parameters_tls.build(:system_parameter_id=>login_page_logo.id,
                                               :name=>'登陆页面LOGO',
                                               :description=>'登陆页面LOGO',
                                               :language=>'zh',
                                               :status_code=>'ENABLED',
                                               :source_lang=>'en')
    login_page_logo.system_parameters_tls.build(:system_parameter_id=>login_page_logo.id,
                                               :name=>'Login page logo',
                                               :description=>'Login page logo',
                                               :language=>'en',
                                               :status_code=>'ENABLED',
                                               :source_lang=>'en')
    login_page_logo.save

    app_top_logo = Irm::SystemParameter.new(:parameter_code=>'APP_TOP_LOGO',
                                               :content_type=>'GLOBAL_SETTING',
                                               :data_type=>'IMAGE',
                                               :value => "Y",
                                               :status_code=>'ENABLED',
                                               :not_auto_mult=>true)
    app_top_logo.system_parameters_tls.build(:system_parameter_id=>app_top_logo.id,
                                               :name=>'应用顶部LOGO',
                                               :description=>'应用顶部LOGO',
                                               :language=>'zh',
                                               :status_code=>'ENABLED',
                                               :source_lang=>'en')
    app_top_logo.system_parameters_tls.build(:system_parameter_id=>app_top_logo.id,
                                               :name=>'Logo on page top',
                                               :description=>'Logo on page top',
                                               :language=>'en',
                                               :status_code=>'ENABLED',
                                               :source_lang=>'en')
    app_top_logo.save
  end

  def self.down
  end
end
