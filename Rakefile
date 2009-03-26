require 'rake'
require 'rake/gempackagetask'
require 'rake/clean'
require 'rake/testtask'
require 'rake/rdoctask'
require 'find'
require 'rubyforge'
require 'rubygems'
require 'rubygems/gem_runner'
begin
  require 'shoulda'
  require 'shoulda/tasks'
rescue LoadError
end

@gem_spec = Gem::Specification.new do |s|
  s.name = "uuid_fu"
  s.version = "1.0.1"
  s.summary = "A gem that helps out with using UUIDs for primary keys in ActiveRecord objects."
  s.description = "Developed by: delynn@gmail.com"
  s.author = "DeLynn Berry"
  s.email = "delynn@gmail.com"
  s.homepage = "http://delynnberry.com"
  s.files = FileList['lib/**/*.*', 'README', 'doc/**/*.*', 'bin/**/*.*']
  s.require_paths = ['lib']
  s.extra_rdoc_files = ["README"]
  s.has_rdoc = true
  s.rubyforge_project = "uuid_fu"
  # s.test_files = FileList['spec/**/*']
  #s.bindir = "bin"
  #s.executables << "uuid_fu"
  #s.add_dependency("", "")
  #s.add_dependency("", "")
  #s.extensions << ""
  #s.required_ruby_version = ">= 1.8.6"
  #s.default_executable = ""
  #s.platform = "Gem::Platform::Ruby"
  #s.requirements << "An ice cold beer."
  #s.requirements << "Some free time!"
end

# rake package
Rake::GemPackageTask.new(@gem_spec) do |pkg|
  pkg.need_zip = false
  pkg.need_tar = false
  rm_f FileList['pkg/**/*.*']
end

task :default => :test
Rake::TestTask.new { |t| 
  t.libs << "test"
  t.pattern = 'test/unit/**/test_*.rb'
  t.verbose = true
  t.warning = true
}

desc 'regenerate the gemspec'
task :gemspec do
  File.open(File.join(File.dirname(__FILE__), 'uuid_fu.gemspec'), 'w') {|f| f.puts @gem_spec.to_ruby}
end

desc "Install the gem"
task :install => [:gemspec, :package] do |t|
  sudo = ENV['SUDOLESS'] == 'true' || RUBY_PLATFORM =~ /win32|cygwin/ ? '' : 'sudo'
  puts `#{sudo} gem install #{File.join("pkg", @gem_spec.name)}-#{@gem_spec.version}.gem --no-update-sources --no-ri --no-rdoc`
end

desc "Release the gem"
task :release => :install do |t|
  begin
    ac_path = File.join(ENV["HOME"], ".rubyforge", "auto-config.yml")
    if File.exists?(ac_path)
      fixed = File.open(ac_path).read.gsub("  ~: {}\n\n", '')
      fixed.gsub!(/    !ruby\/object:Gem::Version \? \n.+\n.+\n\n/, '')
      puts "Fixing #{ac_path}..."
      File.open(ac_path, "w") {|f| f.puts fixed}
    end
    begin
      rf = RubyForge.new
      rf.configure
      rf.login
      rf.add_release(@gem_spec.rubyforge_project, @gem_spec.name, @gem_spec.version, File.join("pkg", "#{@gem_spec.name}-#{@gem_spec.version}.gem"))
    rescue Exception => e
      if e.message.match("Invalid package_id") || e.message.match("no <package_id> configured for")
        puts "You need to create the package!"
        rf.create_package(@gem_spec.rubyforge_project, @gem_spec.name)
        rf.add_release(@gem_spec.rubyforge_project, @gem_spec.name, @gem_spec.version, File.join("pkg", "#{@gem_spec.name}-#{@gem_spec.version}.gem"))
      else
        raise e
      end
    end
  rescue Exception => e
    if e.message == "You have already released this version."
      puts e
    else
      raise e
    end
  end
end


Rake::RDocTask.new do |rd|
  rd.main = "README"
  files = Dir.glob("**/*.rb")
  files = files.collect {|f| f unless f.match("test/") || f.match("doc/") }.compact
  files << "README"
  rd.rdoc_files = files
  rd.rdoc_dir = "doc"
  rd.options << "--line-numbers"
  rd.options << "--inline-source"
  rd.title = "uuid_fu"
end
