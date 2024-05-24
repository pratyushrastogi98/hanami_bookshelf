# frozen_string_literal: true

module HomeService
  module Actions
    module Books
      class Index < Bookshelf::Action
        include Deps["persistence.rom"]

        params do
          optional(:page).value(:integer, gt?: 0)
          optional(:per_page).value(:integer, gt?: 0, lteq?: 100)
        end

        def handle(request, response)
          halt 422, {errors: request.params.errors}.to_json unless request.params.valid?

          # fetching data by relations, we should prefere repository to abstract data layer
          # relations help in providing more control over complex queries
          books = rom.relations[:books]
            .select(:title, :author_id)
            .order(:title)
            .page(request.params[:page] || 1)
            .per_page(request.params[:per_page] || 5)
            .to_a

          response.format = :json
          response.body = books.to_json
        end
      end
    end
  end
end
