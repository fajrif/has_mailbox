module HasMailbox
	module Models
	  class MessageCopy < ::ActiveRecord::Base
	  	belongs_to :sent_messageable, :polymorphic => true
	  	
	    attr_accessible :sent_messageable_type,
	                    :sent_messageable_id,
	                    :recipient_id,
	    				:subject,
	                    :body
	    
	    validates_presence_of :recipient_id, :subject, :body
	    
	    default_scope order('created_at desc')
	    
	    def delete
	      self.destroy
	    end
	    
	    def from
			"#{self.sent_messageable_type}".constantize.find_by_id(self.sent_messageable_id)
		end
		
		def to
			"#{self.sent_messageable_type}".constantize.find_by_id(self.recipient_id)
		end
	    
	  end
	end
end
