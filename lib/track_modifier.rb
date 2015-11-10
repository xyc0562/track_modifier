require 'active_support'
require 'active_support/concern'
require 'active_record'
require 'track_modifier/base'
require 'track_modifier/migration'

module TrackModifier
  ActiveRecord::Base.send :include, TrackModifier::Base
  ActiveRecord::Migration.send :include, TrackModifier::Migration
end
