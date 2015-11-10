module TrackModifier
  module Base
    extend ActiveSupport::Concern

    module InstanceMethods
      # If current user is nil, don't do anything
      def track_created_by
        if (uid = RequestStore.store[:current_user_id])
          self.created_by_id = uid
          self.updated_by_id = uid
        end
      end

      def track_updated_by
        if (uid = RequestStore.store[:current_user_id])
          self.updated_by_id = uid unless self.destroyed?
        end
      end
    end

    module ClassMethods
      # Add tracker hooks
      def trackable(options = {})
        if self.respond_to?(:acting_as) && self.acting_as.respond_to?(:created_by)
          before_update do
            track_updated_by unless self.acting_as.changed?
          end
        else
          belongs_to :created_by, class_name: TrackModifier.config.user_class, foreign_key: :created_by_id
          belongs_to :updated_by, class_name: TrackModifier.config.user_class, foreign_key: :updated_by_id

          before_create do
            track_created_by
          end
          before_update do
            track_updated_by
          end
          # Necessary for soft deletes
          before_destroy do
            :track_updated_by
          end
        end
      end
    end
  end
end
