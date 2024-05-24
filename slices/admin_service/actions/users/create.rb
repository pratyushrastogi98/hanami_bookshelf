module AdminService
  module Actions
    module Users
      class Create < Bookshelf::Action
        include Deps["persistence.rom"]

        params do
          required(:user).hash do
            required(:name).filled(:string)
            required(:type).filled(:string)
            optional(:email).filled(:string)
          end
        end

        def handle(request, response)
          if request.params.valid?
            user = Bookshelf::Persistence::Repositories::Users.new(rom)
                    .create(request.params[:user])
            response.status = 201
            response.body = user.json_format
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
