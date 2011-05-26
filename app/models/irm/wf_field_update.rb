class Irm::WfFieldUpdate < ActiveRecord::Base
  set_table_name :irm_wf_field_updates


  validates_presence_of :field_update_code,:name,:bo_code,:object_attribute,:value_type
  validates_presence_of :value,:if => Proc.new { |i| !"NULL_VALUE".eql?(i.value_type) }
  validates_uniqueness_of :field_update_code, :if => Proc.new { |i| !i.field_update_code.present? }
  validates_uniqueness_of :name, :if => Proc.new { |i| !i.name.present? }
  validates_format_of :field_update_code, :with => /^[A-Z0-9_]*$/ ,:if=>Proc.new{|i| i.field_update_code.present?}
  validate :validate_value, :if => Proc.new { |i| i.value_type.present?}

  acts_as_urlable
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


  def perform(bo)
    bo.ignore_event = true
    case self.value_type
      when "FORMULA_VALUE"
        bo.update_attribute(self.object_attribute,self.formula_value)
      when "NULL_VALUE"
        bo.update_attribute(self.object_attribute,self.formula_value)
      when "OPTIONS_VALUE"
        bo.update_attribute(self.object_attribute,self.value)
    end
  end

  private
  def validate_value
    object_attribute = Irm::ObjectAttribute.where(:business_object_code=>self.bo_code,:attribute_name=>self.object_attribute).first
    if("FORMULA_VALUE".eql?(self.value_type))
      message,formula_value = Irm::FormulaContext.new.validate(value,object_attribute.data_type)
      if(message.present?||(Irm::Constant::SYS_NO.eql?(object_attribute.nullable_flag)&&!value.present?))
        self.errors.add(:value,I18n.t('activerecord.errors.messages.invalid'))
        return
      end
    end
  end

  def formula_value
    object_attribute = Irm::ObjectAttribute.where(:business_object_code=>self.bo_code,:attribute_name=>self.object_attribute).first
    message,formula_value = Irm::FormulaContext.new.validate(value,object_attribute.data_type)
    if(message.present?||(Irm::Constant::SYS_NO.eql?(object_attribute.nullable_flag)&&!value.present?))
      raise(ArgumentError, "Formula value error: #{message} value: #{formula_value}")
    end
    formula_value
  end
end
