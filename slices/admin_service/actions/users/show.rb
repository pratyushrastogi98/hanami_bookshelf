# app/actions/authors/show.rb

module AdminService
  module Actions
    module Users
      class Show < Bookshelf::Action
        include Deps["persistence.rom"]

        params do
          required(:id).value(:integer)
        end

        def handle(request, response)
          user = user_repository.find_by_id(request.params[:id])

          response.format = :json
          if user
            response.body = user.json_format
          else
            response.status = 404
            response.body = {error: "user with id: #{request.params[:id]} not found"}.to_json
          end
        end

        def user_repository
          Bookshelf::Persistence::Repositories::Users.new(rom)
        end
      end
    end
  end
end
