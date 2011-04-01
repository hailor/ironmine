class ReworkPersonField < ActiveRecord::Migration
  def self.up
    people = Irm::Person.all
    people.each do |p|
      i = p.identity
      p.update_attributes({:login_name=>i.login_name,:hashed_password=>i.hashed_password,:language_code=>i.language_code,:last_login_at=>i.last_login_at})
    end
  end

  def self.down
  end
end
