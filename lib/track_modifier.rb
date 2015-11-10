require 'active_support'
require 'active_support/concern'
require 'active_record'
require 'track_modifier/base'
require 'track_modifier/connection_adapters'

module TrackModifier
  ActiveRecord::Base.send :include, TrackModifier::Base
  ActiveRecord::ConnectionAdapters::SchemaStatements.send :include, TrackModifier::ConnectionAdapters::SchemaStatements
end
