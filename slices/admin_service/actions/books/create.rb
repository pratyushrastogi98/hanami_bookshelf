module AdminService
  module Actions
    module Books
      class Create < Bookshelf::Action
        include Deps["persistence.rom"]

        params do
          required(:book).hash do
            required(:title).filled(:string)
            optional(:author_id).filled(:integer)
            optional(:images).filled(:array)
          end
        end

        def handle(request, response)
          response.format = :json
          if request.params.valid?
            book = Bookshelf::Persistence::Repositories::Books.new(rom)
                  .create(request.params[:book])
            # book = rom.relations[:books].changeset(:create, request.params[:book]).commit

            response.status = 201
            response.body = book.json_format
          else
            response.status = 422
            response.body = request.params.errors.to_json
          end
        end

      end
    end
  end
end
