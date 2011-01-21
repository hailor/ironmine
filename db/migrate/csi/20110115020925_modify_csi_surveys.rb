class ModifyCsiSurveys < ActiveRecord::Migration
  def self.up
    add_column :csi_surveys,:survey_code,:string,:limit=>30,:after=>:company_id
  end

  def self.down
    remove_column :csi_surveys,:survey_code
  end
end
