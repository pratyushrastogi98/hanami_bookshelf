# frozen_string_literal: true

module HomeService
  class Routes < Hanami::Routes
    scope "books" do
      get "/", to: "books.index", as: :all
      get "/:id", id: /\d+/, to: "books.show"  # => /home/books/:id
    end

    scope "authors" do
      get "/", to: "authors.index", as: :all
      get "/:id", id: /\d+/, to: "authors.show"  # => /home/authors/:id
    end
      
  end
end
