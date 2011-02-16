class InitAdminPerson < ActiveRecord::Migration
  def self.up
    admin = Irm::Person.new(:first_name=>'Administrator',:last_name=>"A",:identity_id=>2,:company_id=>1,:title=>"Mr",:email_address=>"admin@ironmine.com")
    admin.save unless Irm::Person.where(:identity_id=>2).count>0
  end
  def self.down
  end
end
