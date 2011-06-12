module HasMailbox
  module Models

    module ClassMethods
		def has_mailbox
		  class_eval do
		    has_many  :sent_messages, 
	                  :as => :sent_messageable,
	                  :class_name => "HasMailbox::Models::MessageCopy", 
	                  :dependent => :destroy
		    
		    has_many  :received_messages, 
	                  :as => :received_messageable, 
	                  :class_name => "HasMailbox::Models::Message", 
	                  :dependent => :destroy
	      	            
		  end
		  
		  include HasMailbox::Models::InstanceMethods
		end
    end

    module InstanceMethods
      def has_unread_messages?
        !inbox.exists?(:opened => false)
      end
      
      # send message instance method
      def send_message?(subject, body, *recipients)
      	begin
	    	send_message(subject, body, *recipients)
	    	true	
      	rescue Exception => e
      		false
      	end
      end	
	  
      def send_message(subject, body, *recipients)
      	recipients.each do |rec|  
			create_message_copy(subject, body, rec)
        	create_message(subject, body, rec)	
    	end	
      end	
    	
      # retrieve all sent/outgoing messages
      def outbox
		self.sent_messages
      end
      
      # retrieve all receiving messages
      def inbox
		self.received_messages.where(:deleted => false)
      end
	
      # retrieve all messages that being deleted (still in the trash but not yet destroyed)
	  def trash
	  	self.received_messages.where(:deleted => true)
  	  end
  	  	
		# to delete empty all of the messages  
		# inbox message will be move as a trash message,
		# outgoing messages / outbox will be deleted forever
		# and trash messages also will be deleted forever from the tables.
		#* ==== 	:options => :inbox, :outbox, :trash	
		#* ====	USAGE pass the parameter as boolean value
		#* ====	i.e : @user_obj.empty_mailbox(:trash => true)
		def empty_mailbox(options = {})
			if options.empty?
				self.sent_messages.delete_all
				self.received_messages.delete_all
			elsif options[:inbox]
				self.inbox.update_all(:deleted => true)
			elsif options[:outbox]
				self.outbox.delete_all
			elsif options[:trash]
				self.trash.delete_all
			end
		end
		
  	private 
  		# this is the private segment	
  		def create_message_copy(subject, body, recipient)
  			msg = HasMailbox::Models::MessageCopy.create!(:recipient_id => recipient.id, :subject => subject, :body => body)
  			self.sent_messages << msg	
  		end
  		
  		def create_message(subject, body, recipient)
  			msg = HasMailbox::Models::Message.create!(:sender_id => self.id, :subject => subject, :body => body)
  			recipient.received_messages << msg	
  		end
  	  
    end
	
  end
end