module Bookshelf
  module Persistence
    module Entities
      class User < ROM::Struct

        def first_name
          name.split(' ').first
        end
    
        def last_name
          name.split(' ').last
        end

        # 
        # convert the ROM::Struct object to json
        # 
        def json_format
          self.to_h.to_json
        end
      end
    end
  end
end
