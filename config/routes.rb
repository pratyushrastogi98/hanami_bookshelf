# frozen_string_literal: true

module Bookshelf
  class Routes < Hanami::Routes
    # Add your routes here. See https://guides.hanamirb.org/routing/overview/ for details.
    
    slice :home_service, at: "/home"

    slice :admin_service, at: "/admin"

    # slice :home_service, at: "/home" do
    #   scope "books" do
    #     get "/", to: "books.index", as: :all
    #     get "/:id", id: /\d+/, to: "books.show"  # => /home/books/:id
    #   end

    #   scope "authors" do
    #     get "/", to: "authors.index", as: :all
    #     get "/:id", id: /\d+/, to: "authors.show"  # => /home/authors/:id
    #   end
    # end

    # slice :admin_service, at: "/admin" do
    #   scope "users" do
    #     get "/", to: "users.index", as: :all
    #     get "/:id", id: /\d+/, to: "users.show"  # => /admin/users/:id
    #     post "/", to: "users.create"
    #   end

    #   scope "books" do
    #     post "/", to: "books.create"
    #     put "/:id", id: /\d+/, to: "books.update"  # => admin/books/:id
    #   end

    #   scope "authors" do
    #     post "/", to: "authors.create"  # => /home/authors/:id
    #   end      
  end
end
