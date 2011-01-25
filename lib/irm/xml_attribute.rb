# 在ruby1.9.2中无法使用to_xml将scope查询出的数据转化为xml
# 当值为nil的时候出错
module Irm::XmlAttribute
  def self.included(base)
    base.class_eval do
      def compute_type
        type = @serializable.class.columns_hash[name]? @serializable.class.columns_hash[name].type : super

        case type
        when :text
          :string
        when :time
          :datetime
        else
          type
        end
      end
    end
  end
end