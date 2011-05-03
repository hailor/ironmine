# Include hook code here
require File.dirname(__FILE__) + '/lib/acts_as_recently_objects'
ActiveRecord::Base.send(:include, Ironmine::Acts::RecentlyObjects)