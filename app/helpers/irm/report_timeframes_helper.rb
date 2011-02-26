module Irm::ReportTimeframesHelper
  def get_current_report_column(report_code)
    current_report_column = Irm::ReportTimeframes.multilingual.
                                   query_by_report_code(report_code).query_by_timeframes
    current_report_column
  end
end
