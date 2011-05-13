# -*- coding: utf-8 -*-
class InitFormulaFunction < ActiveRecord::Migration
  def self.up
   irm_formula_function_type=Irm::LookupType.new(:lookup_level=>'GLOBAL',:lookup_type=>'IRM_FORMULA_FUNCTION_TYPE',:status_code=>'ENABLED',:not_auto_mult=>true)
   irm_formula_function_type.lookup_types_tls.build(:lookup_type_id=>irm_formula_function_type.id,:meaning=>'公式函数类型',:description=>'公式函数类型',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
   irm_formula_function_type.lookup_types_tls.build(:lookup_type_id=>irm_formula_function_type.id,:meaning=>'Formula function type',:description=>'Formula function type',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
   irm_formula_function_type.save

   irm_formula_function_typedatetime= Irm::LookupValue.new(:lookup_type=>'IRM_FORMULA_FUNCTION_TYPE',:lookup_code=>'DATETIME',:start_date_active=>'2011-03-08',:status_code=>'ENABLED',:not_auto_mult=>true)
   irm_formula_function_typedatetime.lookup_values_tls.build(:lookup_value_id=>irm_formula_function_typedatetime.id,:meaning=>'日期和时间',:description=>'日期和时间',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
   irm_formula_function_typedatetime.lookup_values_tls.build(:lookup_value_id=>irm_formula_function_typedatetime.id,:meaning=>'Date and Time',:description=>'Date and Time',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
   irm_formula_function_typedatetime.save
   irm_formula_function_typelogic= Irm::LookupValue.new(:lookup_type=>'IRM_FORMULA_FUNCTION_TYPE',:lookup_code=>'LOGIC',:start_date_active=>'2011-03-09',:status_code=>'ENABLED',:not_auto_mult=>true)
   irm_formula_function_typelogic.lookup_values_tls.build(:lookup_value_id=>irm_formula_function_typelogic.id,:meaning=>'逻辑',:description=>'逻辑',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
   irm_formula_function_typelogic.lookup_values_tls.build(:lookup_value_id=>irm_formula_function_typelogic.id,:meaning=>'Logic',:description=>'Logic',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
   irm_formula_function_typelogic.save
   irm_formula_function_typemath= Irm::LookupValue.new(:lookup_type=>'IRM_FORMULA_FUNCTION_TYPE',:lookup_code=>'MATH',:start_date_active=>'2011-03-10',:status_code=>'ENABLED',:not_auto_mult=>true)
   irm_formula_function_typemath.lookup_values_tls.build(:lookup_value_id=>irm_formula_function_typemath.id,:meaning=>'数学',:description=>'数学',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
   irm_formula_function_typemath.lookup_values_tls.build(:lookup_value_id=>irm_formula_function_typemath.id,:meaning=>'Math',:description=>'Math',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
   irm_formula_function_typemath.save
   irm_formula_function_typetext= Irm::LookupValue.new(:lookup_type=>'IRM_FORMULA_FUNCTION_TYPE',:lookup_code=>'TEXT',:start_date_active=>'2011-03-11',:status_code=>'ENABLED',:not_auto_mult=>true)
   irm_formula_function_typetext.lookup_values_tls.build(:lookup_value_id=>irm_formula_function_typetext.id,:meaning=>'文本',:description=>'文本',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
   irm_formula_function_typetext.lookup_values_tls.build(:lookup_value_id=>irm_formula_function_typetext.id,:meaning=>'Text',:description=>'Text',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
   irm_formula_function_typetext.save
   irm_formula_function_typeadvance= Irm::LookupValue.new(:lookup_type=>'IRM_FORMULA_FUNCTION_TYPE',:lookup_code=>'ADVANCE',:start_date_active=>'2011-03-12',:status_code=>'ENABLED',:not_auto_mult=>true)
   irm_formula_function_typeadvance.lookup_values_tls.build(:lookup_value_id=>irm_formula_function_typeadvance.id,:meaning=>'高级',:description=>'高级',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
   irm_formula_function_typeadvance.lookup_values_tls.build(:lookup_value_id=>irm_formula_function_typeadvance.id,:meaning=>'Advance',:description=>'Advance',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
   irm_formula_function_typeadvance.save


   datetime_date= Irm::FormulaFunction.new(:function_code=>'DATE',:parameters=>'year,month,day',:function_type => 'DATETIME',:not_auto_mult=>true)
   datetime_date.formula_functions_tls.build(:language=>'zh',:source_lang=>'en',:description=>'通过年、月、日创建日期')
   datetime_date.formula_functions_tls.build(:language=>'en',:source_lang=>'en',:description=>'Creates a date from a year, month and day')
   datetime_date.save
   datetime_datevalue= Irm::FormulaFunction.new(:function_code=>'DATEVALUE',:parameters=>'string',:function_type => 'DATETIME',:not_auto_mult=>true)
   datetime_datevalue.formula_functions_tls.build(:language=>'zh',:source_lang=>'en',:description=>'从日期时间或文本表示方式创建日期')
   datetime_datevalue.formula_functions_tls.build(:language=>'en',:source_lang=>'en',:description=>'Creates a date from its datetime or text representation')
   datetime_datevalue.save
   datetime_year= Irm::FormulaFunction.new(:function_code=>'YEAR',:parameters=>'date',:function_type => 'DATETIME',:not_auto_mult=>true)
   datetime_year.formula_functions_tls.build(:language=>'zh',:source_lang=>'en',:description=>'返回日期的年份，是 1900 与 9999 之间的一个数字')
   datetime_year.formula_functions_tls.build(:language=>'en',:source_lang=>'en',:description=>'Returns the year of a date, a number between 1900 and 9999')
   datetime_year.save
   datetime_month= Irm::FormulaFunction.new(:function_code=>'MONTH',:parameters=>'date',:function_type => 'DATETIME',:not_auto_mult=>true)
   datetime_month.formula_functions_tls.build(:language=>'zh',:source_lang=>'en',:description=>'返回月份，是 1（一月）与 12（十二月）之间的一个数字')
   datetime_month.formula_functions_tls.build(:language=>'en',:source_lang=>'en',:description=>'Returns the month, a number between 1 (January) and 12 (December)')
   datetime_month.save
   datetime_day= Irm::FormulaFunction.new(:function_code=>'DAY',:parameters=>'date',:function_type => 'DATETIME',:not_auto_mult=>true)
   datetime_day.formula_functions_tls.build(:language=>'zh',:source_lang=>'en',:description=>'返回一个月中的某一天，是 1 与 31 之间的一个数字')
   datetime_day.formula_functions_tls.build(:language=>'en',:source_lang=>'en',:description=>'Returns the day of the month, a number between 1 and 31')
   datetime_day.save
   datetime_today= Irm::FormulaFunction.new(:function_code=>'TODAY',:parameters=>'',:function_type => 'DATETIME',:not_auto_mult=>true)
   datetime_today.formula_functions_tls.build(:language=>'zh',:source_lang=>'en',:description=>'返回当前日期')
   datetime_today.formula_functions_tls.build(:language=>'en',:source_lang=>'en',:description=>'Returns the current date')
   datetime_today.save
   datetime_now= Irm::FormulaFunction.new(:function_code=>'NOW',:parameters=>'',:function_type => 'DATETIME',:not_auto_mult=>true)
   datetime_now.formula_functions_tls.build(:language=>'zh',:source_lang=>'en',:description=>'返回表示当前时刻的日期时间')
   datetime_now.formula_functions_tls.build(:language=>'en',:source_lang=>'en',:description=>'Returns a datetime representing the current moment')
   datetime_now.save
   logic_and= Irm::FormulaFunction.new(:function_code=>'AND',:parameters=>'logical1,logical2,...',:function_type => 'LOGIC',:not_auto_mult=>true)
   logic_and.formula_functions_tls.build(:language=>'zh',:source_lang=>'en',:description=>'检查是否所有参数均为真，如果所有参数均为真则返回 TRUE（真）')
   logic_and.formula_functions_tls.build(:language=>'en',:source_lang=>'en',:description=>'Checks whether all arguments are true and returns TRUE if all arguments are true')
   logic_and.save
   logic_case= Irm::FormulaFunction.new(:function_code=>'CASE',:parameters=>'expression, value1, result1, value2, result2,...,else_result',:function_type => 'LOGIC',:not_auto_mult=>true)
   logic_case.formula_functions_tls.build(:language=>'zh',:source_lang=>'en',:description=>'根据一系列值检查表达式。如果表达式比较等于任何值，则返回相应结果。如果不等于任何值，则返回 else（其他）结果')
   logic_case.formula_functions_tls.build(:language=>'en',:source_lang=>'en',:description=>'CASE(expression, value1, result1, value2, result2,...,else_result)')
   logic_case.save

   logic_if= Irm::FormulaFunction.new(:function_code=>'IF',:parameters=>'logical_test, value_if_true, value_if_false',:function_type => 'LOGIC',:not_auto_mult=>true)
   logic_if.formula_functions_tls.build(:language=>'zh',:source_lang=>'en',:description=>'检查条件是否为真，如果条件为 TRUE（真）则返回一个值；如果条件为 FALSE（假）则返回另一个值。')
   logic_if.formula_functions_tls.build(:language=>'en',:source_lang=>'en',:description=>'Checks whether a condition is true, and returns one value if TRUE and another value if FALSE.')
   logic_if.save

   logic_isnew= Irm::FormulaFunction.new(:function_code=>'ISNEW',:parameters=>'',:function_type => 'LOGIC',:not_auto_mult=>true)
   logic_isnew.formula_functions_tls.build(:language=>'zh',:source_lang=>'en',:description=>'检查记录是否是新的，如果是新的，则返回 TRUE（真）。否则返回 FALSE（假）。')
   logic_isnew.formula_functions_tls.build(:language=>'en',:source_lang=>'en',:description=>'Checks whether a condition is true, and returns one value if TRUE and another value if FALSE.')
   logic_isnew.save
   logic_isnull= Irm::FormulaFunction.new(:function_code=>'ISNULL',:parameters=>'expression',:function_type => 'LOGIC',:not_auto_mult=>true)
   logic_isnull.formula_functions_tls.build(:language=>'zh',:source_lang=>'en',:description=>'检查表达式是否为空以及是否返回 TRUE（真）或 FALSE（假）')
   logic_isnull.formula_functions_tls.build(:language=>'en',:source_lang=>'en',:description=>'Checks if the record is new, and returns TRUE if it is new. Otherwise, returns FALSE')
   logic_isnull.save
   logic_isnumber= Irm::FormulaFunction.new(:function_code=>'ISNUMBER',:parameters=>'Text',:function_type => 'LOGIC',:not_auto_mult=>true)
   logic_isnumber.formula_functions_tls.build(:language=>'zh',:source_lang=>'en',:description=>'文本值为数字时，返回 TRUE。反之，返回 FALSE。')
   logic_isnumber.formula_functions_tls.build(:language=>'en',:source_lang=>'en',:description=>'Checks whether an expression is null and returns TRUE or FALSE')
   logic_isnumber.save
   logic_not= Irm::FormulaFunction.new(:function_code=>'NOT',:parameters=>'logical',:function_type => 'LOGIC',:not_auto_mult=>true)
   logic_not.formula_functions_tls.build(:language=>'zh',:source_lang=>'en',:description=>'将 FALSE 改为 TRUE 或将 TRUE 改为 FALSE')
   logic_not.formula_functions_tls.build(:language=>'en',:source_lang=>'en',:description=>'Returns TRUE if the text value is a number. Otherwise, it returns FALSE.')
   logic_not.save
   logic_nullvalue= Irm::FormulaFunction.new(:function_code=>'NULLVALUE',:parameters=>'expression, substitute_expression',:function_type => 'LOGIC',:not_auto_mult=>true)
   logic_nullvalue.formula_functions_tls.build(:language=>'zh',:source_lang=>'en',:description=>'检查表达式是否为空，以及如果为空是否返回 substitute_expression。 如果表达式不为空，返回原始表达式值。')
   logic_nullvalue.formula_functions_tls.build(:language=>'en',:source_lang=>'en',:description=>'Changes FALSE to TRUE or TRUE to FALSE')
   logic_nullvalue.save
   logic_or= Irm::FormulaFunction.new(:function_code=>'OR',:parameters=>'logical1,logical2,…',:function_type => 'LOGIC',:not_auto_mult=>true)
   logic_or.formula_functions_tls.build(:language=>'zh',:source_lang=>'en',:description=>'检查任何参数是否为真，并返回 TRUE（真）或 FALSE（假）。仅当所有参数均为假时才返回 FALSE（假）')
   logic_or.formula_functions_tls.build(:language=>'en',:source_lang=>'en',:description=>'Checks whether expression is null and returns substitute_expression if it is null. If expression is not null, returns the original expression value.')
   logic_or.save
   math_max= Irm::FormulaFunction.new(:function_code=>'MAX',:parameters=>'number,number,...',:function_type => 'MATH',:not_auto_mult=>true)
   math_max.formula_functions_tls.build(:language=>'zh',:source_lang=>'en',:description=>'返回所有参数的最大值')
   math_max.formula_functions_tls.build(:language=>'en',:source_lang=>'en',:description=>'Checks whether any of the arguments are true and returns TRUE or FALSE. Returns FALSE only if all arguments are false')
   math_max.save
   math_min= Irm::FormulaFunction.new(:function_code=>'MIN',:parameters=>'number,number,...',:function_type => 'MATH',:not_auto_mult=>true)
   math_min.formula_functions_tls.build(:language=>'zh',:source_lang=>'en',:description=>'返回所有参数的最小值')
   math_min.formula_functions_tls.build(:language=>'en',:source_lang=>'en',:description=>'Returns the greatest of all the arguments')
   math_min.save
   math_mod= Irm::FormulaFunction.new(:function_code=>'MOD',:parameters=>'number,divisor',:function_type => 'MATH',:not_auto_mult=>true)
   math_mod.formula_functions_tls.build(:language=>'zh',:source_lang=>'en',:description=>'返回一个数值除以除数后的余数')
   math_mod.formula_functions_tls.build(:language=>'en',:source_lang=>'en',:description=>'Returns the remainder after a number is divided by a divisor')
   math_mod.save
   math_round= Irm::FormulaFunction.new(:function_code=>'ROUND',:parameters=>'number,num_digits',:function_type => 'MATH',:not_auto_mult=>true)
   math_round.formula_functions_tls.build(:language=>'zh',:source_lang=>'en',:description=>'按指定的位数舍入数值')
   math_round.formula_functions_tls.build(:language=>'en',:source_lang=>'en',:description=>'Rounds a number to a specified number of digits')
   math_round.save
   math_sqrt= Irm::FormulaFunction.new(:function_code=>'SQRT',:parameters=>'number',:function_type => 'MATH',:not_auto_mult=>true)
   math_sqrt.formula_functions_tls.build(:language=>'zh',:source_lang=>'en',:description=>'返回数值的正平方根')
   math_sqrt.formula_functions_tls.build(:language=>'en',:source_lang=>'en',:description=>'Returns the positive square root of a number')
   math_sqrt.save
   text_begins= Irm::FormulaFunction.new(:function_code=>'BEGINS',:parameters=>'text, compare_text',:function_type => 'TEXT',:not_auto_mult=>true)
   text_begins.formula_functions_tls.build(:language=>'zh',:source_lang=>'en',:description=>'检查文本是否以特定字符开头，如果是则返回 TRUE（真）。否则返回 FALSE（假）。')
   text_begins.formula_functions_tls.build(:language=>'en',:source_lang=>'en',:description=>'Checks if text begins with specified characters and returns TRUE if it does. Otherwise returns FALSE')
   text_begins.save
   text_br= Irm::FormulaFunction.new(:function_code=>'BR',:parameters=>'',:function_type => 'TEXT',:not_auto_mult=>true)
   text_br.formula_functions_tls.build(:language=>'zh',:source_lang=>'en',:description=>'在字符串公式中插入 HTML 断行标记')
   text_br.formula_functions_tls.build(:language=>'en',:source_lang=>'en',:description=>'Inserts an HTML break tag in string formulas')
   text_br.save
   text_contains= Irm::FormulaFunction.new(:function_code=>'CONTAINS',:parameters=>'text, compare_text',:function_type => 'TEXT',:not_auto_mult=>true)
   text_contains.formula_functions_tls.build(:language=>'zh',:source_lang=>'en',:description=>'检查文本是否包含特定字符，如果是则返回 TRUE（真）。否则返回 FALSE（假）。')
   text_contains.formula_functions_tls.build(:language=>'en',:source_lang=>'en',:description=>'Checks if text contains specified characters, and returns TRUE if it does. Otherwise, returns FALSE')
   text_contains.save
   text_find= Irm::FormulaFunction.new(:function_code=>'FIND',:parameters=>'search_text, text [, start_num]',:function_type => 'TEXT',:not_auto_mult=>true)
   text_find.formula_functions_tls.build(:language=>'zh',:source_lang=>'en',:description=>'返回文本中 search_text 字符串的位置')
   text_find.formula_functions_tls.build(:language=>'en',:source_lang=>'en',:description=>'Returns the position of the search_text string in text')
   text_find.save
   text_includes= Irm::FormulaFunction.new(:function_code=>'INCLUDES',:parameters=>'multiselect_picklist_field, text_literal',:function_type => 'TEXT',:not_auto_mult=>true)
   text_includes.formula_functions_tls.build(:language=>'zh',:source_lang=>'en',:description=>'确定多选选项列表字段中的任何值是否等于您指定的文本文字。')
   text_includes.formula_functions_tls.build(:language=>'en',:source_lang=>'en',:description=>'Determines if any value selected in a multi-select picklist field equals a text literal you specify.')
   text_includes.save
   text_ispickval= Irm::FormulaFunction.new(:function_code=>'ISPICKVAL',:parameters=>'picklist_field, text_literal',:function_type => 'TEXT',:not_auto_mult=>true)
   text_ispickval.formula_functions_tls.build(:language=>'zh',:source_lang=>'en',:description=>'检查选项列表字段的值是否等于一个字符串文字')
   text_ispickval.formula_functions_tls.build(:language=>'en',:source_lang=>'en',:description=>'Checks whether the value of a picklist field is equal to a string literal')
   text_ispickval.save
   text_left= Irm::FormulaFunction.new(:function_code=>'LEFT',:parameters=>'text, num_chars',:function_type => 'TEXT',:not_auto_mult=>true)
   text_left.formula_functions_tls.build(:language=>'zh',:source_lang=>'en',:description=>'返回从文本字符串左边算起的指定数量的字符')
   text_left.formula_functions_tls.build(:language=>'en',:source_lang=>'en',:description=>'Returns the specified number of characters from the start of a text string')
   text_left.save
   text_len= Irm::FormulaFunction.new(:function_code=>'LEN',:parameters=>'text',:function_type => 'TEXT',:not_auto_mult=>true)
   text_len.formula_functions_tls.build(:language=>'zh',:source_lang=>'en',:description=>'返回一个文本字符串所含的字符数')
   text_len.formula_functions_tls.build(:language=>'en',:source_lang=>'en',:description=>'Returns the number of characters in a text string')
   text_len.save
   text_lower= Irm::FormulaFunction.new(:function_code=>'LOWER',:parameters=>'text',:function_type => 'TEXT',:not_auto_mult=>true)
   text_lower.formula_functions_tls.build(:language=>'zh',:source_lang=>'en',:description=>'将该值中的所有字母转换为小写字母')
   text_lower.formula_functions_tls.build(:language=>'en',:source_lang=>'en',:description=>'Converts all letters in the value to lowercase')
   text_lower.save
   text_lpad= Irm::FormulaFunction.new(:function_code=>'LPAD',:parameters=>'text, padded_length [, pad_string]',:function_type => 'TEXT',:not_auto_mult=>true)
   text_lpad.formula_functions_tls.build(:language=>'zh',:source_lang=>'en',:description=>'使用空格或可选填充字符串填充在该值的左侧以使其长度达到 padded_length')
   text_lpad.formula_functions_tls.build(:language=>'en',:source_lang=>'en',:description=>'Pad the left side of the value with spaces or the optional pad string so that the length is padded_length')
   text_lpad.save
   text_mid= Irm::FormulaFunction.new(:function_code=>'MID',:parameters=>'text, start_num, num_chars',:function_type => 'TEXT',:not_auto_mult=>true)
   text_mid.formula_functions_tls.build(:language=>'zh',:source_lang=>'en',:description=>'给定字符串的起始位置和长度，返回字符串中间的字符')
   text_mid.formula_functions_tls.build(:language=>'en',:source_lang=>'en',:description=>'Returns character from the middle of a text string, given a starting position and length')
   text_mid.save
   text_right= Irm::FormulaFunction.new(:function_code=>'RIGHT',:parameters=>'text, num_chars',:function_type => 'TEXT',:not_auto_mult=>true)
   text_right.formula_functions_tls.build(:language=>'zh',:source_lang=>'en',:description=>'返回从文本字符串右边算起的指定数量的字符')
   text_right.formula_functions_tls.build(:language=>'en',:source_lang=>'en',:description=>'Returns the specified number of characters from the end of a text string')
   text_right.save
   text_rpad= Irm::FormulaFunction.new(:function_code=>'RPAD',:parameters=>'text, padded_length [, pad_string]',:function_type => 'TEXT',:not_auto_mult=>true)
   text_rpad.formula_functions_tls.build(:language=>'zh',:source_lang=>'en',:description=>'使用空格或可选填充字符串填充在该值的右侧以使其长度达到 padded_length')
   text_rpad.formula_functions_tls.build(:language=>'en',:source_lang=>'en',:description=>'Pad the right side of the value with spaces or the optional pad string so that the length is padded_length')
   text_rpad.save
   text_substitute= Irm::FormulaFunction.new(:function_code=>'SUBSTITUTE',:parameters=>'text, old_text, new_text',:function_type => 'TEXT',:not_auto_mult=>true)
   text_substitute.formula_functions_tls.build(:language=>'zh',:source_lang=>'en',:description=>'用 new_text 替换文本字符串中的 old_text。要替换文本字符串中的特定文本时，使用 SUBSTITUTE')
   text_substitute.formula_functions_tls.build(:language=>'en',:source_lang=>'en',:description=>'Substitutes new_text for old_text in a text string. Use SUBSTITUTE when you want to replace specific text in a text string')
   text_substitute.save
   text_text= Irm::FormulaFunction.new(:function_code=>'TEXT',:parameters=>'value',:function_type => 'TEXT',:not_auto_mult=>true)
   text_text.formula_functions_tls.build(:language=>'zh',:source_lang=>'en',:description=>'将一个值转换为使用标准显示格式的文本')
   text_text.formula_functions_tls.build(:language=>'en',:source_lang=>'en',:description=>'Converts a value to text using standard display format')
   text_text.save
   text_trim= Irm::FormulaFunction.new(:function_code=>'TRIM',:parameters=>'text',:function_type => 'TEXT',:not_auto_mult=>true)
   text_trim.formula_functions_tls.build(:language=>'zh',:source_lang=>'en',:description=>'从文本字符串中删除所有空格，单词之间的单个空格除外')
   text_trim.formula_functions_tls.build(:language=>'en',:source_lang=>'en',:description=>'Removes all spaces from a text string except for single spaces between words')
   text_trim.save
   text_upper= Irm::FormulaFunction.new(:function_code=>'UPPER',:parameters=>'text',:function_type => 'TEXT',:not_auto_mult=>true)
   text_upper.formula_functions_tls.build(:language=>'zh',:source_lang=>'en',:description=>'将该值中的所有字母转换为大写字母')
   text_upper.formula_functions_tls.build(:language=>'en',:source_lang=>'en',:description=>'Converts all letters in the value to uppercase')
   text_upper.save
   text_value= Irm::FormulaFunction.new(:function_code=>'VALUE',:parameters=>'text',:function_type => 'TEXT',:not_auto_mult=>true)
   text_value.formula_functions_tls.build(:language=>'zh',:source_lang=>'en',:description=>'将表示数值的文本字符串转换为数值')
   text_value.formula_functions_tls.build(:language=>'en',:source_lang=>'en',:description=>'Converts a text string that represents a number to a number')
   text_value.save
   advance_currentperson= Irm::FormulaFunction.new(:function_code=>'CURRENTPERSON',:parameters=>'',:function_type => 'ADVANCE',:not_auto_mult=>true)
   advance_currentperson.formula_functions_tls.build(:language=>'zh',:source_lang=>'en',:description=>'返回当前人员的ID')
   advance_currentperson.formula_functions_tls.build(:language=>'en',:source_lang=>'en',:description=>'Return current person id')
   advance_currentperson.save
  end

  def self.down
  end
end
