module Irm::XmlAttribute
      def compute_type
        puts "xxxxxxxxxxxxxxxxx"
        type = @serializable.class.serialized_attributes.has_key?(name) ?
          super : @serializable.class.columns_hash[name].type

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