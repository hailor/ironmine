class MenuEntryValidator < ActiveModel::Validator
  def validate(record)
    if record.permission_code.blank? && record.sub_menu_code.blank?
      record.errors[:base] << I18n::t(:error_irm_menu_entry_permission_sub_menu_at_least_one)
    end
  end
end
