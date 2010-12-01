module Irm::QueryExtend
# 这个模块用来扩展ActiveRecord::Base,使用之自动新增scope active query,实例方法active?
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
        def query_extend(options = {})
          return if self.included_modules.include?(::Irm::QueryExtend::InstanceMethods)
          send :include, ::Irm::QueryExtend::InstanceMethods

          class_eval do
            scope :query,lambda{|id|
              where("#{table_name}.id = ?",id)
            }
            scope :active,where("#{table_name}.active_flag = 'Y'")
            scope :query_by_sc,lambda{|service_center_id|
              where("#{table_name}.service_center_id = ?",service_center_id)
            }
            #动态构建语言查询,传入的column为当前表+字段名
            scope :match_value, lambda { |column, value|
            return {} if value.blank?
              { :conditions => ["#{column} like ?", "%#{value}%"] }
            }
            #动态构建语言查询,传入的column为当前表+字段名
            scope :equal_value, lambda { |column, value|
            return {} if value.blank?
              { :conditions => ["#{column} = ?", "#{value}"] }
            }
            #动态构建语言查询,传入的column为当前表+字段名
            scope :date_between_value, lambda { |column, value1,value2|
            return {} if (value1.blank?||value2.blank?)
              where(column.to_sym=>value1..value2)
            }
            #排序构建
            scope :column_order, lambda { |key_part1,key_part2|
              { :order => key_part1.to_s+" "+ key_part2.to_s
              }
            }
          end
        end
    end

    module InstanceMethods
      def self.included(base)
        base.extend ClassMethods
      end

      def active?
        if(self.respond_to?(:active_flag))
          self.send(:active_flag)==::Irm::Constant::SYS_YES
        else
          true
        end
      end

      def to_liquid
        attributes.stringify_keys  
      end

      module ClassMethods

      end
    end
end