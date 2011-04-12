require "active_record"

$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'has_mailbox/has_mailbox'
require 'has_mailbox/models/message'
require 'has_mailbox/models/message_copies'
require 'has_mailbox/controllers/method_helpers'
require 'has_mailbox/mailboxes/routing'
require 'has_mailbox/mailboxes/engine' if defined?(Rails) && Rails::VERSION::MAJOR == 3

$LOAD_PATH.shift

ActiveRecord::Base.extend HasMailbox::Models::ClassMethods if defined? ActiveRecord::Base
