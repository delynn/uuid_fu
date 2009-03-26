# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{uuid_fu}
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["DeLynn Berry"]
  s.date = %q{2009-03-25}
  s.description = %q{Developed by: delynn@gmail.com}
  s.email = %q{delynn@gmail.com}
  s.extra_rdoc_files = ["README"]
  s.files = ["lib/uuid_fu/schema_statements.rb", "lib/uuid_fu/uuid_fu.rb", "lib/uuid_fu.rb", "README", "doc/classes/UuidFu/ClassMethods.html", "doc/classes/UuidFu/SchemaStatements/InstanceMethods.html", "doc/classes/UuidFu/SchemaStatements.html", "doc/classes/UuidFu.html", "doc/created.rid", "doc/files/lib/uuid_fu/schema_statements_rb.html", "doc/files/lib/uuid_fu/uuid_fu_rb.html", "doc/files/lib/uuid_fu_rb.html", "doc/files/README.html", "doc/fr_class_index.html", "doc/fr_file_index.html", "doc/fr_method_index.html", "doc/index.html", "doc/rdoc-style.css"]
  s.has_rdoc = true
  s.homepage = %q{http://delynnberry.com}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{uuid_fu}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{A gem that helps out with using UUIDs for primary keys in ActiveRecord objects.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
