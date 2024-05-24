module Bookshelf
  module Persistence
    module Relations
      class Users < ROM::Relation[:sql]
        struct_namespace Entities
        # auto_struct true

        schema(:users, infer: true) do
        end

        use :pagination
        per_page 2
      end
    end
  end
end
