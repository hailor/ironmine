class Irm::WfFieldUpdate < ActiveRecord::Base
  set_table_name :irm_wf_field_updates


  validates_presence_of :field_update_code,:name,:bo_code,:object_attribute,:value_type
  validates_presence_of :value,:if => Proc.new { |i| !"NULL_VALUE".eql?(i.value_type) }
  validates_uniqueness_of :field_update_code, :if => Proc.new { |i| !i.field_update_code.present? }
  validates_uniqueness_of :name, :if => Proc.new { |i| !i.name.present? }
  validates_format_of :field_update_code, :with => /^[A-Z0-9_]*$/ ,:if=>Proc.new{|i| i.field_update_code.present?}
  validate :validate_value, :if => Proc.new { |i| i.value_type.present?}


  query_extend

  scope :with_bo,lambda{|language|
    joins("LEFT OUTER JOIN #{Irm::BusinessObject.view_name} bo ON bo.business_object_code = #{table_name}.bo_code and bo.language='#{language}'").
    select("bo.name bo_name")
  }

  scope :with_object_attribute,lambda{|language|
    joins("LEFT OUTER JOIN #{Irm::ObjectAttribute.view_name} oa ON oa.business_object_code = #{table_name}.bo_code AND oa.attribute_name = #{table_name}.object_attribute AND oa.language='#{language}'").
    select("oa.name object_attribute_name")
  }

  scope :with_value_type,lambda{|language|
    joins("LEFT OUTER JOIN #{Irm::LookupValue.view_name} value_type ON value_type.lookup_type='WF_FIELD_UPDATE_VALUE_TYPE' AND value_type.lookup_code = #{table_name}.value_type AND value_type.language= '#{language}'").
    select(" value_type.meaning value_type_name")
  }


  def self.list_all
    select("#{table_name}.*").with_bo(I18n.locale).with_object_attribute(I18n.locale).with_value_type(I18n.locale)
  end

  private
  def validate_value
    puts "==========================#{self.value_type}======================"
    object_attribute = Irm::ObjectAttribute.where(:business_object_code=>self.bo_code,:attribute_name=>self.object_attribute).first
    if("FORMULA_VALUE".eql?(self.value_type))
      message,formula_value = Irm::FormulaContext.new.validate(value)
      if(message.present?||(Irm::Constant::SYS_NO.eql?(object_attribute.nullable_flag)&&!value.present?))
        self.errors.add(:value,I18n.t('activerecord.errors.messages.invalid'))
        return
      else
        case object_attribute.data_type
          when "varchar"
            unless formula_value.nil?||formula_value.is_a?(String)
              self.errors.add(:value,I18n.t('activerecord.errors.messages.invalid'))
            end
          when "text"
            unless formula_value.nil?||formula_value.is_a?(String)
              self.errors.add(:value,I18n.t('activerecord.errors.messages.invalid'))
            end
          when "datetime"
            unless formula_value.nil?||formula_value.is_a?(DateTime)||formula_value.is_a?(Date)
              self.errors.add(:value,I18n.t('activerecord.errors.messages.invalid'))
            end
          when "int"
            if formula_value.to_s.scan(/\D/).length>0
              errors.add(:value,I18n.t('activerecord.errors.messages.invalid'))
            end
        end
      end
    end
  end
end
