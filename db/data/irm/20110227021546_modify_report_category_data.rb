class ModifyReportCategoryData < ActiveRecord::Migration
  def self.up
    reports = Irm::Report.query_by_category_code("INCIDENT")
    reports.each do |t|
       t.update_attribute(:category_code,"INCIDENT_REQUEST")
    end
  end

  def self.down
  end
end
