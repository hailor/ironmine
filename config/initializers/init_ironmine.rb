# 该文件中的代码会在程序启动时自动运行,ironmine项目中需要初始的代码建议都放在此文件中


ActionView::Base.field_error_proc=Proc.new{ |html_tag, instance| "<span class=\"field_with_errors\" title=\"#{instance.error_message}\">#{html_tag}</span>".html_safe }

#将rails 3中默认的javascript prototype库替换成jquery
ActionView::Helpers::AssetTagHelper.register_javascript_expansion :defaults=>%w(rails.js)

#扩展ActionRecord::Base,实现数据保存时自动给created_by与updated_by赋值
ActiveRecord::Base.send(:include,Irm::SetWho)
#扩展ActionRecord::Base,自动生成scope query,active和instance方法active?
ActiveRecord::Base.send(:include,Irm::QueryExtend)
#扩展link_to,url_for,增加权限验证
ActionView::Base.send(:include,Irm::UrlHelper)


#Paperclip.options[:command_path] = "E:/Program Files/ImageMagick-6.6.3-Q16"

#require 'rufus/scheduler'
# 程序中使用的ironmine中的常量，建议配置型的常量放到此处
module Ironmine
  STORAGE = Irm::DataStorage.instance
   #应用程序是否以多服务中心模式运行
#   MULTI_SUBDOMAIN = false

   #系统人员显示模式
#   PERSON_NAME_FORMAT = :lastname_firstname

   #应用程序应用的host
#   HOST = "zj.hand-china.com:8282"

   #attachment url,path
#   ATTACHMENT_URL = "/upload/:class/:id/:style/:basename.:extension"
#   ATTACHMENT_PATH = ":rails_root/public/upload/:class/:id/:style/:basename.:extension"

#   SCHEDULER = Rufus::Scheduler.start_new
end

#配置delayed_job
#当job执行失败,是否从队列中删除
#Delayed::Worker.destroy_failed_jobs = false
#worker在没有job需要执行时的sleep时间,设为1s
#Delayed::Worker.sleep_delay = 1
#最大重新执行次数
#Delayed::Worker.max_attempts = 3
#一个job的最长执行时间
#Delayed::Worker.max_run_time = 5.minutes
#数据存储方式
#Delayed::Worker.backend=:active_record
#Delayed::Backend::ActiveRecord::Job.set_table_name(:irm_delayed_jobs)

begin
  # 初始化模块数据 ，初始化脚本位于lib/模块/init.rb脚本中
  Irm::ProductModule.enabled.each do |p|
    if File::exists?(File.join(File.expand_path(File.dirname(__FILE__)), "..","..","lib","#{p.product_short_name.downcase}","init.rb"))
      require "#{p.product_short_name.downcase}/init"
    end
  end
  rescue =>text
          puts("Init module error :#{text}")
end

Array.send :include, Irm::ArrayToJson