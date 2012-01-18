$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "significance/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "significance"
  s.version     = Significance::VERSION
  s.authors     = ["caleon"]
  s.email       = ["caleon@gmail.com"]
  s.homepage    = "http://github.com/caleon/significance"
  s.summary     = %q{Similar in behavior to Object#presence defined in ActiveSupport, Significance is a state which determines not just the blank-ness of an object but whether or not the non-blank object has any real-world value.}
  s.description = %q{Similar in behavior to Object#presence defined in ActiveSupport, Significance is a state which determines not just the blank-ness of an object but whether or not the non-blank object has any real-world value.}

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_development_dependency "rails"#, "~> 3.1.1"
  s.add_dependency 'activesupport', '>= 2.3.8'

  s.add_development_dependency "sqlite3"
end
