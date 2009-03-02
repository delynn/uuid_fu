Dir.glob(File.join(File.dirname(__FILE__), 'uuid_fu', '**/*.rb')).each do |f|
  require File.expand_path(f)
end
