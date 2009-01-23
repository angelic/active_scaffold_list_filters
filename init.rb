# Include hook code here
ActiveScaffold rescue throw "should have included ActiveScaffold plug in first.  Please make sure that this plug-in comes alphabetically after the ActiveScaffold plug-in"

$:.unshift(File.dirname(__FILE__))

require "#{File.dirname(__FILE__)}/lib/pluginfactory.rb"
require "#{File.dirname(__FILE__)}/lib/active_scaffold/actions/list_filter.rb"
require "#{File.dirname(__FILE__)}/lib/active_scaffold/config/list_filter_core.rb"
require "#{File.dirname(__FILE__)}/lib/active_scaffold/config/list_filter.rb"
require "#{File.dirname(__FILE__)}/lib/active_scaffold/data_structures/list_filter.rb"
require "#{File.dirname(__FILE__)}/lib/active_scaffold/data_structures/list_filters.rb"
require "#{File.dirname(__FILE__)}/lib/active_scaffold/helpers/id_helpers_override.rb"
require "#{File.dirname(__FILE__)}/lib/active_scaffold/helpers/view_helpers_override.rb"

# custom filters
#Kernel::load 'lib/list_filters/base.rb'
#Kernel::load 'lib/list_filters/association.rb'

##
## Run the install script, too, just to make sure
## But at least rescue the action in production
##
begin
  require 'install'
rescue
  raise $! unless RAILS_ENV == 'production'
end