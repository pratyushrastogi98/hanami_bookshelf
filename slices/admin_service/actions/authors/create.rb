module HomeService
  module Actions
    module Authors
      class Create < Bookshelf::Action
        include Deps["persistence.rom"]

        params do
          required(:author).hash do
            required(:name).filled(:string)
            optional(:email).filled(:string)
            optional(:contact_no).filled(:integer)
          end
        end

        def handle(request, response)
          if request.params.valid?
            author = Bookshelf::Persistence::Repositories::Authors.new(rom)
                    .create(request.params[:author])

            response.status = 201
            response.body = author.json_format
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
