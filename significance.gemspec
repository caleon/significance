# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "significance/version"

Gem::Specification.new do |s|
  s.name        = "significance"
  s.version     = Significance::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Caleon Chun"]
  s.email       = ["colin@juscribe.com"]
  s.homepage    = "http://www.juscribe.com/u/colin"
  s.summary     = %q{Similar in behavior to Object#presence defined in ActiveSupport, Significance is a state which determines not just the blank-ness of an object but whether or not the non-blank object has any real-world value.}
  s.description = %q{Similar in behavior to Object#presence defined in ActiveSupport, Significance is a state which determines not just the blank-ness of an object but whether or not the non-blank object has any real-world value.}

  s.rubyforge_project = "significance"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
