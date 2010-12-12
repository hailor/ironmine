class AddIronmineIdentity < ActiveRecord::Migration
  def self.up
    ironmine_identity = Irm::Identity.new(:login_name=>'ironmine',
                                          :password=>'123456',
                                          :password_confirmation=>'123456',
                                          :full_name=>'Ironmine',
                                          :language_code=>'zh',
                                          :email=>'ironmine@gmail.com')
    ironmine_identity.save()
  end

  def self.down
    Irm::Identity.where(:login_name=>'ironmine').first.destroy
  end
end
