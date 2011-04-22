class ReprocessFullName < ActiveRecord::Migration
  def self.up
    Irm::Person.all.each do |p|
      p.process_full_name
      p.save
    end
  end

  def self.down
  end
end
