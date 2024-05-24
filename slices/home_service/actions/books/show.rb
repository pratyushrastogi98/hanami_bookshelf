# app/actions/books/show.rb

module HomeService
  module Actions
    module Books
      class Show < Bookshelf::Action
        include Deps["persistence.rom"]

        params do
          required(:id).value(:integer)
        end

        def handle(request, response)
          # fetching data by repository
          book = Bookshelf::Persistence::Repositories::Books.new(rom)
                .by_id(request.params[:id])
                .combine(:author)
                .one!

          response.format = :json
          if book
            response.body = book.json_format
          else
            response.status = 404
            response.body = {error: "Book with id: #{request.params[:id]} not found"}.to_json
          end
        end

      end
    end
  end
end
