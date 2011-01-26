require 'spreadsheet'
class Array
  def to_xls(options = {})
    book = Spreadsheet::Workbook.new
    sheet = book.create_worksheet :name => options[:sheet_name]||"Sheet1"

    if self.any?
      klass      = self.first.class
      attributes = self.first.attributes.stringify_keys.keys.sort.map(&:to_sym)

      if options[:only]
        columns = Array(options[:only]) & attributes
      else
        columns = attributes - Array(options[:except])
      end

      columns += Array(options[:methods])

      if columns.any?
        row_count = sheet.row_count
        format = Spreadsheet::Format.new :color => :black,
                                           :weight => :bold
        sheet.row(row_count).default_format = format
        if options[:headers]&&options[:headers].is_a?(Array)
          options[:headers].each { |column| sheet.row(row_count).push "#{column}" }
        else
          columns.each { |column| sheet.row(row_count).push "#{klass.human_attribute_name(column)}" }
        end

        self.each do |item|
          couples = {}
          couples = item.attributes.symbolize_keys if item.attributes
          row_count = sheet.row_count
          columns.each do |column|
            value = nil
            value = item.send(column) if item.respond_to?(column) 
            value ||= couples[column]
            sheet.row(row_count).push value
          end
        end
      end
    end
    report = StringIO.new
    book.write(report)
    report.string

  end
  #将数组转化为Hash，方便将hash输出为excel
  def to_cus_hash
    arr_hash = {}
    self.each_index do |index|
      arr_hash.merge!({index.to_s.to_sym=>self[index]})    
    end
    arr_hash
  end
end

class Hash
  #使用to_xls识别hash
  def attributes
    self
  end
end
