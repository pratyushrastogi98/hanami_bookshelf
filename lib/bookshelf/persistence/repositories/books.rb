module Bookshelf
  module Persistence
    module Repositories
      class Books < ROM::Repository[:books]
        struct_namespace Entities # define namespace where entities are defined

        commands :create, update: :by_pk

        def all
          books.combine(:author).to_a
        end

        def query(conditions)
          books.where(conditions)
        end
      
        def find_by_id(id)
          by_id(id).one!
        end

        def by_id(id)
          books.by_pk(id)
        end
        
      end
    end
  end
end
