# app/actions/authors/show.rb

module HomeService
  module Actions
    module Authors
      class Show < Bookshelf::Action
        include Deps["persistence.rom"]

        params do
          required(:id).value(:integer)
        end

        def handle(request, response)
          author = author_repository
                  .by_id(request.params[:id])
                  .combine(:books)
                  .one!

          response.format = :json

          if author
            response.body = author.json_format
          else
            response.status = 404
            response.body = {error: "author with id: #{request.params[:id]} not found"}.to_json
          end
        end

        def author_repository
          Bookshelf::Persistence::Repositories::Authors.new(rom)
        end
      end
    end
  end
end
