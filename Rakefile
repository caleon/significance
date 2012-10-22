# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "significance"
  gem.homepage = "http://github.com/caleon/significance"
  gem.license = "MIT"
  gem.summary = %Q{Similar in behavior to Object#presence defined in ActiveSupport, Significance is a state which determines not just the blank-ness of an object but whether or not the non-blank object has any real-world value.}
  gem.description = <<-DESC
    Similar in behavior to Object#presence defined in ActiveSupport,
    Significance is a state which determines not just the blank-ness of an
    object but whether or not the non-blank object has any real-world value.
    The utility of this gem can best be demonstrated when considering the
    merging of two hashes. Under normal circumstances the mere existence of an
    equivalent key in the second hash results in its overriding the
    corresponding value in the original hash. Using Hash#significant_merge,
    however, the second hash will retain only key-value pairs whose values are
    "significant," even applying the significance filter recursively into child
    hashes or arrays.
  DESC
  gem.email = "caleon@gmail.com"
  gem.authors = ["caleon"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "Significance #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
