require 'rails/generators/migration'
require 'rails/generators/active_record'

module HasMailbox
	module Generators
		class MigrationGenerator < Rails::Generators::Base
		    include Rails::Generators::Migration
			
		    source_root File.join(File.dirname(__FILE__), 'templates')
		
		    def self.next_migration_number(dirname)
		        ActiveRecord::Generators::Base.next_migration_number(dirname)
		    end
		
		    def create_migration_file
		      migration_template 'create_messages_table.rb', 'db/migrate/create_messages_table.rb'
		      migration_template 'create_message_copies_table.rb', 'db/migrate/create_message_copies_table.rb'
		    end
		
		 end
	end
end
