module Irm::FormHelper
  extend ActiveSupport::Concern

  def array_form_for(record_array, *args, &proc)
        raise ArgumentError, "Missing block" unless block_given?
        raise ArgumentError, "Not array" unless record_array.is_a?(Array)

        options = args.extract_options!

        output = ""

        record_array.each_index do |index|
          object = record_array[index]
          object_name = (options[:as] || ActiveModel::Naming.singular(object))+("[#{index}]")
          apply_form_for_options!(object, options)
          args.unshift object
          output << fields_for(object_name, *(args << options), &proc)
        end

        (options[:html] ||= {})[:remote] = true if options.delete(:remote)

        form_content = form_tag(options.delete(:url) || {}, options.delete(:html) || {})
        form_content.safe_concat(output)
        form_content.safe_concat('</form>')
  end

  def named_fields_for(name,real_object, *args, &block)
    object = real_object
    @template.fields_for(name, *args, &block)
  end
end