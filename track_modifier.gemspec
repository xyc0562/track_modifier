$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "track_modifier/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "track_modifier"
  s.version     = TrackModifier::VERSION
  s.authors     = ["Yecheng Xu"]
  s.email       = ["xyc0562@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of TrackModifier."
  s.description = "TODO: Description of TrackModifier."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.4"
  s.add_dependency 'request_store', '~> 1.2.0'

  s.add_development_dependency "sqlite3"
end
