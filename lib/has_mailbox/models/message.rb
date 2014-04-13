module HasMailbox
  module Models
    class Message < ::ActiveRecord::Base
      belongs_to :received_messageable, :polymorphic => true

      validates_presence_of :sender_id, :subject, :body

      default_scope order('created_at desc')

      def read?
        self.opened?
      end

      def mark_as_read
        self.update_attributes!(:opened => true)
      end

      def mark_as_unread
        self.update_attributes!(:opened => false)
      end

      def delete
        unless self.deleted?
          self.update_attributes!(:deleted => true)
        else
          self.destroy
        end
      end

      def undelete
        self.update_attributes!(:deleted => false)
      end

      def from
        "#{self.received_messageable_type}".constantize.find_by_id(self.sender_id)
      end

      def to
        "#{self.received_messageable_type}".constantize.find_by_id(self.received_messageable_id)
      end

    end
  end
end
