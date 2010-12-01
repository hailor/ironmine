module Ironmine
  module Acts
    module Multilingual
      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        # acts_as_multilingual
        # acts_as_multilingual传入一个hash做参数，参数分为四部分
        # columns 表示语言表的多语言列，可以定义多列 ，默认为name,description这两个列
        # required 表示语言表中必输的多语言列，默认为name
        # lang_model 表示多语言的model名称,默认为类名+sTl
        # lang_relation 表示多语言关系名称,通常使用默认即可
        def acts_as_multilingual(options = {})
          return if self.included_modules.include?(Ironmine::Acts::Multilingual::InstanceMethods)
          default_options = { :columns =>[:name,:description],
                              :required=>[:name],
                              :lang_model => "#{self.name.pluralize}Tl",
                              :lang_relation=> "#{self.name.pluralize}Tls".gsub(/.*::/,"").underscore
                             }
          # 多语言配置项
          cattr_accessor :multilingual_options,:view_name
          self.multilingual_options = default_options.merge(options)
          self.view_name = "#{self.name.pluralize}Vl".gsub(/.*::/,"").underscore
          # 多语言lang scope
          # 1，拼接多语言字段的查询字符
          column_str = ""
          lang_table_name = multilingual_options[:lang_model].constantize.table_name
          multilingual_options[:columns].each do |attr|
            column_str<<"#{lang_table_name}.#{attr}"
            column_str<<"," unless multilingual_options[:columns].index(attr)==multilingual_options[:columns].size-1
          end
          # 2，生成lang scope
          class_eval do
            # lang scope 用来查询主数据所有字段和多语言字段
            scope :query_by_language,lambda{|language_code|
              joins(multilingual_options[:lang_relation].to_sym).
              select("#{table_name}.*,#{lang_table_name}.id lang_id,#{column_str}").
              where("#{lang_table_name}.language = ?", language_code)
            }
            # lang scope 用来查询主数据所有字段和多语言字段
            scope :multilingual,lambda{
              joins(multilingual_options[:lang_relation].to_sym).
              select("#{table_name}.*,#{lang_table_name}.id lang_id,#{column_str}").
              where("#{lang_table_name}.language = ?", I18n.locale)
            }
            # lang_column scope 用来查询多语言字段
            scope :multilingual_colmun,lambda{
              joins(multilingual_options[:lang_relation].to_sym).
              select("#{table_name}.id,#{lang_table_name}.id lang_id,#{column_str}").
              where("#{lang_table_name}.language = ?", I18n.locale)
            }
            # 为生成多语言编辑form提供循环属性
            accepts_nested_attributes_for multilingual_options[:lang_relation].to_sym,:reject_if => :all_blank
            # 对require字段进行验证
            multilingual_options[:required].each do |attr|
              validates_presence_of attr.to_sym,:if => Proc.new { |r|r.send("#{attr}=".to_sym,r.attributes[:name])  if r.attributes[:name];!not_auto_mult}
            end
          end


          class_eval do
            # needed_create_mult 用来标记存储主数据的时候是创建多语言数据还是更新多语言数据
            # not_auto_mult 用来标记是否自动执行多语言功能
            attr_accessor :not_auto_mult

            #在主数据保存后根据标记判断是创建还是更新多语言字段
            after_create {save_multilingual(true)}
            after_update {save_multilingual}
          end

          send :include, Ironmine::Acts::Multilingual::InstanceMethods

        end
      end

      module InstanceMethods
        def self.included(base)
          base.extend ClassMethods
        end


        private
        def save_multilingual(needed_create_mult=false)
          return if not_auto_mult
          data = {}
          multilingual_options[:columns].each do |attr|
            value = self.send(attr.to_sym)||self.attributes[attr.to_sym]
            data.merge!({attr.to_sym=>value}) unless value.nil?
          end

          if needed_create_mult
            usabel_language.each do |language|
              mult = self.send(multilingual_options[:lang_relation].to_sym).build(data.merge({:language=>language,:source_lang=>::I18n.locale}))
              mult.save
            end
          else
            mult = self.send(multilingual_options[:lang_relation].to_sym).where(:language=>::I18n.locale).first
            mult.update_attributes(data) if mult
          end
        end

        def usabel_language
          Ironmine::Acts::Multilingual::USABLE_LANGUAGE.call
          #Irm::Language.active.installed.query_code.collect(&:language_code)
        end


        module ClassMethods

        end
      end
    end
  end
end