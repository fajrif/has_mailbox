module HasMailbox
	module Generators
		class InstallGenerator < Rails::Generators::Base
			source_root File.join(File.dirname(__FILE__), 'templates')
			
			desc "Create views, javascripts and stylesheets files for mailboxes controller."
		
			def copy_stylesheet
				copy_file 'mailboxes.css', 'public/stylesheets/mailboxes.css'
				copy_file 'token-input-facebook.css', 'public/stylesheets/token-input-facebook.css'
			end
			
			def copy_javascript
				copy_file 'mailboxes.js', 'public/javascripts/mailboxes.js'
				copy_file 'jquery.tokeninput.js', 'public/javascripts/jquery.tokeninput.js'
			end
		
			def copy_views
				copy_file "views/_head.html.erb", "app/views/mailboxes/_head.html.erb"
				copy_file "views/_messages.html.erb", "app/views/mailboxes/_messages.html.erb"
				copy_file "views/_tabs_panel.html.erb", "app/views/mailboxes/_tabs_panel.html.erb"
				copy_file "views/index.html.erb", "app/views/mailboxes/index.html.erb"
				copy_file "views/index.js.erb", "app/views/mailboxes/index.js.erb"
				copy_file "views/new.html.erb", "app/views/mailboxes/new.html.erb"
				copy_file "views/show.html.erb", "app/views/mailboxes/show.html.erb"
			end
		
			def show_readme
				readme "README"
			end
		end	
	end
end
