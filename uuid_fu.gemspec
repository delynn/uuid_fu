# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{uuid_fu}
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["delynn@gmail.com"]
  s.date = %q{2009-03-01}
  s.description = %q{uuid_fu was developed by: delynn@gmail.com}
  s.email = %q{}
  s.extra_rdoc_files = ["README"]
  s.files = ["lib/uuid_fu/schema_statements.rb", "lib/uuid_fu/uuid_fu.rb", "lib/uuid_fu.rb", "README"]
  s.has_rdoc = true
  s.homepage = %q{}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{uuid_fu}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{uuid_fu}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
