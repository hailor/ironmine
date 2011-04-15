namespace :irm do
  desc "(For Ironmine)Check and Sync Business Object ."
  task :initbo => :environment do
    all = ENV["ALL"]
    if all
      Irm::AutoInitBusinessObject.init(true)
    else
      Irm::AutoInitBusinessObject.init
    end
  end
end