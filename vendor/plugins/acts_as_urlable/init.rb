# Include hook code here
require File.dirname(__FILE__) + '/lib/acts_as_urlable'
ActiveRecord::Base.send(:include, Ironmine::Acts::Urlable)
