require 'common_helper'

Dir["#{File.dirname(__FILE__)}/pages/*/*_section.rb"].each { |r| load r }
Dir["#{File.dirname(__FILE__)}/pages/*_page.rb"].each { |r| load r }
