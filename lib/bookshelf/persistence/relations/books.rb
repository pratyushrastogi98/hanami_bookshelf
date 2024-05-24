module Bookshelf
  module Persistence
    module Relations
      class Books < ROM::Relation[:sql]
        struct_namespace Entities
        # auto_struct true

        schema(:books, infer: true) do
          associations do
            belongs_to :authors, as: :author
          end
        end

        use :pagination
        per_page 2
      end
    end
  end
end
