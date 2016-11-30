$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "track_modifier/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "track_modifier"
  s.version     = TrackModifier::VERSION
  s.authors     = ["Yecheng Xu"]
  s.email       = ["xyc0562@gmail.com"]
  s.homepage    = "https://github.com/xyc0562/track_modifier"
  s.summary     = "Simple Gem for tracking modifier information in DB entries"
  s.description = "This Gem provides a declaration to be used in ActiveRecord model and a declaration to be used in" +
      " migration files for adding tracker fields to DB tables."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails"
  s.add_dependency 'request_store'

  s.add_development_dependency "sqlite3"
end
