module Bookshelf
  module Persistence
    module Repositories
      class Authors < ROM::Repository[:authors]

        struct_namespace Entities # define namespace where entities are defined
        commands :create, update: :by_pk

        def all
          authors.to_a
        end

        def query(conditions)
          authors.where(conditions).to_a
        end
      
        def find_by_id(id)
          by_id(id).one!
        end

        def by_id(id)
          authors.by_pk(id)
        end
      
      end
    end
  end
end
