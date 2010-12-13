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
            scope :enabled,where("#{table_name}.status_code = ?",Irm::Constant::ENABLED)

            scope :query_by_company,lambda{|company_id|
              where("#{table_name}.company_id = ?",company_id)
            }

            scope :query_by_status_code,lambda{|status_code|
              where("#{table_name}.status_code = ?",status_code)
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


            def query(id)
              find(id) rescue nil
            end

            def wrap_name
              self[:name]
            end

          end
        end
    end

    module InstanceMethods
      def self.included(base)
        base.extend ClassMethods
      end


      def enabled?
        if(self.respond_to?(:status_code))
          self.send(:status_code)==::Irm::Constant::ENABLED
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