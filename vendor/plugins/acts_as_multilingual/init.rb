# Include hook code here
require File.dirname(__FILE__) + '/lib/acts_as_multilingual'
Ironmine::Acts::Multilingual::USABLE_LANGUAGE = Proc.new{['en','zh']}
ActiveRecord::Base.send(:include, Ironmine::Acts::Multilingual)
