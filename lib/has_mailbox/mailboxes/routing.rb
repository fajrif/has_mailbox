module ActionDispatch::Routing

  class Mapper

    def mailboxes_for(user_class_name,mapping = {})

      user_class_name = user_class_name.to_s.singularize.titleize

      HasMailbox::Controllers::MethodHelpers.define_methods(user_class_name,mapping)

      get "/mailboxes" => "mailboxes#index", :as => "mailboxes"
      get "/mailboxes/:mailbox" => "mailboxes#index", :as => "box_mailboxes"
      get "/mailbox/new" => "mailboxes#new", :as => "new_mailboxes"
      post "/mailbox/create" => "mailboxes#create", :as => "create_mailboxes"
      post "/mailbox/update" => "mailboxes#update", :as => "update_mailboxes"
      get "/mailbox/token" => "mailboxes#token", :as => "token_mailboxes"
      get "/mailbox/show/:mailbox/:id" => "mailboxes#show", :as => "show_mailboxes"

    end

  end
end
