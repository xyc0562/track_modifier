require 'active_support/concern'

module TrackModifier
  module Migration
    extend ActiveSupport::Concern

    def add_trackable(table_name)
      add_column table_name, :created_by_id, :integer, null: true
      add_column table_name, :updated_by_id, :integer, null: true
      add_foreign_key table_name, :users, column: :created_by_id
      add_foreign_key table_name, :users, column: :updated_by_id
      add_index table_name, :created_by_id
      add_index table_name, :updated_by_id
    end

    def remove_trackable(table_name)
      remove_columns table_name, :created_by_id, :updated_by_id
    end

  end
end
