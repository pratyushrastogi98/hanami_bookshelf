module Bookshelf
  module Persistence
    module Repositories
      class Users < ROM::Repository[:users]

        struct_namespace Entities # define namespace where entities are defined
        commands :create, update: :by_pk

        def all
          users.to_a
        end

        def query(conditions)
          users.where(conditions).to_a
        end
      
        def find_by_id(id)
          by_id(id).one!
        end

        def by_id(id)
          users.by_pk(id)
        end
      
      end
    end
  end
end
