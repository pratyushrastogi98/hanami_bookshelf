module AdminService
  module Actions
    module Books
      class Update < AdminService::Action
        include Deps["persistence.rom"]

        params do
          required(:id).value(:integer)
          required(:book).hash do
            optional(:title).filled(:string)
            optional(:author_id).filled(:integer)
          end
        end

        def handle(request, response)
          if request.params.valid?
            puts request.params[:id]
            puts request.params[:book][:title]
            books_repository = Bookshelf::Persistence::Repositories::Books.new(rom)
            book = books_repository.update(request.params[:id], title: request.params[:book][:title])

            response.status = 201
            response.body = book.json_format
          else
            response.status = 422
            response.format = :json
            response.body = request.params.errors.to_json
          end
        end
      end
    end
  end
end
