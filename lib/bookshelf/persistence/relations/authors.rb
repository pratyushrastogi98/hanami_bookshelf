module Bookshelf
  module Persistence
    module Relations
      class Authors < ROM::Relation[:sql]
        struct_namespace Entities
        # auto_struct true

        schema(:authors, infer: true) do
          associations do
            has_many :books
          end
        end

        use :pagination
        per_page 2
      end
    end
  end
end
