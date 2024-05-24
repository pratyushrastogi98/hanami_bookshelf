# frozen_string_literal: true

module AdminService
  class Routes < Hanami::Routes
    scope "users" do
      get "/", to: "users.index", as: :all
      get "/:id", id: /\d+/, to: "users.show"  # => /admin/users/:id
      post "/", to: "users.create"
    end

    scope "books" do
      post "/", to: "books.create"
      put "/:id", id: /\d+/, to: "books.update"  # => admin/books/:id
    end

    scope "authors" do
      post "/", to: "authors.create"  # => /home/authors/:id
    end
      
  end
end
