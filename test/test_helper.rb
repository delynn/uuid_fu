require 'rubygems'
require 'test/unit'
begin
  require 'shoulda'
  require 'mocha'
rescue LoadError
end

require File.join(File.dirname(__FILE__), '..', 'lib', 'uuid_fu')
